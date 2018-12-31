<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/master.Master" AutoEventWireup="true" CodeBehind="companias.aspx.cs" Inherits="PRUEBASII.Forms.companias" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="div_grilla">
        <h4>COMPAÑIAS</h4>
        <asp:Button runat="server" ID="btnnuevacom" Text="Agregar" CssClass="btn btn-success" OnClick="btnnuevacom_Click" />
        <br />
        <asp:Panel runat="server" ID="pnlagregarcompania" Visible="false">
            <form action="companias.aspx">
                <div class="form-group text-xl-left">
                    <label class="titulo" for="nombre">Nombre:</label>
                    <input class="form-control" id="txbnombre" runat="server" />
                </div>
                <div class="form-group">
                    <label class="titulo" for="nit">NIT:</label>
                    <input class="form-control" id="txbnit" runat="server" />
                </div>
                <div class="form-group">
                    <label class="titulo" for="dve">Digito Ver:</label>
                    <input class="form-control" id="txbdve" runat="server" />
                </div>
                <div class="form-group">
                    <label class="titulo" for="te1">Telefono 1:</label>
                    <input class="form-control" id="txbte1" runat="server" />
                </div>
                <div class="form-group">
                    <label class="titulo" for="te2">Telefono 2:</label>
                    <input class="form-control" id="txbte2" runat="server" />
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
        <asp:GridView ID="grvcompanias" runat="server" PageSize="5" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="grvcompanias_PageIndexChanging"
            ShowHeaderWhenEmpty="True" EmptyDataText="No se encontraron registros para mostrar" CssClass="table  table-striped table-bordered " CellPadding="2" ForeColor="#333333" GridLines="None" Font-Underline="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide">
                    <HeaderStyle CssClass="hide"></HeaderStyle>

                    <ItemStyle CssClass="hide"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="nit" HeaderText="NIT" />
                <asp:BoundField DataField="telefono1" HeaderText="Telefono 1" />
                <asp:BoundField DataField="telefono2" HeaderText="Telefono 2" />
                <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                <asp:BoundField DataField="estado" HeaderText="Estado" />
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
