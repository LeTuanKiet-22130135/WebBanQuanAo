<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="SuaUsers.aspx.cs" Inherits="TT_ShopJQK.Admin.SuaUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- partial -->
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Sửa Users </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Điền Form</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Sửa</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Sửa Users</h4>
                    <p class="card-description"> Update </p>
                    <form class="forms-sample">
                      <div class="form-group">
                        <label for="exampleInputName1">ID Đăng nhập</label>
                        <asp:TextBox ID="txtIDDN" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                      </div>
                        <div class="form-group">
                        <label for="exampleInputName1"> Tên Đăng nhập</label>
                        <asp:TextBox ID="txtTendangnhap" class="form-control" runat="server"></asp:TextBox>
                      
                      </div>
                      <div class="form-group">
                        <label for="exampleInputName1">Email</label>
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail3">Địa chỉ</label>
                        <asp:TextBox ID="txtDiachi" class="form-control" runat="server"></asp:TextBox>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">Số điện thoại</label>
                        <asp:TextBox ID="txtsdt" class="form-control" runat="server"></asp:TextBox>
                      </div>
                         <div class="form-group">
                        <label for="exampleTextarea1">Mật khẩu đăng nhập</label>
                        <asp:TextBox ID="txtMatkhau" class="form-control" runat="server"></asp:TextBox>
                          </div>
                      <div class="form-group">
                        <label for="exampleInputCity1">Quyền Quản trị</label>
                        <asp:DropDownList ID="ddlQuyen" runat="server" CssClass="=btn btn-sm btn-outline-primary dropdown-toggle ">
                                     <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                                     <asp:ListItem Text="User" Value="0"></asp:ListItem>
                         </asp:DropDownList>
                      </div>
                    
                      <%--<button type="submit" class="btn btn-gradient-primary mr-2">Submit</button>
                      <button class="btn btn-light">Cancel</button>--%>
    <asp:Label ID="the" runat="server"></asp:Label>      
                    <asp:Button ID="btnSua" CssClass="btn btn-gradient-primary btn-sm" CommandName="sua" Text="Sửa" runat="server" OnClick="btnSua_Click1" />
    <br /><asp:Button ID="btds" CssClass="btn btn-gradient-primary btn-fw" PostBackUrl="~/Admin/QuanLyUsers.aspx" runat="server" Text="Danh Sach Users"/>
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
