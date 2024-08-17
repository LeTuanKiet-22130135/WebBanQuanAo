<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="TT_ShopJQK.ThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
   <script type="text/javascript">
       function Validate() {
           var msg = "";
           msg += MobileNumberValidation();
           if (msg != "") {
               alert(msg);
               return false;
           }
           else {
               return true;
           }
       }
       function MobileNumberValidation() {
           var login;
           var controlLogin = document.getElementById("<%=txtname.ClientID %>")
            login = controlLogin.value;
            if (login == "") {
                return ("Bạn cần đăng nhập để mua hàng");
            }
            else {
                var a = document.getElementById("<%=txtPhone.ClientID %>").value;
                var val;
                val = /^[1-9]{1}[0-9]{9}$/;
                val2 = /^\d{10}$/;
                if (a == "") {
                    return ("Bạn không được để trống điện thoại" + "\n");
                    document.getElementById("txtPhone").focus();
                }
                else if (isNaN(a)) {
                    return ("Bạn phải nhập chữ số cho điện thoại");

                }
                else if (a.length < 10) {
                    return ("Bạn phải nhập 10 chữ số");
                }
                else if (a.length > 10) {
                    return ("Bạn phải nhập 10 chữ số");
                }
                else if (a.charAt(0)!=0) {
                    return ("Ký tự đầu tiên phải là 0");
                }
                else {
                    var add;
                    var controlAdd = document.getElementById("<%=txtAddress.ClientID %>")
                    add = controlAdd.value;
                    if (add == "") {
                        return ("Địa chỉ không được để trống" + "\n");
                    }
                    else {
                        return "";
                    }
                }
               
           }

       }
   </script>
    <style>
        .mt-95 {
            margin-top: 35px;
        }

        .table-content table {
            text-align: center;
            font-family: system-ui;
        }

        .checkout-area h3.shoping-checkboxt-title {
            font-family: system-ui;
        }

        .col-xl-5 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 41.666667%;
            /* flex: 0 0 41.666667%; */
            max-width: 100%;
            min-width: 83.5%;
            margin-left: 125px;
        }
    </style>
   <!-- Page Banner Section Start -->
        <div class="page-banner-section section bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col">
                        
                        <div class="page-banner text-center">
                            <h1>Thanh Toán</h1>
                            <ul class="page-breadcrumb">
                                <li><a href="index.html">Home</a></li>
                                <li>Checkout</li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Banner Section End -->
    <hr />
    <br />
    <!-- content-wraper start -->
    <div class="content-wraper mt-95">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-xl-10 offset-xl-1">
                    <!-- coupon-area start -->
                  
                    <!-- coupon-area end -->
                </div>
            </div>
            <!-- checkout-area start -->
            <div class="checkout-area">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-6 offset-xl-1 col-xl-5 col-sm-12">
                                <div>
                                    <div class="checkbox-form">
                                        <h2 style="color:red; text-align:center" class="shoping-checkboxt-title"> Xác Nhận Đơn Hàng</h2>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <p class="single-form-row">
                                                    <label>Họ tên<span class="required">*</span></label>                              
                                                    <asp:TextBox Width="200px" ID="txtname" runat="server"></asp:TextBox>
                                                </p>
                                            </div>
                                            <div class="col-lg-6">
                                                <p class="single-form-row">
                                                    <label>Số điện thoại: </label>
                                                    <asp:TextBox Width="200px" ID="txtPhone" runat="server"></asp:TextBox><asp:Label ID="lbMsg1" runat="server" ForeColor="Red"></asp:Label>
                                                </p>
                                            </div>
                                            <div class="col-lg-6">
                                                <p class="single-form-row">
                                                    <label>Email   <span class="required">* </span></label>
                                                    <asp:TextBox Width="205px" ID="txtEmail" runat="server"></asp:TextBox>
                                                </p>
                                            </div>
                                            <div class="col-lg-6">
                                                <p class="single-form-row">
                                                    <label>Địa Chỉ Nhận:<span class="required"></span></label>
                                                    <asp:TextBox Width="200px" ID="txtAddress" runat="server"></asp:TextBox><asp:Label ID="lbMsg2" runat="server" ForeColor="Red"></asp:Label>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6  col-xl-5 col-sm-12">
                                <div class="checkout-review-order">
                                    <div class="table-content table-responsive">
                                        <div class="col-12 mb-60">
                                        <asp:GridView ID="grdcart" runat="server" DataKeyNames="maSP"
                                            AutoGenerateColumns="False" CssClass="table"
                                            ShowHeaderWhenEmpty="True" OnRowDataBound="grdcart_RowDataBound">
                                            <Columns>
                                                <asp:BoundField DataField="maSP" HeaderText="Mã SP" Visible="false" />
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbID" runat="server" Text='<%# Eval("maSP") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="tenSP" HeaderText="TÊN SẢN PHẨM">
                                                    <ItemStyle Width="300px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="donGia" HeaderText="ĐƠN GIÁ">
                                                    <ItemStyle Width="170px" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="SỐ LƯỢNG MUA">
                                                    <ItemStyle CssClass="plantmore-product-quantity" Width="170px" />
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("quantity") %>'
                                                            TextMode="Number"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="money" HeaderText="SỐ TIỀN" DataFormatString="{0:###,###.00}" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                 </div>
                                    <div class="checkout-payment">
                                        <div class="payment_methods">
                                            <p>
                                                <label>Phương thức thanh toán tất cả các loại thẻ ngân hàng: <br />
                                                    <a href="#">
                                                    
                                                    <img style="width:300px; height:30px" src="assets/images/payment.png" />
                                               </a></label>
                                            </p><br />
                                           <%-- <p style="text-align:left" >Ghi chú: <asp:TextBox ID="ghichu" runat="server" CssClass="offset-sm-0" Width="200px"></asp:TextBox>--%>
                                            </p>

                                            <p>*Lưu ý: Bạn phải đăng nhập tài khoản trước khi thanh toán. Nếu chưa có tài khoản xin vui lòng đăng kí <a href="DangKi.aspx">Tại Đây!</a></p>
                                            <p><small> Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</small></p><br />
                                        </div>
                                        <div class="cart-summary-button">
                                            <center>
                                                 <asp:Button ID="btnPay" runat="server" OnClientClick="Validate()"
                                            CssClass="btn" Text="Thanh Toán" OnClick="btnPay_Click" />
                                        <asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
                                            </center>
                                           
                                    </div><br>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- checkout-area end -->
            <!-- content-wraper end -->
        </div>
    </div>
                        
</asp:Content>
