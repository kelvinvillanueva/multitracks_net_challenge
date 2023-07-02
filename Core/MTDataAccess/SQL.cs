using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess
{
    public partial class SQL
    {
        private SqlConnection connection;
        private SqlTransaction transaction;
        private SqlCommand command;

        public parameters Parameters = new parameters();

        private bool autoOpen = false;

        public int Timeout = 30;

        private string connectionString = "";



        public SQL(int timeout)
            : this("admin")
        {
            Timeout = timeout;
        }

        public SQL()
            : this("admin")
        {
        }

        public SQL(string connectionStringName, bool isFromApi = false)
        {
            if (isFromApi)
                connectionString = connectionStringName;
            else
            {
                if (ConfigurationManager.ConnectionStrings[connectionStringName] == null)
                    throw new Exception("\"" + connectionStringName + "\" connection string not found in config file.");
                else
                    connectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ToString();

            }
        }

        public SQL(string connectionStringName, int timeout)
            : this(connectionStringName)
        {
            Timeout = timeout;
        }

        public void OpenConnection()
        {
            connection = new SqlConnection(connectionString);
            connection.Open();
            command = connection.CreateCommand();
        }
        public void BeginTransaction()
        {
            if (!isConnnectionOpen())
                throw new Exception("Connection is not open. Unable to Begin Transaction.");

            transaction = connection.BeginTransaction();
            command.Transaction = transaction;
        }

        public void Rollback()
        {
            transaction.Rollback();

            transaction.Dispose();
            command.Transaction = null;
        }

        public void Commit()
        {
            transaction.Commit();

            transaction.Dispose();
            command.Transaction = null;
        }

        private T InternalExecuteScalar<T>(string query, bool clearParameters, CommandType commandType)
        {
            prepare();

            T ret;

            command.CommandType = commandType;
            command.CommandText = query;
            command.CommandTimeout = Timeout;

            addParameters();

            ret = (T)command.ExecuteScalar();

            if (clearParameters)
                Parameters.Clear();

            cleanUp();

            return ret;
        }

        private int InternalExecute(string query, bool clearParameters, CommandType commandType)
        {
            prepare();

            int ret;

            command.CommandType = commandType;
            command.CommandText = query;
            command.CommandTimeout = Timeout;

            addParameters();

            ret = command.ExecuteNonQuery();

            if (clearParameters)
                Parameters.Clear();

            cleanUp();

            return ret;
        }

        private DataTable InternalExecuteDT(string query, bool clearParameters, CommandType commandType)
        {
            prepare();

            command.CommandType = commandType;
            command.CommandText = query;
            command.CommandTimeout = Timeout;

            DataTable ret = new DataTable();

            addParameters();

            ret.Load(command.ExecuteReader());

            if (clearParameters)
                Parameters.Clear();

            cleanUp();

            return ret;
        }

        private DataSet InternalExecuteDS(string query, bool clearParameters, CommandType commandType)
        {
            prepare();

            command.CommandType = commandType;
            command.CommandText = query;
            command.CommandTimeout = Timeout;

            DataSet ret = new DataSet();

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = command;

            addParameters();

            da.Fill(ret);

            if (clearParameters)
                Parameters.Clear();

            cleanUp();

            return ret;
        }

        private SqlDataReader InternalExecuteDataReader(string query, bool clearParameters, CommandType commandType)
        {
            prepare();

            command.CommandType = commandType;
            command.CommandText = query;
            command.CommandTimeout = Timeout;

            addParameters();

            var reader = command.ExecuteReader();

            if (clearParameters)
                Parameters.Clear();

            return reader;
        }

        public int Execute(string query, bool clearParameters = false)
        {
            return InternalExecute(query, clearParameters, CommandType.Text);
        }

        public int ExecuteStoredProcedure(string query, bool clearParameters = false)
        {
            return InternalExecute(query, clearParameters, CommandType.StoredProcedure);
        }

        public DataTable ExecuteDT(string query, bool clearParameters = false)
        {
            return InternalExecuteDT(query, clearParameters, CommandType.Text);
        }

        public DataTable ExecuteStoredProcedureDT(string query, bool clearParameters = false)
        {
            return InternalExecuteDT(query, clearParameters, CommandType.StoredProcedure);
        }

        public DataSet ExecuteDS(string query, bool clearParameters = false)
        {
            return InternalExecuteDS(query, clearParameters, CommandType.Text);
        }

        public DataSet ExecuteStoredProcedureDS(string query, bool clearParameters = false)
        {
            return InternalExecuteDS(query, clearParameters, CommandType.StoredProcedure);
        }

        public SqlDataReader ExecuteStoredProcedureDataReader(string query, bool clearParameters = false)
        {
            return InternalExecuteDataReader(query, clearParameters, CommandType.StoredProcedure);
        }


        public T ExecuteStoredProcedureScalar<T>(string query, bool clearParameters = false)
        {
            return InternalExecuteScalar<T>(query, clearParameters, CommandType.StoredProcedure);
        }

        public T ExecuteScalar<T>(string query, bool clearParameters = false)
        {
            return InternalExecuteScalar<T>(query, clearParameters, CommandType.Text);
        }

        private void prepare()
        {
            if (!isConnnectionOpen())
            {
                autoOpen = true;
                OpenConnection();
            }
        }

        private void cleanUp()
        {
            if (autoOpen)
            {
                CloseConnection();
                autoOpen = false;
            }
        }

        private void addParameters()
        {
            command.Parameters.Clear();

            foreach (SqlParameter param in Parameters.List)
            {
                command.Parameters.Add(param);
            }
        }

        public void CloseReader(SqlDataReader reader)
        {
            reader.Close();

            command.Dispose();
            command = null;

            connection.Close();
            connection.Dispose();
            connection = null;
        }
        public void CloseConnection()
        {
            command.Dispose();
            command = null;

            connection.Close();
            connection.Dispose();
            connection = null;
        }

        private bool isConnnectionOpen()
        {
            return (connection != null && connection.State != ConnectionState.Closed);
        }


        public class parameters
        {
            public List<SqlParameter> List = new List<SqlParameter>();

            public SqlParameter this[string parameterName]
            {
                get
                {
                    foreach (SqlParameter param in List)
                    {
                        if (param.ParameterName == parameterName)
                            return param;
                    }
                    return null;
                }
            }

            public SqlParameter this[int parameterIndex]
            {
                get
                {
                    return List[parameterIndex];
                }
            }

            public void Clear()
            {
                List.Clear();
            }

            public void Add(SqlParameter parameter)
            {
                List.Add(parameter);
            }

            public void Add(string parameterName, SqlDbType type, ParameterDirection direction)
            {
                SqlParameter param = new SqlParameter(parameterName, type);
                param.SqlDbType = type;
                param.Direction = direction;
                List.Add(param);
            }


            public void Add(string parameterName, SqlDbType type, object value, byte precision, int size, ParameterDirection direction)
            {
                SqlParameter param = new SqlParameter(parameterName, type);
                param.SqlDbType = type;
                param.Value = value;
                param.Precision = precision;
                param.Size = size;
                param.Direction = direction;
                List.Add(param);
            }

            public void Add(string parameterName, SqlDbType type, object value, byte precision, int size)
            {
                SqlParameter param = new SqlParameter(parameterName, type);
                param.SqlDbType = type;
                param.Value = value;
                param.Precision = precision;
                param.Size = size;
                List.Add(param);
            }

            public void Add(string parameterName, SqlDbType type, object value, byte precision)
            {
                SqlParameter param = new SqlParameter(parameterName, type);
                param.SqlDbType = type;
                param.Value = value;
                param.Precision = precision;
                List.Add(param);
            }

            public void Add(string parameterName, SqlDbType type, byte precision)
            {
                SqlParameter param = new SqlParameter(parameterName, type);
                param.SqlDbType = type;
                param.Precision = precision;
                List.Add(param);
            }


            public void Add(string parameterName, SqlDbType type, object value)
            {
                SqlParameter param = new SqlParameter(parameterName, type);
                param.SqlDbType = type;
                param.Value = value;
                List.Add(param);
            }

            public void Add(string parameterName, object value)
            {
                SqlParameter param = new SqlParameter(parameterName, value);
                List.Add(param);
            }

            public void Add(string parameterName, SqlDbType type)
            {
                SqlParameter param = new SqlParameter(parameterName, type);
                param.SqlDbType = type;
                List.Add(param);
            }


        }

    }

}
