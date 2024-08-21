<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="TT_ShopJQK.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Banner Section Start -->
        <div class="page-banner-section section bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col">
                        
                        <div class="page-banner text-center">
                            <h1>Giỏ Hàng</h1>
                            <ul class="page-breadcrumb">
                                <li><a href="index.html">Trang Chủ</a></li>
                                <li>Cart</li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Banner Section End -->

        <!--Cart section start-->
        <div class="cart-section section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50  pb-70 pb-lg-50 pb-md-40 pb-sm-30 pb-xs-20">
            <div class="container">
                <div class="row">
                    
                    <div class="col-12">            
                        <!-- Cart Table -->
                        <div class="cart-table table-responsive mb-30">
                            <table class="table">
                                <asp:GridView ID="grdcart" runat="server" OnRowDeleting="grdcart_RowDeleting" DataKeyNames="maSP"
                                    AutoGenerateColumns="False" CssClass="table" OnSelectedIndexChanging="grdcart_SelectedIndexChanging"
                                     ShowHeaderWhenEmpty="True">
                                    <Columns>
                                        <asp:BoundField DataField="maSP" HeaderText="Mã SP" Visible="false" />
                                        <%--<asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbID" runat="server" Text='<%# Eval("maSP") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="tenSP" HeaderText="TÊN SẢN PHẨM">
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="donGia" HeaderText="ĐƠN GIÁ">
                                            <ItemStyle Width="170px" />
                                        </asp:BoundField>
                                        <asp:TemplateField  HeaderText="Hình Ảnh">
                                            <ItemTemplate>
                                                <asp:Image ID="img1" ImageUrl='<%# "~/Anh/AnhSp/" + Eval("hinhAnh") %>' runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="200px" />
                                            
                                        </asp:TemplateField>
                                       
                                        <%--<asp:BoundField DataField="quantity" HeaderText="Quantity"/>--%>

                                        <asp:TemplateField HeaderText="SỐ LƯỢNG MUA">
                                            <ItemStyle CssClass="plantmore-product-quantity" Width="170px" />
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("quantity") %>'
                                                    TextMode="Number"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="money" HeaderText="SỐ TIỀN" DataFormatString="{0:###,###.00}" />

                                        <asp:TemplateField HeaderText="THAO TÁC">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbUpdate" runat="server"
                                                    CommandName="select" CssClass="fa fa-refresh"></asp:LinkButton>
                                                &nbsp;&nbsp;&nbsp;
                                                <asp:LinkButton ID="lbDelete" runat="server" CssClass="fa fa-times" OnClick="lbDelete_Click"
                                                    CommandName="delete" OnClientClick="return confirm(&quot;Bạn có chắc muốn xoá sản phẩm này khỏi giỏ hàng ?&quot;)"></asp:LinkButton>
                                                
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                  
                            </table>
                        </div>
                        

                        <div class="row">

                            <div class="col-lg-6 col-12 mb-5">
                                <!-- Calculate Shipping -->
                                
                                <!-- Discount Coupon -->
                                <div class="discount-coupon">
                                    <h4>Giỏ Của Bạn</h4>
                                    <form action="#">
                                        <div class="row">
                                            <div class="col-md-6 col-12 mb-25">
                                                <img src="Anh/Logo/LogoSapJQKNho.jpg" /><br />
                                                <br />
                                                <p><span> *Miễn Phí Vận Chuyển cho đơn hàng từ 400.000đ (giảm tối đa ₫70.000) </span></p>
                                            </div>
                                            <div class="col-md-6 col-12 mb-25">
                                                <asp:Button ID="btnUpgrade" CssClass="btn" Text="Tính Tiền"  OnClick="btnUpgrade_Click" runat="server" /> 
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- Cart Summary -->
                            
                            <!-- Cart Summary -->
                            <div class="col-lg-6 col-12 mb-30 d-flex">
                                <div class="cart-summary">
                                    <div class="cart-summary-wrap">
                                        <h4>Tổng tiền: </h4>
                                        
                                        <h2> <span><asp:Label ID="lbTotal" runat="server" Text="0" ></asp:Label></span></h2>
                        
                                    </div>
                                    <div class="cart-summary-button">
                               <asp:LinkButton ID="lbCheckout" CssClass="btn" runat="server" OnClick="lbCheckout_Click" Text="Thanh Toán" ></asp:LinkButton> 
                                     
                                    </div>
                                </div>
                            </div>

                        </div>
                        
                    </div>
                    
                </div>            
            </div>
        </div>
        <!--Cart section end-->

 
</asp:Content>
