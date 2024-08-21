<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NuocHoa.aspx.cs" Inherits="TT_ShopJQK.NuocHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Shop Section Start -->
        <div class="shop-section section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50 pb-70 pb-lg-50 pb-md-40 pb-sm-60 pb-xs-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 order-lg-1 order-2">
                        <!-- Single Sidebar Start  -->
                        <div class="common-sidebar-widget">
                            <h3 class="sidebar-title">Color</h3>
                            <ul class="sidebar-list">
                                <li><a href="#"><i class="fa fa-angle-right"></i>Red <span class="count">(5)</span></a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i>Orange <span class="count">(4)</span></a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i>Blue <span class="count">(4)</span></a></li>
                               
                            </ul>
                        </div>
                        <!-- Single Sidebar End  -->
                        <!-- Single Sidebar Start  -->
                        <div class="common-sidebar-widget">
                            <h3 class="sidebar-title">Có Thể Bạn Cần</h3>
                            <ul class="sidebar-list">
                                <li><a href="#"><i class="fa fa-angle-right"></i>Chăm Sóc Tóc <span class="count">(1)</span></a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i>Nước Hoa <span class="count"></span></a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i>Chăm Sóc Da <span class="count"></span></a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i>Thương Hiệu <span class="count"></span></a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i>Blogs  <span class="count">(2)</span></a></li>
                            </ul>
                        </div>
                        <!-- Single Sidebar End  -->
                        <!-- Single Sidebar Start  -->
                        <div class="common-sidebar-widget">
                            <h3 class="sidebar-title">Price</h3>
                            <ul class="sidebar-list">
                                <li><a href="#"><i class="fa fa-angle-right"></i><span class="price">€0.00</span> - <span class="price">€99.99</span> <span class="count">(7)</span></a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i><span class="price">€100.00</span> and above  <span class="count">(14)</span></a></li>
                            </ul>
                        </div>
                        <!-- Single Sidebar End  -->
                        <!-- Single Sidebar Start  -->
                        <div class="common-sidebar-widget">
                            <div class="single-banner">
                                <a href="#">
                                    <img src="Anh/Logo/Anh dọc 1.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- Single Sidebar End  -->
                    </div>
                    <div class="col-lg-9 order-lg-2 order-1">
                        <div class="row">
                            <div class="col-12">
                                <div class="shop-banner mb-35 mb-xs-20">
                                     <img style="height:350px;" src="Anh/Logo/banner vừa web.png" alt="">
                                </div>
                                <div class="shop-banner-title">
                                    <h2>Nước Hoa</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <!-- Grid & List View Start -->
                                <div class="shop-topbar-wrapper d-md-flex justify-content-md-between align-items-center">
                                    <div class="grid-list-option">
                                         <ul class="nav">
                                          <li>
                                            <a class="active show" data-toggle="tab" href="#grid"><i class="fa fa-th"></i></a>
                                          </li>
                                          <li>
                                            <a data-toggle="tab" href="#list" class=""><i class="fa fa-th-list"></i></a>
                                          </li>
                                        </ul>
                                     </div>
                                     <!--Toolbar Short Area Start-->
                                     <div class="toolbar-short-area d-md-flex align-items-center">
                                         <div class="toolbar-shorter ">
                                            <label>Sort By:</label>
                                             <select class="wide">
                                                 <option data-display="Select">Nothing</option>
                                                 <option value="Relevance">Relevance</option>
                                                 <option value="Name, A to Z">Name, A to Z</option>
                                                 <option value="Name, Z to A">Name, Z to A</option>
                                                 <option value="Price, low to high">Price, low to high</option>
                                                 <option value="Price, high to low">Price, high to low</option>
                                             </select>
                                         </div>
                                         <div class="toolbar-shorter ">
                                            <label>Show</label>
                                             <select class="small">
                                                 <option data-display="Select">9</option>
                                                 <option value="15">15</option>
                                                 <option value="30">30</option>
                                             </select>
                                             <span>per page</span>
                                         </div>
                                         
                                     </div>
                                     <!--Toolbar Short Area End-->
                                </div>
                                <!-- Grid & List View End -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="shop-product">
                                    <div id="myTabContent-2" class="tab-content">
                                        <div id="grid" class="tab-pane fade active show">
                                            <div class="product-grid-view">
                                                <div class="row">
                                                   

                                      <asp:Repeater ID="RncH" runat="server" DataSourceID="SqlDataSource1">
                                              <ItemTemplate>
                                                   <div class="col-lg-4 col-md-6 col-sm-6">
                                                       <!-- Single Product Start -->
                                                        <div class="single-product mb-30">
                                                  <div class="product-img">
                                                                <a title='<%#:Eval("tenSP") %> <%#:Eval("maSP") %>' href='/ChiTietSanPham.aspx?maSP=<%#:Eval("maSP") %>'>
                                                                    <img alt="" src='./Anh/AnhSp/<%#:Eval("hinhAnh") %>' />
                                                                </a>
                                                                <%--<span class="descount-sticker">-10%</span>--%>
                                                                <span class="sticker">New</span>
                                                                <div class="product-action d-flex justify-content-between">
                                                                    <a class="product-btn" href="#">Add to Cart</a>
                                                                    <ul class="d-flex">
                                                                        <li><a href="#quick-view-modal-container" data-toggle="modal" title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                   <div class="product-content">
                                                                <h3><a href="single-product.html"><%#Eval("tenSP")%></a></h3>
                                                                <div class="ratting">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </div>
                                                                <h4 class="price"><span class="new"><%#Eval("khuyenMai")%></span>
                                                                    <span class="old"><%#Eval("donGia")%> đ</span></h4>
                                                            </div>
                                                        </div>                                             
                                                </div>
                                              </ItemTemplate>
                                            </asp:Repeater>                             
                                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JQKShopConnectionString2 %>" SelectCommand="SELECT * FROM [showNướcHoa]"></asp:SqlDataSource>
                       
                                                        </div>
                                                       
                                                
                                            </div>
                                        </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-30 mb-sm-40 mb-xs-30">
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
        <!-- Shop Section End -->
   
</asp:Content>
