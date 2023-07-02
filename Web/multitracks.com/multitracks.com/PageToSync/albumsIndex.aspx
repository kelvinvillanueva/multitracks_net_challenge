<%@ Page Language="C#" AutoEventWireup="true" CodeFile="albumsIndex.aspx.cs" Inherits="PageToSync_albumsIndex" %>
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
					<div class="details-banner">
					<div class="details-banner--overlay"></div>
					<div class="details-banner--hero">
						  <asp:Image ID="imgArtistBanner" runat="server" 
							  CssClass="details-banner--hero--img" />
					</div>
					<div class="details-banner--info">
						<a href="#" class="details-banner--info--box">
								   <asp:Image ID="imgArtist" runat="server" CssClass="details-banner--info--box--img" />

						</a>
						<h1 class="details-banner--info--name"><a class="details-banner--info--name--link" href="#">
							  
							<asp:Label ID="lblArtistName" runat="server"></asp:Label> Music
						                                       </a></h1>
					</div>
				</div>

				</div>

				<nav class="discovery--nav">
					<ul class="discovery--nav--list tab-filter--list u-no-scrollbar">
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href='artistDetails.aspx?artistId=<%= Request.QueryString["artistId"] %> '>Overview</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href='songsIndex.aspx?artistId=<%= Request.QueryString["artistId"] %> '>Songs</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item is-active">
							<a class="tab-filter" href='albumsIndex.aspx?artistId=<%= Request.QueryString["artistId"] %> ' >Albums</a>
						</li>
					</ul> <!-- /.browse-header-filters -->
				</nav>

				<div class="discovery--container u-container">
							<main class="discovery--section">

							 
								<div class="discovery--space-saver">
									<section class="standard--holder">
										<div class="discovery--section--header">
											<h2>Albums</h2>
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

						 </main><!-- /.discovery-section -->
				</div><!-- /.standard-container -->
			</div><!-- /.wrapper -->
            <%-- <!--#include virtual = "../includes/footer.aspx" -->
			 --%>
			

			<a class="accessibility" href="#wrapper" tabindex="20">Back to top</a>
		</form>
	</body>
 
</html>
