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
    <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-32x32.png" type="image/png">
    <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-svg2.svg" type="image/svg+xml">
    <meta name="theme-color" content="#ffffff">
    <link media="all" rel="stylesheet" href="https://mtracks.azureedge.net/public/css/v22/main.min.css?v=4">
    <style type="text/css">
        .is-slide-hidden {
            position: absolute;
            left: -9999px;
            top: -9999px;
            display: block;
        }
    </style>

</head>

<body class="premium standard">
    <form id="form1" runat="server">
        <noscript>
            <div>Javascript must be enabled for the correct page display</div>
        </noscript>

        <div class="mobile-panel mod-left js-mobile-left js-mobile-panel">
            <a href="#" class="mobile-panel--close js-click-hide-products"></a>
        </div>
        <div class="mobile-panel mod-right js-mobile-right js-mobile-panel">
            <a href="#" class="mobile-panel--close js-click-hide-account"></a>
            <nav id="mobile-menu-account" class="mobile-menu">
                <nav class="mobile-menu--breadcrumbs js-menu-breadcrumbs"><a>All</a></nav>
                <button class="mobile-menu--back is-hidden js-menu-back" aria-label="Go back"></button>
                <button class="mobile-panel--close-btn js-click-hide-account" aria-label="Close Menu">
                    <svg class="mobile-panel--close-btn--icon">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/images/sprite.symbol.svg#X-Close-thick"></use>
                    </svg>
                </button>
                <div class="mobile-menu--wrap">
                    <ul data-menu="main" data-menu-id="0" class="mobile-menu--level js-menu-level is-current">
                        <li id="header_registerLinkMobile" class="mobile-menu--item js-menu-item"><a class="mobile-menu--link js-menu-link" href="/register/">Sign Up</a></li>
                        <li id="header_loginItemMobile" class="mobile-menu--item js-menu-item"><a href="/login/" id="header_loginLinkMobile" class="mobile-menu--link js-menu-link">Log In </a></li>
                        <li class="mobile-menu--item js-menu-item"><a href="/cart/" id="header_mobileCartButton" class="mobile-menu--link js-menu-link js-cart-count">Cart</a></li>
                        <li class="mobile-menu--item js-menu-item"><a href="https://intercom.help/multitracks/en/" id="header_supportLinkMobile" class="mobile-menu--link js-menu-link">Help Center</a></li>
                    </ul>
                </div>
            </nav>
        </div>
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
        <div class="wrapper mod-standard remodal-bg">
            <div class="text-hero mod-headphones ly-delta">
            </div>
        </div>
        <div class="wrapper mod-standard mod-gray">



            <div class="discovery--container u-container">
                <main class="discovery--section">

                    <section class="standard--holder">
                        <div class="discovery--section--header">
                            <h2>Artists</h2>
                        </div>
                        <!-- /.discovery-select -->

                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <table id="playlist" style="text-align: left">
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
                                <tr>

                                    <td class="song-list--item--player-img media-player">
                                        <img class="song-list--item--player-img--img" src='<%# Eval("imageURL") %>' alt="Way Maker">
                                    </td>
                                    <td class="song-list--item--right">
                                        <a href='artistDetails.aspx?artistId=<%# Eval("artistId") %>'
                                            class="song-list--item--primary"><%# Eval("title") %></a>
                                    </td>
                                    <td>
                                        <a><%# Limit(Eval("biography"),35) %></a>
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

                    </section>
                    <!-- /.songs-section -->

                </main>
                <!-- /.discovery-section -->
            </div>
            <!-- /.standard-container -->
        </div>
        <!-- /.wrapper -->



        <a class="accessibility" href="#wrapper" tabindex="20">Back to top</a>
    </form>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $('#playlist').DataTable({
                lengthChange: false,
                order: [[1, 'asc']],
                columnDefs: [
                    { orderable: false, targets: [0, 2] }
                ]
            });

        });

    </script>

</body>

</html>
