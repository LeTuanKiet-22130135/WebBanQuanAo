<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="TT_ShopJQK.ChiTietSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Single Product Section Start -->
        <div class="single-product-section section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50 pb-100 pb-lg-80 pb-md-70 pb-sm-30 pb-xs-20">
            <div class="container">
                <div class="row">
		            <div class="col-md-6">
		                <!-- Product Details Left -->
                        <div class="product-details-left">
                            <div class="product-details-images-2 slider-lg-image-1 tf-element-carousel" data-slick-options='{
                                "slidesToShow": 1,
                                "slidesToScroll": 1,
                                "infinite": true,
                                "asNavFor": ".slider-thumbs-1",
                                "arrows": false,
                                "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "fa fa-angle-left" },
                                "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "fa fa-angle-right" }
                                }'>
                                <div class="lg-image">
                                    <asp:Image ID="anhsp" runat="server" />
                                    <a href="Anh/AnhSp/Chanel .jpg" class="popup-img venobox" data-gall="myGallery"><i class="fa fa-expand"></i></a>
                                </div>
                                <div class="lg-image">
                                    <img src="Anh/Logo/LogoSapJQKNho.jpg" alt="">
                                    <a href="Anh/Logo/LogoSapJQKNho.jpg" class="popup-img venobox" data-gall="myGallery"><i class="fa fa-expand"></i></a>
                                </div>
                                <%--<div class="lg-image">
                                    <img src="assets/images/product/large-product/l-product-3.jpg" alt="">
                                    <a href="assets/images/product/large-product/l-product-3.jpg" class="popup-img venobox" data-gall="myGallery"><i class="fa fa-expand"></i></a>
                                </div>--%>
                               <%-- <div class="lg-image">
                                    <img src="assets/images/product/large-product/l-product-4.jpg" alt="">
                                    <a href="assets/images/product/large-product/l-product-4.jpg" class="popup-img venobox" data-gall="myGallery"><i class="fa fa-expand"></i></a>
                                </div>
                                <div class="lg-image">
                                    <img src="assets/images/product/large-product/l-product-5.jpg" alt="">
                                    <a href="assets/images/product/large-product/l-product-5.jpg" class="popup-img venobox" data-gall="myGallery"><i class="fa fa-expand"></i></a>
                                </div>--%>
                            </div>
                            <div class="product-details-thumbs-2 mt-0 mt-xs-20 slider-thumbs-1 tf-element-carousel" data-slick-options='{
                                "slidesToShow": 4,
                                "slidesToScroll": 1,
                                "infinite": true,
                                "focusOnSelect": true,
                                "asNavFor": ".slider-lg-image-1",
                                "arrows": false,
                                "vertical": true,
                                "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "fa fa-angle-left" },
                                "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "fa fa-angle-right" }
                                }' data-slick-responsive= '[
                                {"breakpoint":991, "settings": {
                                    "slidesToShow": 3
                                }},
                                {"breakpoint":767, "settings": {
                                    "slidesToShow": 4
                                }},
                                {"breakpoint":479, "settings": {
                                    "slidesToShow": 2
                                }}
                            ]'>										
                                <div class="sm-image">
                                    <asp:Image ID="anhsp1" runat="server" />
                                </div>
                                    <%--<asp:Literal ID="ltImage" runat="server"></asp:Literal>--%>
                                <div class="sm-image"><img src="Anh/Logo/LogoSapJQKNho.jpg" alt="product image thumb"></div>
                               <%-- <div class="sm-image"><img src="assets/images/product/small-product/s-product-3.jpg" alt="product image thumb"></div>--%>
                                
                            </div>
                        </div>
                        <!--Product Details Left -->
		            </div>
		            <div class="col-md-6">
                        <!--Product Details Content Start-->
		                <div class="product-details-content">
                            <!--Product Nav Start-->
                            <div class="product-nav">
                                <a href="#"><i class="fa fa-angle-left"></i></a>
                                <a href="#"><i class="fa fa-angle-right"></i></a>
                            </div>
                            <!--Product Nav End-->
		                    <h2><asp:Label ID="LbtenSP" runat="server" Text='<%# Eval("tenSP") %>'/></h2>
		                    <div class="single-product-reviews">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <a class="review-link" href="#">(1 customer review)</a>
                            </div>
                            <div class="single-product-price">
                                <span class="price new-price"><asp:Label ID="lbdonGia" runat="server" Text='<%# Eval("donGia") %>'/> đ</span>
                                <span class="regular-price"><asp:Label ID="LbkhuyenMai" runat="server" Text='<%# Eval("khuyenMai") %>'/> đ</span>
                            </div>
                            <div class="product-description">
                                <p>Dung tích: <asp:Label ID="LbdungTich" runat="server" Text='<%# Eval("dungTich") %>'/> </p>
                                <p>Danh mục: <asp:Label ID="LbdanhMuc" runat="server" Text='<%# Eval("maDanhMuc") %>'/> </p>
                            </div>
                            <div class="single-product-quantity">
                                <form class="add-quantity" action="#">
                                    <label>Số Lượng</label>
                                     <div class="product-quantity">
                                         <%--<input value="1" type="number">--%>
                                        <asp:TextBox ID="txtOrderQuantity" CssClass="cart-plus-minus-box" runat="server" 
                                               Text="1" ></asp:TextBox>
                                     </div>
                                    <%--<asp:Button ID="btnCheckQuantity" runat="server" 
                                                Text="Kiểm tra hàng trong kho" CssClass="btn-check" OnClick="GetValue" OnClientClick="return true;" />--%>
                                            <div style="margin-top: 15px;">
                                                <p>&#9989; &nbsp;Còn &#160;<asp:Label ID="lbQuantityStatus" CssClass="add-to-cart" runat="server"></asp:Label>
                                                    &#160; sản phẩm
                                                </p>
                                            </div>
                                    <div class="add-to-link">
                                        <%--<button class="product-add-btn" data-text="add to cart">--%>
                                            <asp:Button ID="btnAddToCart"  CssClass="product-add-btn" Text="Add to cart" runat="server"
                                                 OnClick="btnAddToCart_Click"  />
                                            <%--<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="GioHang.aspx?action">Add To Cart</asp:HyperLink>--%>
                                        <%--</button> --%>
                                  
                                 
                                    </div>
                                </form>
                           </div>
                            <div class="wishlist-compare-btn">
                                <a href="#" class="wishlist-btn">Add to Wishlist</a>
                                <a href="#" class="add-compare">Compare</a>
                            </div>
                            <div class="product-meta">
                                <span class="posted-in">
                                        Categories: 
		                                <a href="#">Accessories</a>,
		                                <a href="#">Electronics</a>
		                            </span>
                            </div>
                            <div class="single-product-sharing">
                                <h3>Share this product</h3>
                                <ul>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                    <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                                </ul>
                            </div>
		                </div>
		                <!--Product Details Content End-->
		            </div>
		        </div>
            </div>
        </div>
        <!-- Single Product Section End -->

        <!--Product Description Review Section Start-->
		<div class="product-description-review-section section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-review-tab">
                            <!--Review And Description Tab Menu Start-->
                            <ul class="nav dec-and-review-menu">
                                <li>
                                <a class="active" data-toggle="tab" href="#description">Description</a>
                                </li>
                                <li>
                                <a data-toggle="tab" href="#reviews">Reviews (1)</a>
                                </li>
                            </ul>
                            <!--Review And Description Tab Menu End-->
                            <!--Review And Description Tab Content Start-->
                            <div class="tab-content product-review-content-tab" id="myTabContent-4">
                                <div class="tab-pane fade active show" id="description">
                                    <div class="single-product-description">
                                        <p>Thông tin: <asp:Label ID="LbthongTinSp" runat="server" Text='<%# Eval("thongTinSP") %>'/></p>
                                        
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="reviews">
                                    <div class="review-page-comment">
                                    <h2>1 review for Sit voluptatem</h2>
                                    <ul>
                                        <li>
                                            <div class="product-comment">
                                                <img src="assets/images/icons/author.png" alt="">
                                                <div class="product-comment-content">
                                                    <div class="product-reviews">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <p class="meta">
                                                        <strong>admin</strong> - <span>November 22, 2018</span>
                                                    <div class="description">
                                                        <p>Good Product</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="review-form-wrapper">
                                        <div class="review-form">
                                            <span class="comment-reply-title">Add a review </span>
                                            <form action="#">
                                                <p class="comment-notes">
                                                    <span id="email-notes">Your email address will not be published.</span>
                                                        Required fields are marked
                                                        <span class="required">*</span>
                                                </p>
                                                <div class="comment-form-rating">
                                                    <label>Your rating</label>
                                                    <div class="rating">
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                                <div class="input-element">
                                                    <div class="comment-form-comment">
                                                        <label>Comment</label>
                                                        <textarea name="message" cols="40" rows="8"></textarea>
                                                    </div>
                                                    <div class="review-comment-form-author">
                                                        <label>Name </label>
                                                        <input required="required" type="text">
                                                    </div>
                                                    <div class="review-comment-form-email">
                                                        <label>Email </label>
                                                        <input required="required" type="text">
                                                    </div>
                                                    <div class="comment-submit">
                                                        <button type="submit" class="form-button">Submit</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <!--Review And Description Tab Content End-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Product Description Review Section Start-->

        <!--Product section start-->
        <div
            class="product-section section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50 pb-65 pb-lg-45 pb-md-35 pb-sm-25 pb-xs-15">
            <div class="container">

                <div class="row">
                    <!-- Section Title Start -->
                    <div class="col">
                        <div class="section-title mb-40 mb-xs-20">
                            <h2>Sản Phẩm Mới</h2>
                        </div>
                    </div>
                    <!-- Section Title End -->
                </div>
                <div class="row tf-element-carousel" data-slick-options='{
                "slidesToShow": 4,
                "slidesToScroll": 1,
                "infinite": true,
                "arrows": true,
                "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "fa fa-angle-left" },
                "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "fa fa-angle-right" }
                }' data-slick-responsive='[
                {"breakpoint":1199, "settings": {
                "slidesToShow": 3
                }},
                {"breakpoint":992, "settings": {
                "slidesToShow": 2
                }},
                {"breakpoint":768, "settings": {
                "slidesToShow": 2,
                "arrows": false,
                "autoplay": true
                }},
                {"breakpoint":576, "settings": {
                "slidesToShow": 1,
                "arrows": false,
                "autoplay": true
                }}
                ]'>     
                 
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                <ItemTemplate>
                                         <div class="col-lg-3">
                        <!-- Single Product Start -->
                        <div class="single-product mb-30">  
                                            <div class="product-img">
                                                <a title='<%#:Eval("tenSP") %> <%#:Eval("maSP") %>' href='/ChiTietSanPham.aspx?maSP=<%#:Eval("maSP") %>'>
                                                                <img style="height:350px"  alt="" src='./Anh/AnhSp/<%#:Eval("hinhAnh") %>' />
                                                </a>
                                                <span class="descount-sticker">-10%</span>
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
                                                <h3><a href='/ChiTietSanPham.aspx?maSP=<%#:Eval("maSP") %>'><%#Eval("tenSP")%></a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new"> <%#Eval("khuyenMai")%></span>
                                                    <span class="old"><%#Eval("donGia")%>  đ</span></h4>
                                            </div>
                                        </div>
                                                
                                        <!-- Single Product End -->
                                    </div>
                                          </ItemTemplate>
                                   </asp:Repeater>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:JQKShopConnectionString2 %>" SelectCommand="SELECT * FROM [showSanPhamMoi]"></asp:SqlDataSource>

                </div>
            </div>
        </div>
        <!--Product section end-->

</asp:Content>
