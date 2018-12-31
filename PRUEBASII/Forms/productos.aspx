<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/master.Master" AutoEventWireup="true" CodeBehind="productos.aspx.cs" Inherits="PRUEBASII.Forms.productos" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_grilla">
        <h4>PRODUCTOS</h4>
        <asp:Button runat="server" ID="btnnuevopro" Text="Agregar" CssClass="btn btn-success" OnClick="btnnuevopro_Click" />
        <br />
        <asp:Panel runat="server" ID="pnlagregarproducto" Visible="false">
            <form action="productos.aspx">
                <div class="form-group text-xl-left">
                    <label class="titulo" for="nombre">Nombre:</label>
                    <input class="form-control" id="txbnombre" runat="server" />
                </div>
                <div class="form-group">
                    <label class="titulo" for="desc">Descripcion:</label>
                    <input class="form-control" id="txbdesc" runat="server" />
                </div>
                <div class="form-group">
                    <label class="titulo" for="nit">Valor:</label>
                    <input class="form-control" id="txbval" runat="server" />
                </div>
                <asp:Button runat="server" ID="btnguardar" Text="Guardar" CssClass="btn btn-success" OnClick="btnguardar_Click"/>
                <asp:Button runat="server" ID="btncancelar" Text="Cancelar" CssClass="btn btn-danger" OnClick="btncancelar_Click" />

            </form>
        </asp:Panel>
        <br />
        <asp:GridView ID="grvproductos" runat="server" PageSize="5" AutoGenerateColumns="false" AllowPaging="True"
            ShowHeaderWhenEmpty="True" OnPageIndexChanging="grvproductos_PageIndexChanging" EmptyDataText="No se encontraron registros para mostrar" CssClass="table  table-striped table-bordered " CellPadding="2" ForeColor="#333333" GridLines="None" Font-Underline="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide">
                    <HeaderStyle CssClass="hide"></HeaderStyle>
                    <ItemStyle CssClass="hide"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                <asp:BoundField DataField="valor" HeaderText="Valor" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button runat="server" ID="btneditar" Text="Editar" CssClass="btn btn-default" OnClick="btneditar_Click"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" BorderStyle="Groove" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="Black" />
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle BackColor="#2461BF" ForeColor="Black" Font-Size="Medium" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>

</asp:Content>
