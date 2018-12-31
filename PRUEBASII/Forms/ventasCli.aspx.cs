using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaNegocios;

namespace PRUEBASII.Forms
{
    public partial class ventasCli : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Idventacli"] = "0";
                CargarCombos();
            }
            CargarGrillaVentasClientes();
        }

        protected void btnnuevavta_Click(object sender, EventArgs e)
        {
            try
            {
                pnlagregarventacli.Visible = true;
                btnnuevavta.Visible = false;
                btnvtsxcli.Visible = false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnvtsxcli_Click(object sender, EventArgs e)
        {
            try
            {
                pnlvtsxcli.Visible = true;
                pnlgrvvtscli.Visible = false;
                btnnuevavta.Visible = false;
                btnvtsxcli.Visible = false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            try
            {
                pnlagregarventacli.Visible = false;
                btnnuevavta.Visible = true;
                cmbcli.ClearSelection();
                cmbpro.ClearSelection();
                btnvtsxcli.Visible = true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (cmbcli.SelectedValue != "0" || cmbpro.SelectedValue != "0")
                {
                    entVentas obj = new entVentas();
                    obj.Operacion = 1;
                    obj.id = Convert.ToInt32(Session["Idventacli"]);
                    obj.id_compania = Convert.ToInt32(cmbcli.SelectedValue);
                    obj.id_producto = Convert.ToInt32(cmbpro.SelectedValue);
                    if (negVentas.AgregarVentasClientes(obj) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Guardado()", true);
                        LimpiarCampos();
                        pnlagregarventacli.Visible = false;
                        btnnuevavta.Visible = true;
                        CargarGrillaVentasClientes();
                        Session["Idventacli"] = "0";
                        btnvtsxcli.Visible = true;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "sindatos()", true);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public void CargarCombos()
        {
            try
            {
                //cargar el combo de compañias
                cmbcli.Items.Add(new ListItem("--Seleccione Cliente--", "0"));
                List<entClientes> com = negClientes.ListarClientes();
                foreach (entClientes objcli in com)
                {
                    ListItem item = new ListItem(objcli.nombre, objcli.id.ToString());
                    cmbcli.Items.Add(item);
                }

                //cargar el combo de productos
                cmbpro.Items.Add(new ListItem("--Seleccione Producto--", "0"));
                List<entProductos> pro = negProductos.ListarProductos();
                foreach (entProductos objpro in pro)
                {
                    ListItem item = new ListItem(objpro.nombre, objpro.id.ToString());
                    cmbpro.Items.Add(item);
                }

                //cargar el combo de compañias para consulta de ventas
                cmbclivtas.Items.Add(new ListItem("--Seleccione Cliente--", "0"));
                List<entClientes> comvta = negClientes.ListarClientes();
                foreach (entClientes objcli in comvta)
                {
                    ListItem item = new ListItem(objcli.nombre, objcli.id.ToString());
                    cmbclivtas.Items.Add(item);
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void LimpiarCampos()
        {
            try
            {
                cmbcli.ClearSelection();
                cmbpro.ClearSelection();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void CargarGrillaVentasClientes()
        {
            try
            {
                grvventascli.DataSource = negVentas.ListarVentasClientes();
                grvventascli.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void cmbclivtas_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int idcli = Convert.ToInt32(cmbclivtas.SelectedValue);
                grvvtsxcli.DataSource = negVentas.ListarVentasxClientes(idcli);
                grvvtsxcli.DataBind();
            }
            catch (Exception EX)
            {

                throw EX;
            }
        }

        protected void btneditar_Click(object sender, EventArgs e)
        {
            try
            {
                btnvtsxcli.Visible = false;
                Button btneditar = (Button)sender;
                TableCell grvventasclie = (TableCell)btneditar.Parent;
                GridViewRow row = (GridViewRow)grvventasclie.Parent;
                grvventascli.SelectedIndex = row.RowIndex;
                int fila = row.RowIndex;
                int idvta = int.Parse(grvventascli.Rows[fila].Cells[0].Text);
                Session["Idventacli"] = idvta;
                int operacion = 2;
                entVentas obj = negVentas.ListarVentasEditarClientes(operacion, idvta);
                cmbcli.SelectedValue = Convert.ToInt32(obj.idcli).ToString();
                cmbpro.SelectedValue = Convert.ToInt32(obj.idpro).ToString();
                pnlagregarventacli.Visible = true;
                btnnuevavta.Visible = false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btncancela_Click(object sender, EventArgs e)
        {
            try
            {
                pnlvtsxcli.Visible = false;
                pnlgrvvtscli.Visible = true;
                btnnuevavta.Visible = true;
                btnvtsxcli.Visible = true;
                cmbclivtas.ClearSelection();
                grvvtsxcli.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}