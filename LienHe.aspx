<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="TT_ShopJQK.LienHe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Banner Section Start -->
        <div class="page-banner-section section bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col">
                        
                        <div class="page-banner text-center">
                            <h1>Liên Hệ</h1>
                            <ul class="page-breadcrumb">
                                <li><a href="index.html">Home</a></li>
                                <li>Liên Hệ</li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Banner Section End -->

        <!--Contact Map section start-->
        <div class="contact-map-section section">
            <div id="contact-map" class="contact-map">
                <center>
                <h2>Vị Trí Map</h2>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.4796767870907!2d105.77622851488248!3d20.97340068602842!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134532b891f24db%3A0xfe97bb9176d92787!2zQsawdSDEkWnhu4duIEjDoCDEkMO0bmc!5e0!3m2!1svi!2s!4v1612695715288!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </center>
            </div>
        </div>
        <!--Contact Map section End-->
        
        <!--Contact section start-->
        <div class="conact-section section pt-95 pt-lg-75 pt-md-65 pt-sm-55 pt-xs-45  pb-100 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
            <div class="container">
               
                <div class="row">
                    <div class="col-lg-3 col-12">
                        <div class="contact-information">
                            <h3>Thông Tin Liên Hệ</h3>
                            <ul>
                                <li>
                                    <span class="icon"><i class="pe-7s-map"></i></span>
                                    <span class="text"><span>Stock Building, 125 Main Street 1st Lane, San Francisco, USA</span></span>
                                </li>
                                <li>
                                    <span class="icon"><i class="pe-7s-call"></i></span>
                                    <span class="text"><a href="#">(001) 24568 365 888)</a><a href="#">(001) 65897 569 784)</a></span>
                                </li>
                                <li>
                                    <span class="icon"><i class="pe-7s-mail-open"></i></span>
                                    <span class="text"><a href="#">jqkshop@gmail.com</a><a href="#">www.jqk.com</a></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9 col-12">
                        <div class="contact-form-wrap">
                            <h3 class="contact-title">Thông Tin Khách Hàng</h3>
                            <form id="contact-form" action="http://hasthemes.com/file/mail.php" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="contact-form-style mb-20">
                                            <input name="con_name" placeholder="First Name*" type="text">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="contact-form-style mb-20">
                                            <input name="lastname" placeholder="Last Name*" type="text">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="contact-form-style mb-20">
                                            <input name="con_email" placeholder="Email*" type="email">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="contact-form-style mb-20">
                                            <input name="subject" placeholder="Subject*" type="text">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="contact-form-style">
                                            <textarea name="con_message" placeholder="Type your message here.."></textarea>
                                            <button class="btn" type="submit"><span>Gửi Đi</span></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <p class="form-messege"></p>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <!--Contact section end-->


</asp:Content>
