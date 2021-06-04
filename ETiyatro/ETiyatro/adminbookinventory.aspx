<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="ETiyatro.adminbookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

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
                                    <h4>Kitap Ayrıntıları</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" height="150px" width="100px" src="book_inventory/books1.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Kitap ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Kitap ID"></asp:TextBox>
                                        <asp:Button class="form-control btn btn-primary" ID="Button4" runat="server" Text="Git" OnClick="Button4_Click" />
                                     </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Kitap Adı</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Kitap Adı"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Dil</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                          <asp:ListItem Text="Türkçe" Value="Türkçe" />
                                          <asp:ListItem Text="English" Value="English" />
                                    </asp:DropDownList>
                                </div>

                                <label>Yayımcı Adı</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                          <asp:ListItem Text="Yayımcı 1" Value="Yayımcı 1" />
                                          <asp:ListItem Text="Yayımcı 2" Value="Yayımcı 2" />
                                          
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Yazar Adı</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                                          <asp:ListItem Text="Yazar 1" Value="Yazar 1" />
                                          <asp:ListItem Text="Yazar 2" Value="Yazar 2" />
                                          
                                    </asp:DropDownList>
                                </div>

                                <label>Yayım Tarihi</label>
                                <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Tarih" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Tür</label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                          <asp:ListItem Text="Tiyatro Tekniği" Value="Tiyatro Tekniği" />
                                          <asp:ListItem Text="Dünya Oyunları" Value="Dünya Oyunları" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Baskı</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Baskı"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Tutar</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Tutar" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Sayfa</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Sayfa" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Güncel Stok</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Güncel Stok" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Cari Stok</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Cari Stok" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Basılmış Kitaplar</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Basılmış Kitaplar" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-12">
                                <label>Kitap Açıklaması</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Kitap Açıklaması" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Ekle" OnClick="Button1_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Güncelle" OnClick="Button3_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Sil" OnClick="Button2_Click" />
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
                                    <h4>Kitap Stok Listesi</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:etiyatroConnectionString %>" SelectCommand="SELECT * FROM [kitap]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="kitap_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="kitap_id" HeaderText="ID" ReadOnly="True" SortExpression="kitap_id" >
                                        
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
                                                                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("kitap_ad") %>' Font-Size="X-Large" Font-Bold="True"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Yazar -
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("yazar_ad") %>'></asp:Label>
                                                                    &nbsp;| Tür -
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("tur") %>'></asp:Label>
                                                                    &nbsp;| Dil -
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("dil") %>'></asp:Label>

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

                                                                    Kitap Açıklaması -
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("kitap_aciklamasi") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-2">
                                                            <asp:Image class="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("kitap_img_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                    </Columns>
                                </asp:GridView>
                                <!--<asp:BoundField DataField="kitap_ad" HeaderText="kitap_ad" SortExpression="kitap_ad" />
                                        <asp:BoundField DataField="tur" HeaderText="tur" SortExpression="tur" />
                                        <asp:BoundField DataField="yazar_ad" HeaderText="yazar_ad" SortExpression="yazar_ad" />
                                        <asp:BoundField DataField="yayimci_ad" HeaderText="yayimci_ad" SortExpression="yayimci_ad" />
                                        <asp:BoundField DataField="yayim_tarihi" HeaderText="yayim_tarihi" SortExpression="yayim_tarihi" />
                                        <asp:BoundField DataField="dil" HeaderText="dil" SortExpression="dil" />
                                        <asp:BoundField DataField="baski" HeaderText="baski" SortExpression="baski" />
                                        <asp:BoundField DataField="kitap_fiyat" HeaderText="kitap_fiyat" SortExpression="kitap_fiyat" />
                                        <asp:BoundField DataField="sayfa_sayisi" HeaderText="sayfa_sayisi" SortExpression="sayfa_sayisi" />
                                        <asp:BoundField DataField="kitap_aciklamasi" HeaderText="kitap_aciklamasi" SortExpression="kitap_aciklamasi" />
                                        <asp:BoundField DataField="guncel_stok" HeaderText="guncel_stok" SortExpression="guncel_stok" />
                                        <asp:BoundField DataField="cari_stok" HeaderText="cari_stok" SortExpression="cari_stok" />
                                        <asp:BoundField DataField="kitap_img_link" HeaderText="kitap_img_link" SortExpression="kitap_img_link" />-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
