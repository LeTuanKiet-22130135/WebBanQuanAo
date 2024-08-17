<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="QuanLyUsers.aspx.cs" Inherits="TT_ShopJQK.Admin.QuanLyUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- partial -->
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Bảng Users </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Quản Lý Users</a></li>
                  <li class="breadcrumb-item active" >Bảng Users</li>
                </ol>
              </nav>
            </div>
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Users</h4>
                    <asp:Button ID="btThem" CssClass="btn btn-gradient-primary btn-sm" PostBackUrl="~/Admin/ThemUsers.aspx"  runat="server" Text="Thêm User"/><br />
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="343px" Width="1071px">
                          <Columns>
                              <asp:BoundField DataField="IDDN" HeaderText="ID Đăng nhập"  />
                              <asp:BoundField DataField="tenDN" HeaderText="Tên đăng nhập" />
                              <asp:BoundField DataField="email" HeaderText="Email"  />
                              <asp:BoundField DataField="diaChi" HeaderText="Địa Chỉ"  />
                              <asp:BoundField DataField="sdt" HeaderText="Phone"  />
                              <asp:BoundField DataField="matkhauDN" HeaderText="Password" />
                              <%--<asp:CheckBoxField DataField="quyen" HeaderText="quyen" />--%>
                               <asp:TemplateField  HeaderText="Quyền">
                            <ItemTemplate>
                                 <asp:CheckBox CssClass="form-check form-check-primary" ID="cbBoard" Checked='<%# Convert.ToBoolean(Eval("quyen")) %>' runat="server" Enabled="false"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                               <asp:TemplateField HeaderText="Xoá">
                <ItemTemplate>
                    <asp:Button ID="buXoa" CssClass="btn btn-gradient-primary btn-sm" CommandName="xoa" CommandArgument='<%# Bind("IDDN") %>' Text="Xoá" 
                        OnCommand="Xoa_click" runat="server" OnClientClick="return confirm('xoa di!')" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sửa">
                <ItemTemplate>
                    <asp:Button ID="btnSua" CssClass="btn btn-gradient-primary btn-sm" CommandName="sua" CommandArgument='<%# Bind("IDDN") %>' Text="Sửa" 
                        OnCommand="Sua_click" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

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
                      
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JQKShopConnectionString2 %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                      
                  </div>
                </div>
              </div>
             
            </div>
          </div>
          
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>

</asp:Content>
