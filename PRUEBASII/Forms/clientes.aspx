<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/master.Master" AutoEventWireup="true" CodeBehind="clientes.aspx.cs" Inherits="PRUEBASII.Forms.clientes" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_grilla">
        <h4>CLIENTES</h4>
        <asp:Button runat="server" ID="btnnuevocli" Text="Agregar" CssClass="btn btn-success" OnClick="btnnuevocli_Click" />
        <br />
        <asp:Panel runat="server" ID="pnlagregarcliente" Visible="false">
            <form action="clientes.aspx">
                <div class="form-group text-xl-left">
                    <label class="titulo" for="nombre">Nombre:</label>
                    <input class="form-control" id="txbnombre" runat="server" />
                </div>
                <div class="form-group">
                    <label class="titulo" for="dve">Tipo Doc:</label>
                    <asp:DropDownList ID="cmbtdoc" CssClass="btn btn-default dropdown-toggle" runat="server"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="titulo" for="nit">Identificacion:</label>
                    <input class="form-control" id="txbiden" runat="server" />
                </div>
                <div class="form-group">
                    <label class="titulo" for="tel">Telefono:</label>
                    <input class="form-control" id="txbtel" runat="server" />
                </div>
                <div class="form-group">
                    <label class="titulo" for="dir">Direccion:</label>
                    <input class="form-control" id="txbdir" runat="server" />
                </div>
                <asp:Button runat="server" ID="btnguardar" Text="Guardar" CssClass="btn btn-success" OnClick="btnguardar_Click" />
                <asp:Button runat="server" ID="btncancelar" Text="Cancelar" CssClass="btn btn-danger" OnClick="btncancelar_Click" />

            </form>
        </asp:Panel>
        <br />
        <asp:GridView ID="grvclientes" runat="server" PageSize="5" AutoGenerateColumns="false" AllowPaging="True"
            ShowHeaderWhenEmpty="True" OnPageIndexChanging="grvclientes_PageIndexChanging" EmptyDataText="No se encontraron registros para mostrar" CssClass="table  table-striped table-bordered " CellPadding="2" ForeColor="#333333" GridLines="None" Font-Underline="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide">
                    <HeaderStyle CssClass="hide"></HeaderStyle>
                    <ItemStyle CssClass="hide"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="tdocumento" HeaderText="Tipo Doc" />
                <asp:BoundField DataField="identificacion" HeaderText="Identificacion" />
                <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button runat="server" ID="btneditar" Text="Editar" CssClass="btn btn-default" OnClick="btneditar_Click" />
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
