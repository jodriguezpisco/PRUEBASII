<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/master.Master" AutoEventWireup="true" CodeBehind="ventasCli.aspx.cs" Inherits="PRUEBASII.Forms.ventasCli" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div_grilla">
        <h4>VENTAS CLIENTES</h4>
        <asp:Button runat="server" ID="btnnuevavta" Text="Agregar" CssClass="btn btn-success" OnClick="btnnuevavta_Click" />
        <asp:Button runat="server" ID="btnvtsxcli" Text="Ventas x Cliente" CssClass="btn btn-success" OnClick="btnvtsxcli_Click" />
        <br />
        <asp:Panel runat="server" ID="pnlagregarventacli" Visible="false">
            <form action="ventasCli.aspx">
                <div class="form-group">
                    <label class="titulo" for="com">Cliente:</label>
                    <asp:DropDownList ID="cmbcli" CssClass="btn btn-default dropdown-toggle" runat="server"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="titulo" for="pro">Producto:</label>
                    <asp:DropDownList ID="cmbpro" CssClass="btn btn-default dropdown-toggle" runat="server"></asp:DropDownList>
                </div>
                <asp:Button runat="server" ID="btnguardar" Text="Guardar" CssClass="btn btn-success" OnClick="btnguardar_Click"/>
                <asp:Button runat="server" ID="btncancelar" Text="Cancelar" CssClass="btn btn-danger" OnClick="btncancelar_Click"/>

            </form>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlvtsxcli" Visible="false">
            <form action="ventasCli.aspx">
                <h5>VENTAS X CLIENTES</h5>
                <div class="form-group">
                    <label class="titulo" for="com">Cliente:</label>
                    <asp:DropDownList ID="cmbclivtas" OnTextChanged="cmbclivtas_TextChanged" AutoPostBack="true" CssClass="btn btn-default dropdown-toggle" runat="server"></asp:DropDownList>
                </div>
                <asp:GridView ID="grvvtsxcli" runat="server" PageSize="5" AutoGenerateColumns="false" AllowPaging="True"
                    ShowHeaderWhenEmpty="True" EmptyDataText="No se encontraron registros para mostrar" CssClass="table  table-striped table-bordered " CellPadding="2" ForeColor="#333333" GridLines="None" Font-Underline="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide">
                            <HeaderStyle CssClass="hide"></HeaderStyle>
                            <ItemStyle CssClass="hide"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="descproducto" HeaderText="Producto" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                        <asp:BoundField DataField="valor" HeaderText="Valor" />
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
                <asp:Button runat="server" ID="btncancela" Text="Cancelar" CssClass="btn btn-danger" OnClick="btncancela_Click"/>
            </form>
        </asp:Panel>
        <br />
        <asp:Panel runat="server" ID="pnlgrvvtscli">
            <asp:GridView ID="grvventascli" runat="server" PageSize="5" AutoGenerateColumns="false" AllowPaging="True"
            ShowHeaderWhenEmpty="True" EmptyDataText="No se encontraron registros para mostrar" CssClass="table  table-striped table-bordered " CellPadding="2" ForeColor="#333333" GridLines="None" Font-Underline="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide">
                    <HeaderStyle CssClass="hide"></HeaderStyle>
                    <ItemStyle CssClass="hide"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="nombre" HeaderText="Cliente" />
                <asp:BoundField DataField="descproducto" HeaderText="Producto" />
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
        </asp:Panel>
        
    </div>
</asp:Content>
