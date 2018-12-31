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
    public partial class clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCombos();
            }
            CargarGrillaClientes();
        }

        protected void btnnuevocli_Click(object sender, EventArgs e)
        {
            try
            {
                pnlagregarcliente.Visible = true;
                btnnuevocli.Visible = false;
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
                pnlagregarcliente.Visible = false;
                btnnuevocli.Visible = true;
                cmbtdoc.ClearSelection();
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
                if (txbnombre.Value != "" || cmbtdoc.SelectedValue != "" || txbiden.Value != "" || txbtel.Value != "" || txbdir.Value != "")
                {
                    entClientes obj = new entClientes();
                    obj.Operacion = 1;
                    obj.id = Convert.ToInt32(Session["IdCliente"]);
                    obj.nombre = txbnombre.Value;
                    obj.tipo_doc = Convert.ToInt32(cmbtdoc.SelectedValue);
                    obj.identificacion = txbiden.Value;
                    obj.telefono = txbtel.Value;
                    obj.direccion = txbdir.Value;
                    if (negClientes.AgregarCompanias(obj) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Guardado()", true);
                        LimpiarCampos();
                        pnlagregarcliente.Visible = false;
                        btnnuevocli.Visible = true;
                        CargarGrillaClientes();
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
                //cargar el combo de tipos de identificacion
                cmbtdoc.Items.Add(new ListItem("--Seleccione Tipo Documento--", "0"));
                List<entTipoDoc> TiposIdenti = negTipoDoc.listarTiposDocs();
                foreach (entTipoDoc objdpto in TiposIdenti)
                {
                    ListItem item = new ListItem(objdpto.descripcion, objdpto.id.ToString());
                    cmbtdoc.Items.Add(item);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void LimpiarCampos()
        {
            txbnombre.Value = "";
            cmbtdoc.ClearSelection();
            txbiden.Value = "";
            txbtel.Value = "";
            txbdir.Value = "";
        }

        protected void CargarGrillaClientes()
        {
            try
            {
                grvclientes.DataSource = negClientes.ListarClientes();
                grvclientes.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btneditar_Click(object sender, EventArgs e)
        {
            try
            {
                Button btneditar = (Button)sender;
                TableCell grvclientese = (TableCell)btneditar.Parent;
                GridViewRow row = (GridViewRow)grvclientese.Parent;
                grvclientes.SelectedIndex = row.RowIndex;
                int fila = row.RowIndex;
                int idcli = int.Parse(grvclientes.Rows[fila].Cells[0].Text);
                Session["IdCliente"] = idcli;
                int operacion = 2;
                entClientes obj = negClientes.ListarClientesEditar(operacion, idcli);
                txbnombre.Value = obj.nombre;
                cmbtdoc.SelectedValue = Convert.ToInt32(obj.idtdoc).ToString();
                txbiden.Value = obj.identificacion;
                txbtel.Value = obj.telefono;
                txbdir.Value = obj.direccion;
                pnlagregarcliente.Visible = true;
                btnnuevocli.Visible = false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void grvclientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grvclientes.PageIndex = e.NewPageIndex;
                grvclientes.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}