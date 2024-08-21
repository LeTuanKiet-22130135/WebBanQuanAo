<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="DuyetDon.aspx.cs" Inherits="TT_ShopJQK.Admin.DuyetDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- partial -->
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Duyệt Đơn </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Điền Form</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Duyệt</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Duyệt </h4>
                    <p class="card-description"> Xác nhận </p>
                    <form class="forms-sample">
                      <div class="form-group">
                        <label for="exampleInputName1">ID</label>
                        <asp:TextBox ID="txtID" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputCity1">Duyệt Đơn Hàng</label>
                        <asp:DropDownList ID="ddlDuyet" runat="server" CssClass="=btn btn-sm btn-outline-primary dropdown-toggle ">
                                     <asp:ListItem Text="Xác Nhận Duyệt" Value="1"></asp:ListItem>
                                     <asp:ListItem Text="Chưa Duyệt" Value="0"></asp:ListItem>
                         </asp:DropDownList>
                      </div>
                        <%--CssClass="form-control"--%>
    <asp:Label ID="the" runat="server"></asp:Label>      
                    <asp:Button ID="btnSua" CssClass="btn btn-gradient-primary btn-sm" CommandName="sua" Text="Duyệt" runat="server" OnClick="btnSua_Click1" />
    <br /><asp:Button ID="btds" CssClass="btn btn-gradient-primary btn-fw" PostBackUrl="~/Admin/QuanLyDonHang.aspx" runat="server" Text="Danh Sách Đơn Hàng"/>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script> 
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <script src="../../assets/js/file-upload.js"></script>
</asp:Content>
