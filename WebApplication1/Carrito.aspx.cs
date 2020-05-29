using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using ModeloDominio;

namespace WebApplication1
{
    public partial class Carrito : System.Web.UI.Page
    {
        public List<Carro> listaCarro { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                CarroNegocio carroNegocio = new CarroNegocio();
                if (Session[Session.SessionID + "nombreUsuario"] != null)
                {
                    lblBienvenida.Text += Session[Session.SessionID + "nombreUsuario"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

                if (Session["listaCarro"] != null)
                {
                    listaCarro = (List<Carro>)Session["listaCarro"];
                }
                else
                {
                    listaCarro = new List<Carro>();
                    Session["listaCarro"] = listaCarro;
                }


                if (listaCarro.Count > 0)
                {
                    lblCarritoVacio.Visible = false;
                    lblTextPrecio.Visible = true;
                    lblPrecioFinal.Visible = true;

                    if (Request.QueryString["cant"] == null)
                    {
                    listaCarro = carroNegocio.EliminarArticulo(listaCarro,Request.QueryString["cArt"]);
                    }
                    listaCarro = carroNegocio.ModificarCantidad(listaCarro, Request.QueryString["cArt"], Request.QueryString["cant"]);
                    lblPrecioFinal.Text = carroNegocio.SumarImporte(listaCarro).ToString("F2");
                    Session["listaCarro"] = listaCarro;
                }
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}