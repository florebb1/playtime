<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Playtime Admin | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="./bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="./dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="./plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="./login.jsp"><b>Playtime</b> Admin</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

        <form id="loginCheckForm" action="loginCheck.jsp" method="POST">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="ID" placeholder="User ID">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="PW" placeholder="Password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label></label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button id="loginBtn" type="button" class="btn btn-primary btn-block btn-flat">Sign In</button>
                </div>
                <!-- /.col -->
            </div>
        </form>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="./plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
        $("#loginBtn").click(function () {
            var id = $("input[name=ID]").val();
            var pw = $("input[name=PW]").val();
            if(id == "") {
                alert("Please enter your ID");
                return false;
            }else if(pw == "") {
                alert("Please enter your Password");
                return false;
            }

            var datas = $('#loginCheckForm').serialize();
            $.ajax({
                url: '/admin/api/loginCheck.jsp',
                type: 'POST',
                dataType: 'JSON',
                data: datas,
                success: function (response) {
                    if(response.RESULT.length != 0) {
                        var lang;
                        if(response.RESULT[0].COMP_CD == "010") {
                            lang = "ko";
                        }else {
                            lang = "vi";
                        }
                        document.location.href='/admin/pages/notice/noti_list.jsp?id='+response.RESULT[0].ID+'&lang='+lang;
                    }else {
                        alert("User Not found.");
                        location.reload();
                    }
                }
            });
        });
    });

</script>
</body>
</html>