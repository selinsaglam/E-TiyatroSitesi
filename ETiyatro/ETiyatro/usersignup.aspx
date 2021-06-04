<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="ETiyatro.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/user.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Üyelik Oluşturma</h4>
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
                                <label>Ad Soyad</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Ad Soyad"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Doğum Tarihi</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Doğum Tarihi" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Telefon Numarası</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Telefon Numarası" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Ülke</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Ülke Seç" Value="Ülke Seç"/>
                                        <asp:ListItem Text="Abhazya" Value="Abhazya"/>
                                        <asp:ListItem Text="Afganistan" Value="Afganistan"/>
                                        <asp:ListItem Text="Almanya" Value="Almanya"/>
                                        <asp:ListItem Text="Amerika Birleşik Devletleri" Value="Amerika Birleşik Devletleri"/>
                                        <asp:ListItem Text="Andorra" Value="Andorra"/>
                                        <asp:ListItem Text="Arnavutluk" Value="Arnavutluk"/>
                                        <asp:ListItem Text="Avusturya" Value="Avusturya"/>
                                        <asp:ListItem Text="Azerbaycan" Value="Azerbaycan"/>
                                        <asp:ListItem Text="Belarus" Value="Belarus"/>
                                        <asp:ListItem Text="Belçika" Value="Belçika"/>
                                        <asp:ListItem Text="Birleşik Krallık" Value="Birleşik Krallık"/>
                                        <asp:ListItem Text="Bosna-Hersek" Value="Bosna-Hersek"/>
                                        <asp:ListItem Text="Bulgaristan" Value="Bulgaristan" />
                                        <asp:ListItem Text="Çek Cumhuriyeti" Value="Çek Cumhuriyeti" />
                                        <asp:ListItem Text="Danimarka" Value="Danimarka" />
                                        <asp:ListItem Text="Ermenistan" Value="Ermenistan" />
                                        <asp:ListItem Text="Estonya" Value="Estonya" />
                                        <asp:ListItem Text="Finlandiya" Value="Finlandiya" />
                                        <asp:ListItem Text="Fransa" Value="Fransa" />
                                        <asp:ListItem Text="Gürcistan" Value="Gürcistan" />
                                        <asp:ListItem Text="Hırvatistan" Value="Hırvatistan" />
                                        <asp:ListItem Text="Hollanda" Value="Hollanda" />
                                        <asp:ListItem Text="İrlanda" Value="İrlanda" />
                                        <asp:ListItem Text="İspanya" Value="İspanya" />
                                        <asp:ListItem Text="İsveç" Value="İsveç" />
                                        <asp:ListItem Text="İsviçre" Value="İsviçre" />
                                        <asp:ListItem Text="İtalya" Value="İtalya" />
                                        <asp:ListItem Text="İzlanda" Value="İzlanda" />
                                        <asp:ListItem Text="Karadağ" Value="Karadağ" />
                                        <asp:ListItem Text="Kazakistan" Value="Kazakistan" />
                                        <asp:ListItem Text="Kıbrıs" Value="Kıbrıs" />
                                        <asp:ListItem Text="Kuzey Makedonya" Value="Kuzey Makedonya" />
                                        <asp:ListItem Text="Letonya" Value="Letonya" />
                                        <asp:ListItem Text="Litvanya" Value="Litvanya" />
                                        <asp:ListItem Text="Lihtenştayn" Value="Lihtenştayn" />
                                        <asp:ListItem Text="Lüksemburg" Value="Lüksemburg" />
                                        <asp:ListItem Text="Macaristan" Value="Macaristan" />
                                        <asp:ListItem Text="Malta" Value="Malta" />
                                        <asp:ListItem Text="Moldova" Value="Moldova" />
                                        <asp:ListItem Text="Monako" Value="Monako" />
                                        <asp:ListItem Text="Norveç" Value="Norveç" />
                                        <asp:ListItem Text="Polonya" Value="Polonya" />
                                        <asp:ListItem Text="Portekiz" Value="Portekiz" />
                                        <asp:ListItem Text="Romanya" Value="Romanya" />
                                        <asp:ListItem Text="Rusya" Value="Rusya" />
                                        <asp:ListItem Text="San Marino" Value="San Marino" />
                                        <asp:ListItem Text="Sırbistan" Value="Sırbistan" />
                                        <asp:ListItem Text="Slovakya" Value="Slovakya" />
                                        <asp:ListItem Text="Slovenya" Value="Slovenya" />
                                        <asp:ListItem Text="Türkiye" Value="Türkiye" />
                                        <asp:ListItem Text="Ukrayna" Value="Ukrayna" />
                                        <asp:ListItem Text="Vatikan" Value="Vatikan" />
                                        <asp:ListItem Text="Yunanistan" Value="Yunanistan" />                               
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Şehir</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Şehir"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Pin Kodu</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Pin Kodu" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Adres</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Adres" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info">Giriş Bilgileri</span>
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-md-6">
                                <label>Üye ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Üye ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Şifre</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Şifre" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Üye Ol" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Ana Sayfaya Dön</a><br><br>
            </div>
        </div>
    </div>


</asp:Content>
