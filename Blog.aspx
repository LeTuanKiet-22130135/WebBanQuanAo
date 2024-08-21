<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="TT_ShopJQK.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Banner Section Start -->
    <div class="page-banner-section section bg-gray">
        <div class="container">
            <div class="row">
                <div class="col">

                    <div class="page-banner text-center">
                        <h1>Tin Tức Mỗi Ngày</h1>
                        <ul class="page-breadcrumb">
                            <li><a href="TrangChu.aspx">Home</a></li>
                            <li>Blog</li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Page Banner Section End -->

    <!-- Blog Section Start -->
    <div class="blog-section section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50 pb-100 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 order-lg-1 order-2">
                    <!-- Single Sidebar Start  -->
                    <div class="common-sidebar-widget">
                        <div class="sidebar-search">
                            <form action="#">
                                <input type="text" placeholder="Search">
                                <button><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <!-- Single Sidebar End  -->
                    <!-- Single Sidebar Start  -->
                    <div class="common-sidebar-widget">
                        <h3 class="sidebar-title">Bài Viết Theo Tháng</h3>
                        <ul class="sidebar-list">
                            <li><a href="#"><i class="fa fa-angle-right"></i>March 2022 <span class="count">(4)</span></a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i>December 2023 <span class="count">(7)</span></a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i>November 2022 <span class="count">(8)</span></a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i>September 2024 <span class="count">(1)</span></a></li>
                         
                        </ul>
                    </div>

                    <div class="common-sidebar-widget">
                        <div class="single-banner">
                            <a href="#">
                                <img src="Anh/AnhSp/Anh dọc 1.jpg" alt="">
                          
                            </a>
                        </div>
                    </div>
                     <div class="common-sidebar-widget">
                             <div class="single-banner">
                                 <a href="#">
                                     <img src="Anh/AnhSp/Anhao2.jfif" alt="">
       
                                 </a>
                             </div>
                         </div>
                    <!-- Single Sidebar End  -->
                </div>
                <div class="col-lg-9 order-lg-2 order-1">
                              <div class="row">
                            <!-- Single Blog Start -->
                            
                                    <asp:DataList ID="DataList1" runat="server" DataKeyField="maTin" DataSourceID="SqlDataSource1">                         
                                    <ItemTemplate>
                                        <div class="blog col-lg-6 col-md-6 col-sm-6">
                                <div class="blog-inner mb-20">
                                  <asp:Label ID="maTinLabel" runat="server" Text='<%# Eval("maTin") %>' />
                                        <div class="media">
                                            <a href="blog-details.html" class="image">
                                                <%--<asp:Label ID="hinhAnhLabel" runat="server" Text='<%# Eval("hinhAnh") %>' />--%>
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Anh/Logo/" + Eval("hinhAnh") %>' />
                                            </a>
                                        </div>
                                        <div class="content">
                                            <h3 class="title">
                                                <a href="blog-details.html">
                                                    <asp:Label ID="tieuDeLabel" runat="server" Text='<%# Eval("tieuDe") %>' />
                                                </a>
                                            </h3>

                                            <ul class="meta">
                                                <li><i class="fa fa-calendar"></i><span class="date-time">
                                                    <asp:Label ID="ngayDangTinLabel" runat="server" Text='<%# Eval("ngayDangTin") %>' />
                                                </span></li>
                                            </ul>
                                            <p><asp:Label ID="noiDungLabel" runat="server" Text='<%# Eval("noiDung") %>' /></p>
                                            <asp:Label ID="tacGiaLabel" runat="server" Text='<%# Eval("tacGia") %>' />
                                            <a class="readmore" href="#">Read more</a>
                                        </div> 
                                      </div>
                            </div>
                                    </ItemTemplate>                                 
                                </asp:DataList>
                                        
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JQKShopConnectionString2 %>" SelectCommand="SELECT * FROM [Blog]"></asp:SqlDataSource>
                              
                            <!-- Single Blog End -->
                         
                        </div>
                        <div class="row mb-0 mb-xs-35 mb-sm-35">
                            <div class="col">
                                <ul class="page-pagination">
                                    <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                                    <li class="active"><a href="#">01</a></li>
                                    <li><a href="#">02</a></li>
                                    <li><a href="#">03</a></li>
                                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog Section End -->
</asp:Content>
 