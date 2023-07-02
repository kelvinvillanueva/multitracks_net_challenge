<%@ Page Language="C#" AutoEventWireup="true" CodeFile="artistDetails.aspx.cs" Inherits="PageToSync_artistDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- set the viewport width and initial-scale on mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

	<!-- set the encoding of your site -->
	<meta charset="utf-8">
	<title>MultiTracks.com</title>
	<!-- include the site stylesheet -->
	
	      <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-32x32.png" type="image/png">
      <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-svg2.svg" type="image/svg+xml">
      <meta name="theme-color" content="#ffffff">
      <link media="all" rel="stylesheet" href="https://mtracks.azureedge.net/public/css/v22/main.min.css?v=4">
      <style type="text/css">.is-slide-hidden{position:absolute;left:-9999px;top:-9999px;display:block;}</style>
	<link media="all" rel="stylesheet" href="./css/index.css">
  
</head>
 
    	<body class="premium standard u-fix-fancybox-iframe">
		<form id="form1" runat="server">
			<noscript>
				<div>Javascript must be enabled for the correct page display</div>
			</noscript>
			    <header class="header mod-interior remodal-bg">
            <div class="header--holder">
                <div class="header--mobile js-media-search-mobile-container">
                    <a class="header--mobile--logo" href="/resources">
                        <img src="//mtracks.azureedge.net/public/images/site/logo/en/logo-mono.svg" id="header_logo" class="header--mobile--logo--img mod-full" alt="MultiTracks.com">
                        <svg class="header--mobile--logo--img mod-mark">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/images/sprite.symbol.svg#mt-death-star"></use>
                        </svg>
                    </a>
                    <div class="header--mobile--right">
                        <div class="header--mobile--search search">
                            <input accesskey="4" type="text" placeholder="Search" class="search--input input mod-search js-media-search-mobile" name="" value="">
                            <a href="#" class="search--submit js-media-search-mobile-btn">
                                <svg class="search--submit--icon">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/images/sprite.symbol.svg#Search-Input"></use>
                                </svg>
                            </a>
                        </div>
                        <a href="#" class="header--mobile--search--close btn-text js-media-search-mobile-close">Cancel</a>
                    </div>
                </div>
                <div class="header--left">
                    <a class="header--left--logo" href="/default.aspx">
                        <img src="//mtracks.azureedge.net/public/images/site/logo/en/logo-mono.svg" id="header_logoFull" class="header--left--logo--img mod-full" alt="MultiTracks.com"></a>
                    <div class="header--mobile mod-right">
                        <a class="header--mobile--link js-click-show-account" href="#">
                            <svg class="header--mobile--link--icon">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/images/sprite.symbol.svg#account"></use>
                            </svg>
                        </a>
                    </div>
                </div>
                <div class="header--right"></div>
            </div>
        </header>
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
					<div class="details-banner--info">
						<a href="#" class="details-banner--info--box">
								<img class="details-banner--info--box--img"
								 src="./img/174.jpg"
								 srcset="./img/174-sm.jpg,
								 			./img/174.jpg 2x"
							     alt="alt">
						</a>
						<h1 class="details-banner--info--name"><a class="details-banner--info--name--link" href="#">
							  
							<asp:Label ID="lblArtistName" runat="server"></asp:Label> Music
						                                       </a></h1>
					</div>
				</div>

				<nav class="discovery--nav">
					<ul class="discovery--nav--list tab-filter--list u-no-scrollbar">
						<li class="discovery--nav--list--item tab-filter--item is-active">
							<a class="tab-filter" href="../artists/details.aspx">Overview</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href="../artists/songs/details.aspx">Songs</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href="../artists/albums/details.aspx">Albums</a>
						</li>
					</ul> <!-- /.browse-header-filters -->
				</nav>

				<div class="discovery--container u-container">
							<main class="discovery--section">

								<section class="standard--holder">
									<div class="discovery--section--header">
										<h2>Top Songs</h2>
										<a class="discovery--section--header--view-all" href="#">View All</a>
									</div><!-- /.discovery-select -->

									<ul id="playlist" class="song-list mod-new mod-menu">
										<asp:Repeater ID="rptSongs" runat="server">
        <ItemTemplate>
            <li class="song-list--item media-player--row">
               <div class="song-list--item--player-img media-player">

												<img class="song-list--item--player-img--img" 
												srcset="./img/2822.jpg 2x" 
												src="./img/2822.jpg" alt="Way Maker">
											</div>

											<div class="song-list--item--right">
												<a href="#" class="song-list--item--primary"><%# Eval("SongName") %></a>
                <a class="song-list--item--secondary"><%# Eval("AlbumName") %></a>
                <a class="song-list--item--secondary"><%# Eval("BPM") %></a>
                <a class="song-list--item--secondary"><%# Eval("Rate") %></a>
													<div class="song-list--item--icon--holder">
													<a href="#" class="song-list--item--icon--wrap" style="display: inline-block">
														<svg class="song-list--item--icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="ds-tracks-sm"><path fill-rule="evenodd" clip-rule="evenodd" d="M1.977 12c0-5.523 4.477-10 10-10s10 4.477 10 10-4.477 10-10 10-10-4.477-10-10zm4.04 6.204a8.579 8.579 0 005.96 2.405c4.747 0 8.61-3.862 8.61-8.609 0-4.746-3.863-8.609-8.61-8.609a8.573 8.573 0 00-5.893 2.343h6.598a.708.708 0 110 1.415H4.87c-.29.423-.543.875-.754 1.348h11.213a.708.708 0 110 1.415H3.624c-.109.437-.184.888-.223 1.35h14.637a.708.708 0 110 1.414H3.396c.037.46.109.911.215 1.348h13.025a.708.708 0 010 1.416H4.087c.207.473.454.923.739 1.349h9.164a.708.708 0 110 1.415H6.017z" fill=""></path></svg>
													</a>
													<a href="#" class="song-list--item--icon--wrap" style="display: inline-block">
														<svg class="song-list--item--icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="ds-custommix-sm"><path fill-rule="evenodd" clip-rule="evenodd" d="M3.887 2h16.226C21.155 2 22 2.845 22 3.887v16.226A1.887 1.887 0 0120.113 22H3.887A1.887 1.887 0 012 20.113V3.887C2 2.845 2.845 2 3.887 2zm15.681 18.62c.581 0 1.052-.47 1.052-1.051V4.431c0-.58-.47-1.051-1.052-1.051H4.432c-.581 0-1.052.47-1.052 1.051v15.138c0 .58.47 1.051 1.052 1.051h15.136zM6.46 12v6.233a.692.692 0 101.385 0V12c.764 0 1.385-.621 1.385-1.385V9.23c0-.763-.621-1.385-1.385-1.385V5.767a.692.692 0 10-1.385 0v2.078c-.764 0-1.385.622-1.385 1.385v1.385c0 .764.621 1.385 1.385 1.385zm1.385-1.385H6.46V9.23h1.385v1.385zm3.463 5.54v2.078a.692.692 0 101.384 0v-2.078c.764 0 1.386-.622 1.386-1.385v-1.385c0-.764-.622-1.385-1.386-1.385V5.767a.692.692 0 10-1.384 0V12c-.764 0-1.386.621-1.386 1.385v1.385c0 .763.622 1.385 1.386 1.385zm1.384-1.385h-1.384v-1.385h1.384v1.385zM16.155 12v6.233a.692.692 0 101.385 0V12c.764 0 1.385-.621 1.385-1.385V9.23c0-.763-.621-1.385-1.385-1.385V5.767a.692.692 0 10-1.385 0v2.078c-.764 0-1.385.622-1.385 1.385v1.385c0 .764.621 1.385 1.385 1.385zm1.385-1.385h-1.385V9.23h1.385v1.385z" fill=""></path></svg>
													</a>
													<a href="#" class="song-list--item--icon--wrap" style="display: inline-block">
														<svg class="song-list--item--icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="ds-rehearsalmix-sm"><path d="M5.892 18.468h2.155a.719.719 0 100-1.438H5.892a.718.718 0 000 1.438zM8.047 15.593H5.892a.718.718 0 010-1.438h2.155a.719.719 0 110 1.438zM10.922 18.468h2.156a.719.719 0 100-1.438h-2.156a.718.718 0 100 1.438zM13.078 15.593h-2.156a.718.718 0 110-1.438h2.156a.719.719 0 110 1.438zM10.922 12.719h2.156a.719.719 0 100-1.438h-2.156a.718.718 0 100 1.438zM13.078 9.844h-2.156a.718.718 0 110-1.437h2.156a.719.719 0 110 1.437zM5.892 12.719h2.155a.719.719 0 100-1.438H5.892a.718.718 0 000 1.438zM18.108 18.468h-2.156a.718.718 0 110-1.438h2.156a.719.719 0 110 1.438zM15.952 15.593h2.156a.719.719 0 100-1.438h-2.156a.718.718 0 100 1.438zM18.108 12.719h-2.156a.718.718 0 110-1.438h2.156a.719.719 0 110 1.438zM15.952 9.844h2.156a.719.719 0 100-1.437h-2.156a.718.718 0 100 1.437zM13.078 6.97h-2.156a.718.718 0 110-1.438h2.156a.719.719 0 110 1.437z" fill=""></path><path fill-rule="evenodd" clip-rule="evenodd" d="M3.887 2h16.226C21.155 2 22 2.845 22 3.887v16.226A1.887 1.887 0 0120.113 22H3.887A1.887 1.887 0 012 20.113V3.887C2 2.845 2.845 2 3.887 2zm15.681 18.62c.581 0 1.052-.47 1.052-1.051V4.431c0-.58-.47-1.051-1.052-1.051H4.432c-.581 0-1.052.47-1.052 1.051v15.138c0 .58.47 1.051 1.052 1.051h15.136z" fill=""></path></svg>
													</a>
													<a href="#" class="song-list--item--icon--wrap" style="display: inline-block">
														<svg class="song-list--item--icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="ds-sounds-sm"><path fill-rule="evenodd" clip-rule="evenodd" d="M13.36 19.152h-.004a.606.606 0 01-.597-.528l-1.175-9.038-.964 5.787a.607.607 0 01-.574.506.625.625 0 01-.612-.459l-1.24-4.962-.9 1.787a.632.632 0 01-.553.341H5.79a.62.62 0 01-.627-.594.606.606 0 01.606-.618h.374c.143 0 .273-.08.337-.207l1.364-2.712a.606.606 0 011.13.125l.93 3.719 1.157-6.945a.606.606 0 01.598-.506h.01c.3.005.552.23.59.528l1.132 8.705 1.02-7.077a.606.606 0 01.586-.52h.014c.29 0 .54.207.595.493l1.22 6.414.836-1.68a.606.606 0 01.543-.337h.96a.62.62 0 01.626.595.606.606 0 01-.607.617h-.37a.377.377 0 00-.338.21l-1.366 2.747a.605.605 0 01-1.138-.157l-.879-4.619-1.133 7.865a.606.606 0 01-.6.52z" fill=""></path><path fill-rule="evenodd" clip-rule="evenodd" d="M12.477 2c-5.523 0-10 4.477-10 10s4.477 10 10 10 10-4.477 10-10S18 2 12.477 2zm0 1.312c4.79 0 8.688 3.898 8.688 8.688 0 4.79-3.898 8.688-8.688 8.688-4.79 0-8.688-3.898-8.688-8.688 0-4.79 3.898-8.688 8.688-8.688z" fill=""></path></svg>
													</a>
													<a href="#" class="song-list--item--icon--wrap" style="display: inline-block">
														<svg class="song-list--item--icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="ds-charts-sm"><path d="M7.352 9.077h8.486a.65.65 0 01.653.65.65.65 0 01-.653.65H7.352a.65.65 0 110-1.3zM7.352 7.778h4.57a.65.65 0 100-1.299h-4.57a.65.65 0 00-.653.65c0 .359.292.65.653.65zM7.352 11.675h6.136a.65.65 0 01.653.65.65.65 0 01-.653.65H7.352a.65.65 0 01-.652-.65c0-.36.292-.65.652-.65zM11.008 14.273H7.352a.65.65 0 00-.653.65c0 .359.292.65.653.65h3.656a.65.65 0 00.653-.65c0-.36-.293-.65-.653-.65zM7.352 16.871h3.656c.36 0 .653.29.653.65a.65.65 0 01-.653.65H7.352a.65.65 0 01-.653-.65c0-.36.292-.65.653-.65zM17.334 12.856c.35.742.127.912-.236.912-.128 0-.2-.096-.283-.21-.118-.159-.26-.351-.62-.352h-.002v3.86c0 .687-.746 1.243-1.666 1.243-.92 0-1.666-.556-1.666-1.243s.745-1.244 1.666-1.244h.833v-3.73c0-.23.186-.415.417-.415.01-.001.962-.085 1.557 1.178z" fill=""></path><path fill-rule="evenodd" clip-rule="evenodd" d="M20.078 5.903L16.47 2.267A.9.9 0 0015.831 2H4.853C4.201 2 3.5 2.474 3.5 3.515v16.97C3.5 21.32 4.174 22 5.004 22h13.835c.83 0 1.504-.68 1.504-1.515V6.545a.912.912 0 00-.265-.642zm-.977 14.865H4.741V3.232h9.791v3.572c0 .538.439.975.98.975h3.59v12.989zm-.015-14.221h-3.312V3.243l3.312 3.304z" fill=""></path></svg>
													</a>
													<a href="#" class="song-list--item--icon--wrap" style="display: inline-block">
														<svg class="song-list--item--icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="ds-propresenter-sm"><path fill-rule="evenodd" clip-rule="evenodd" d="M23 5.625c0 .345-.28.625-.625.625H21V18a2 2 0 01-2 2H5a2 2 0 01-2-2V6.25H1.625a.625.625 0 110-1.25h20.75c.345 0 .625.28.625.625zM4.25 6.25h15.5V18a.75.75 0 01-.75.75H5a.75.75 0 01-.75-.75V6.25zm3.375 2.5a.625.625 0 100 1.25h8.75a.625.625 0 100-1.25h-8.75zM6 12.375c0-.345.28-.625.625-.625h10.75a.625.625 0 110 1.25H6.625A.625.625 0 016 12.375zm1.625 2.375a.625.625 0 100 1.25h8.75a.625.625 0 100-1.25h-8.75z" fill=""></path></svg>
													</a>
												</div>
								
											</div>

            </li>
        </ItemTemplate>
    </asp:Repeater>
										
									 							</ul><!-- /.song-list -->
								</section><!-- /.songs-section -->

								<div class="discovery--space-saver">
									<section class="standard--holder">
										<div class="discovery--section--header">
											<h2>Albums</h2>
											<a class="discovery--section--header--view-all" href="/artists/default.aspx">View All</a>
										</div><!-- /.discovery-select -->

										<div class="discovery--grid-holder">

											<div class="ly-grid ly-grid-cranberries">

												 <asp:Repeater ID="rptAlbums" runat="server">
        <ItemTemplate>
            <div class="media-item">
                <a class="media-item--img--link" href="#" tabindex="0">
                    <img class="media-item--img" alt="Reckless Love" src='<%# Eval("AlbumImage") %>' srcset='<%# Eval("AlbumImage") %>, <%# Eval("AlbumImage") %> 2x'>
                    <span class="image-tag">Master</span>
                </a>
                <a class="media-item--title" href="#" tabindex="0"><%# Eval("AlbumName") %></a>
                <a class="media-item--subtitle" href="#" tabindex="0"><%# Eval("Year") %></a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
										 
											</div><!-- /.grid -->
										</div><!-- /.discovery-grid-holder -->
									</section><!-- /.songs-section -->
								</div>

								<section class="standard--holder">
									<div class="discovery--section--header">
										<h2>Biography</h2>
									</div><!-- /.discovery-section-header -->

									<div class="artist-details--biography biography">
										<p>
										<asp:Literal ID="txtBiography" runat="server"></asp:Literal>
										</p>
										 	<p></p>
										 
									</div>
								</section><!-- /.biography-section -->
							</main><!-- /.discovery-section -->
				</div><!-- /.standard-container -->
			</div><!-- /.wrapper -->
            <%-- <!--#include virtual = "../includes/footer.aspx" -->
			 --%>
			

			<a class="accessibility" href="#wrapper" tabindex="20">Back to top</a>
		</form>
	</body>
 
</html>
