<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="ETiyatro.viewbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
            <div class="row">

                <div class="col-sm-12">
                    <center>
                        <h3>
                        Kitap Listesi
                        </h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:etiyatroConnectionString %>" SelectCommand="SELECT * FROM [kitap]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="kitap_id" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="kitap_id" HeaderText="ID" ReadOnly="True" SortExpression="kitap_id">
                                                    <ControlStyle Font-Bold="True" />
                                                    <ItemStyle Font-Bold="True" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-10">
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("kitap_ad") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <span>Yazar - </span>
                                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("yazar_ad") %>'></asp:Label>
                                                                            &nbsp;| <span><span>&nbsp;</span>Tur - </span>
                                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("tur") %>'></asp:Label>
                                                                            &nbsp;|
                                                                            <span>
                                                      Dil -<span>&nbsp;</span>
                                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("dil") %>'></asp:Label>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Yayımcı -
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("yayimci_ad") %>'></asp:Label>
                                                                            &nbsp;| Yayım Tarihi -
                                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("yayim_tarihi") %>'></asp:Label>
                                                                            &nbsp;| Sayfa Sayısı -
                                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("sayfa_sayisi") %>'></asp:Label>
                                                                            &nbsp;| Baskı -
                                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("baski") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Tutar -
                                                                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("kitap_fiyat") %>'></asp:Label>
                                                                            &nbsp;| Güncel Stok -
                                                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("guncel_stok") %>'></asp:Label>
                                                                            &nbsp;| Cari Stok -
                                                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("cari_stok") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Açıklama -
                                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("kitap_aciklamasi") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("kitap_img_link") %>' />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <center>
                    <a href="homepage.aspx">
                        << Anasayfaya dön</a><span class="clearfix"></span>
                            <br />
                <center>
            </div>
        </div>

</asp:Content>
