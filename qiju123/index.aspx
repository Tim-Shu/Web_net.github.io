﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="QJcms.Web.admin.index" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>后台管理中心</title>
    <link href="../lib/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
    <link href="skin/default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" charset="utf-8" src="../lib/scripts/jquery/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../lib/scripts/jquery/jquery.nicescroll.js"></script>
    <script type="text/javascript" charset="utf-8" src="../lib/scripts/artdialog/dialog-plus-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/layindex.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/common.js"></script>
    <script type="text/javascript">
        //页面加载完成时
        $(function () {
            //检测IE
            if ('undefined' == typeof (document.body.style.maxHeight)) {
                window.location.href = 'ie6update.html';
            }

            <%if (admin_info.password == QJcms.Common.DESEncrypt.Encrypt("admin888", admin_info.salt))
        {%>

            var d = dialog({
                title: "重要提示",
                content: "您的密码为默认密码，为确保信息安全请尽快修改。<br/>因为密码未及时修改或密码自行泄漏等个人问题所造成的<br/>任何网站数据问题本公司概不负责！",
                okValue: '修改密码',
                ok: function () { },
                onclose: function () {
                    frames["mainframe"].location.href = "manager/manager_pwd.aspx";
                }
            }).showModal();
            <% } %>
        });
    </script>

</head>

<body class="indexbody">
    <form id="form1" runat="server">
        <!--全局菜单-->
        <a class="btn-paograms" onclick="togglePopMenu();"></a>
        <div id="pop-menu" class="pop-menu">
            <div class="pop-box">
                <h1 class="title"><i></i>导航菜单</h1>
                <i class="close" onclick="togglePopMenu();">关闭</i>
                <div class="list-box"></div>
            </div>
            <i class="arrow">箭头</i>
        </div>
        <!--/全局菜单-->

        <div class="main-top">
            <a class="icon-menu"></a>
            <div id="main-nav" class="main-nav"></div>
            <div class="nav-right">
                <div class="info">
                    <i></i>
                    <span>您好，<%=admin_info.user_name %><br>
                        <%=new QJcms.BLL.manager_role().GetTitle(admin_info.role_id) %>
                    </span>
                </div>
                <div class="option">
                    <i></i>
                    <div class="drop-wrap">
                        <div class="arrow"></div>
                        <ul class="item">
                            <li>
                                <a href="../" target="_blank">预览网站</a>
                            </li>
                            <li>
                                <a href="center.aspx" target="mainframe">管理中心</a>
                            </li>
                            <li>
                                <a href="manager/manager_pwd.aspx" onclick="linkMenuTree(false, '');" target="mainframe">修改密码</a>
                            </li>
                            <li>
                                <asp:LinkButton ID="lbtnExit" runat="server" OnClick="lbtnExit_Click">注销登录</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-left">
            <h1 class="logo"></h1>
            <div id="sidebar-nav" class="sidebar-nav"></div>
        </div>

        <div class="main-container">
            <iframe id="mainframe" name="mainframe" frameborder="0" src="center.aspx"></iframe>
        </div>

    </form>
</body>
</html>
