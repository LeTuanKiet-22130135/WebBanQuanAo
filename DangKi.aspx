<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DangKi.aspx.cs" Inherits="TT_ShopJQK.DangKi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Page Banner Section Start -->
        <div class="page-banner-section section bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col">
                        
                        <div class="page-banner text-center">
                            <h1>Đăng Kí</h1>
                            <ul class="page-breadcrumb">
                                <li><a href="index.html">Home</a></li>
                                <li>Đăng Kí</li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Banner Section End -->

        <!--Login Register section start-->
        <div class="login-register-section section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50  pb-70 pb-lg-50 pb-md-40 pb-sm-30 pb-xs-20">
            <div class="container">
                <div class="row">
                        <!--Login Form Start-->
                    
                        <div class="col-md-6 col-sm-6">
                           
                            <div class="customer-login-register">
                                
                                <img style="width:450px; height:450px;" src="Anh/Logo/CaptureLogo.JPG" /><br />
                                  <p><small> Lưu Ý: dấu " * " không đánh quá 30 kí tự.</small></p>
                                <p><small>Và dấu " ** " không đánh quá 15 kí tự.</small></p>  
                            </div>
                        </div>
                           
                        <!--Login Form End-->
                        <!--Register Form Start-->
                        <div class="col-md-6 col-sm-6">
                            <div class="customer-login-register register-pt-0">
                                
                                <div class="form-register-title">
                                    <h2>Đăng Kí Tài Khoản</h2>
                                </div>
                                <div class="register-form">
                                    <form action="#">
                                        <div class="form-fild">
                                            <p><label>Tên Đăng Nhập <span class="required">*</span></label></p>
                                            <asp:TextBox ID="txtTendangnhap" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-fild">
                                            <p><label>Email <span class="required">*</span></label></p>
                                            <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-fild">
                                            <p><label>Địa chỉ<span class="required">*</span></label></p>
                                           <asp:TextBox ID="txtDiachi" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-fild">
                                            <p><label>số điện thoại <span class="required">* *</span></label></p>
                                            <asp:TextBox ID="txtsdt" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                         <div class="form-fild">
                                            <p><label>Password <span class="required">*</span></label></p>
                                            <asp:TextBox ID="txtMatkhau" class="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                        </div>
                                        <center>
                                        <div class="register-submit">
                                            <asp:Label ID="the" runat="server"></asp:Label> 
     <asp:Button ID="btnThem" CommandName="them" Text="Đăng Kí Ngay" CssClass="btn" runat="server" OnClick="btnThem_Click" /><br />
                                        </div>
                                            </center>
                                    </form>
                                    
                                </div>
                                
                            </div>
                        </div>
                        <!--Register Form End-->
                    </div>            
            </div>
        </div>
        <!--Login Register section end-->
</asp:Content>
