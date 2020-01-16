<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Playtime | App admin Site</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="../../plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="../../bower_components/select2/dist/css/select2.min.css">
    <!-- jQuery -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

    <!-- include summernote css/js-->
    <link href="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <script src="/admin/dist/js/bootpag.js"></script>

    <!-- Google Font -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <style>
        td {
            vertical-align: middle !important;
        }
    </style>
</head>

<!-- ADD THE CLASS layout-boxed TO GET A BOXED LAYOUT -->
<body class="hold-transition skin-blue layout-boxed sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <a href="/admin/pages/notice/noti_list.jsp" class="logo" style="background:#000">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>Pt&nbsp;</b>A</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Playtime&nbsp;</b>Admin</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" style="background:#000">
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="../../logout.jsp">
                            <b>Sign out</b> <i class="fa fa-share"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- ================ End header ================ -->

        <!-- Left side column. contains the sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <% if(session.getAttribute("lang") != null) { %>
                            <% if(session.getAttribute("lang").equals("ko")){%>
                                <img src="../../dist/img/ko.png" class="img-circle" alt="User Image">
                            <%}else {%>
                                <img src="../../dist/img/vi.png" class="img-circle" alt="User Image">
                            <%}%>
                        <%}%>
                    </div>
                    <div class="pull-left info">
                        <p><%= session.getAttribute("id") %></p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu" data-widget="tree">
                    <li>
                        <a href="/admin/pages/notice/noti_list.jsp"><i class="fa fa-bullhorn"></i>&nbsp;<span><fmt:message key="message.admin1"/></span></a>
                    </li>
                    <li>
                        <a href="/admin/pages/event/event_list.jsp"><i class="fa fa-calendar"></i>&nbsp;<span><fmt:message key="message.admin2"/></span></a>
                    </li>
                    <li>
                        <a href="/admin/pages/news/news_list.jsp"><i class="fa fa-newspaper-o"></i>&nbsp;<span><fmt:message key="message.admin3"/></span></a>
                    </li>
                    <li>
                        <a href="/admin/pages/store/store_view.jsp"><i class="fa fa-cubes"></i>&nbsp;<span><fmt:message key="message.admin4"/></span></a>
                    </li>
                    <li>
                        <a href="/admin/pages/faq/faq_list.jsp"><i class="fa fa-commenting-o"></i>&nbsp;<span><fmt:message key="message.admin5"/></span></a>
                    </li>
                    <li>
                        <a href="/admin/pages/terms/terms_list.jsp"><i class="fa fa-edit"></i>&nbsp;<span><fmt:message key="message.admin6"/></span></a>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
        <!-- ================ End left ================ -->

        <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">