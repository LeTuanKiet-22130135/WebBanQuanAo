<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="TT_ShopJQK.Admin.ThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">

        <div class="page-header">
            <h3 class="page-title">Thống Kê</h3>
            <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">
                        <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                           <h4> Tổng có <asp:Label ID="tổng_số_hoá_đơnLabel" runat="server" Text='<%# Eval("[tổng số hoá đơn]") %>' /> hoá đơn</h4>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:JQKShopConnectionString2 %>" SelectCommand="SELECT * FROM [thongkehoadon]"></asp:SqlDataSource>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row">
            <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-danger card-img-holder text-white">

                    <%--------------------------------%>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div class="card-body">
                                <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                <h4 class="font-weight-normal mb-3">Tổng kho sản phẩm <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                                    <h2 class="mb-5">
                                        <asp:Label ID="tổng_sản_phẩmLabel" runat="server" Text='<%# Eval("[tổng sản phẩm]") %>' /></h2>
                                    <br />
                                    <br />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:JQKShopConnectionString2 %>" SelectCommand="SELECT * FROM [thongkesanpham]"></asp:SqlDataSource>
                    <%--------------------------------%>
                </div>
            </div>
            <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-info card-img-holder text-white">
                    <%--------------------------------%>
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3">
                        <ItemTemplate>
                            <div class="card-body">
                                <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                <h4 class="font-weight-normal mb-3">Tổng người dùng <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                    <h2 class="mb-5">
                                        <asp:Label ID="tong_nguoi_dungLabel" runat="server" Text='<%# Eval("[tong nguoi dung]") %>' /></h2>
                                    <br />
                                    <br />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:JQKShopConnectionString2 %>" SelectCommand="SELECT * FROM [thongkenguoidung]"></asp:SqlDataSource>
                    <%--------------------------------%>
                </div>
            </div>
            <div class="col-md-4 stretch-card grid-margin">
                <div class="card bg-gradient-success card-img-holder text-white">
                    <%--------------------------------%>
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource5">
                        <ItemTemplate>
                            <div class="card-body">
                                <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                <h4 class="font-weight-normal mb-3">Doanh Thu<i class="mdi mdi-diamond mdi-24px float-right"></i>
                                    <h2 class="mb-5"><asp:Label ID="tổng_doanh_thuLabel" runat="server" Text='<%# Eval("[tổng doanh thu]") %>' />  VNĐ</h2>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:JQKShopConnectionString2 %>" SelectCommand="SELECT * FROM [thongkedoanhthu]"></asp:SqlDataSource>
                    <%--------------------------------%>
                </div>
            </div>
        </div>

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Các Sản Phẩm Đã Được Mua</h4>
                    
                    <%---------------------------------%>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="257px" Width="994px">
                        <Columns>
                            <asp:BoundField DataField="tenSP" HeaderText="Tên Sản Phẩm" SortExpression="tenSP" />
                            <asp:TemplateField HeaderText="Hình Ảnh">
                                <ItemTemplate>
                                    <asp:Image Width="130px" Height="130px" ID="Image1" runat="server" ImageUrl='<%# "~/Anh/anhSp/" + Eval("hinhAnh") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="donGia" HeaderText="Đơn Giá/ 1 Sp" SortExpression="donGia" />
                            <asp:BoundField DataField="Số lượng mua" HeaderText="Số lượng mua" SortExpression="Số lượng mua" />
                            <asp:BoundField DataField="Doanh Thu" HeaderText="Doanh Thu" SortExpression="Doanh Thu" />
                            <asp:BoundField DataField="Lợi Nhuận" HeaderText="Lợi Nhuận" SortExpression="Lợi Nhuận" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JQKShopConnectionString2 %>" SelectCommand="SELECT * FROM [thongkebanhang]"></asp:SqlDataSource>

                </div>
            </div>

        </div>
    </div>
    <!-- content-wrapper ends -->
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- End custom js for this page -->
</asp:Content>
