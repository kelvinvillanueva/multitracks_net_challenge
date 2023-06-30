<%@ Page Language="C#" AutoEventWireup="true" CodeFile="artistsIndex.aspx.cs" Inherits="PageToSync_artistsIndex" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- set the viewport width and initial-scale on mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

	<!-- set the encoding of your site -->
	<meta charset="utf-8">
	<title>MultiTracks.com</title>
	<!-- include the site stylesheet -->
	
	<link media="all" rel="stylesheet" href="./css/index.css">
</head>
 
    	<body class="premium standard u-fix-fancybox-iframe">
		<form id="form1" runat="server">
			<noscript>
				<div>Javascript must be enabled for the correct page display</div>
			</noscript>

			<!-- allow a user to go to the main content of the page -->
			<a class="accessibility" href="#main" tabindex="21">Skip to Content</a>

			<div class="wrapper mod-standard mod-gray">
				<div class="details-banner">
					<div class="details-banner--overlay"></div>
					<div class="details-banner--hero">
						<img class="details-banner--hero--img" src="./img/31.jpg" 
						srcset="./img/31.jpg, 
						./img/31.jpg 2x" alt="Bethel Music">
					</div>
				 
				</div>
 

				<div class="discovery--container u-container">
							<main class="discovery--section">

								<section class="standard--holder">
									<div class="discovery--section--header">
										<h2>Artists</h2>
									</div><!-- /.discovery-select -->

                           <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
        <table id="playlist" style="text-align:left" >
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Title</th>
                    <th>Biography</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr  >
            
            <td class="song-list--item--player-img media-player">
                <img class="song-list--item--player-img--img" src='<%# Eval("imageURL") %>' alt="Way Maker">
            </td>
            <td class="song-list--item--right">
                    <a href='artistDetails.aspx?artistId=<%# Eval("artistId") %>' 
                        class="song-list--item--primary"><%# Eval("title") %></a>
  </td>
            <td>
                <a ><%# Limit(Eval("biography"),35) %></a>
            </td>
            <td class="song-list--item--icon--holder">
                <a href="#" class="song-list--item--icon--wrap" style="display: inline-block"></a>
                <a href="#" class="song-list--item--icon--wrap" style="display: inline-block"></a>
                <a href="#" class="song-list--item--icon--wrap" style="display: inline-block"></a>
                <a href="#" class="song-list--item--icon--wrap" style="display: inline-block"></a>
                <a href="#" class="song-list--item--icon--wrap" style="display: inline-block"></a>
                <a href="#" class="song-list--item--icon--wrap" style="display: inline-block"></a>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
            </tbody>
        </table>
    </FooterTemplate>
</asp:Repeater>

								</section><!-- /.songs-section -->

								 			</main><!-- /.discovery-section -->
				</div><!-- /.standard-container -->
			</div><!-- /.wrapper -->
            
			

			<a class="accessibility" href="#wrapper" tabindex="20">Back to top</a>
		</form>
			<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function () {
		 
        $('#playlist').DataTable({
            lengthChange: false, 
            columnDefs: [
                { orderable: false, targets: [0, 2] } 
            ]
        });

    });  

</script>

	</body>
 
</html>
