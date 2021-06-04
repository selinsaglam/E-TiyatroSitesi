<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="ETiyatro.adminbookissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("< thead ></thead > ").append($(this).find("tr: first"))).dataTable();
       });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Kitap Alma/Verme</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/books.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Üye ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Üye ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Kitap ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Kitap ID"></asp:TextBox>
                                     <asp:Button class="btn btn-dark" ID="Button1" runat="server" Text="Git" OnClick="Button1_Click" />
                                     </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Üye Adı</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Üye Adı" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Kitap Adı</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Kitap Adı" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Başlangıç Tarihi</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Başlangıç Tarihi" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Bitiş Tarihi</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Bitiş Tarihi" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Basım" OnClick="Button2_Click" />
                            </div>
                           
                            <div class="col-6">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-success" runat="server" Text="Geri Dön" OnClick="Button4_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Ana Sayfaya Dön</a><br><br>
            </div> 

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Verilmiş Kitapların Listesi</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:etiyatroConnectionString %>' SelectCommand="SELECT * FROM [kitap_basim]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="uye_id" HeaderText="Üye ID" SortExpression="uye_id"></asp:BoundField>
                                        <asp:BoundField DataField="uye_ad" HeaderText="Üye AD" SortExpression="uye_ad"></asp:BoundField>
                                        <asp:BoundField DataField="kitap_id" HeaderText="Kitap ID" SortExpression="kitap_id"></asp:BoundField>
                                        <asp:BoundField DataField="kitap_ad" HeaderText="Kitap AD" SortExpression="kitap_ad"></asp:BoundField>
                                        <asp:BoundField DataField="basim_tarihi" HeaderText="Basım Tarihi" SortExpression="basim_tarihi"></asp:BoundField>
                                        <asp:BoundField DataField="bitis_tarihi" HeaderText="Vadesi Dolmuş" SortExpression="bitis_tarihi"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
