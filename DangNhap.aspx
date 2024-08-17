<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="TT_ShopJQK.DangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!--Login Register section start-->
        <div class="login-register-section section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50  pb-70 pb-lg-50 pb-md-40 pb-sm-30 pb-xs-20">
            <div class="container">
               <%-- <div class="row">--%>
                        <!--Login Form Start-->
                    
                       <%-- <div class="col-md-6 col-sm-6">--%>
                            <center>
                            <div class="customer-login-register">
                               
                                <div class="form-login-title">
                                    <h2>Đăng Nhập</h2><br />
                                </div>
                                <img style="width:100px; height:100px;" src="Anh/Logo/CaptureLogo.JPG" />
                                <div class="login-form" style="width:500px; height:400px;">
                                    
                                    <form action="#">
                                        <div class="form-fild">
                                            <p><label>Tên Đăng Nhập <span class="required">*</span></label></p>
                                            <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-fild">
                                            <p><label>Mật Khẩu <span class="required">*</span></label></p>
                                            <%--<input name="password" value="" type="password">--%>
                                            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="login-submit">
                                            <center>
                                           <%-- <button type="submit" class="btn">--%>
                                                <asp:Button ID="btnlogin" CssClass="btn" runat="server" Text="Login" OnClick="btnlogin_Click" />                              
                                                <asp:Label ID="lbID" runat="server"></asp:Label>
                                                <asp:Label ID="lbMessage" runat="server" CssClass="msg"></asp:Label>
                                            </center>
                                            <label>
                                                <input class="checkbox" name="rememberme" value="" type="checkbox">
                                                <span>Nhớ mật khẩu</span>
                                            </label>
                                            <div class="lost-password">
                                            <a href="#">Quên mật khẩu?</a>
                                             </div>
                                        </div>
                                        <center>
                                         <div class="mb-2">
                                            <button type="button" style="background-color:royalblue; color:white;">
                                              <i class="mdi mdi-facebook mr-2"></i> Đăng Nhập Facebook</button>
                                          </div>
                                            <h5><a href="DangKi.aspx">Tạo tài khoản</a></h5>
                                        </center>
                                        
                                    </form>
                                        
                                </div>
                                    
                            </div>
                                 </center>
                        </div>
                           
                        <!--Login Form End-->
                        <!--Register Form Start-->
                      
                    </div>            

        <!--Login Register section end-->
</asp:Content>
