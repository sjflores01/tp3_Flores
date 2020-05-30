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
                listaCarro = new List<Carro>();


                if (Session["nombreUsuario"] != null)
                {
                    lblBienvenida.Text += Session["nombreUsuario"].ToString();
                    if (Session["listaCarro"] != null)
                    {
                        listaCarro = (List<Carro>)Session["listaCarro"];
                    }
                    else
                    {
                        Session["listaCarro"] = listaCarro;
                    }


                    if (listaCarro.Count > 0)
                    {
                        lblCarritoVacio.Visible = false;
                        lblTextPrecio.Visible = true;
                        lblPrecioFinal.Visible = true;

                        if (Request.QueryString["cElim"] != null)
                        {
                            listaCarro = carroNegocio.EliminarArticulo(listaCarro, Request.QueryString["cElim"]);
                        }
                        else if (Request.QueryString["cArt"] != "")
                        {
                            listaCarro = carroNegocio.ModificarCantidad(listaCarro, Request.QueryString["cArt"], Request.QueryString["cant"]);
                            Response.Redirect("Carrito.aspx?cArt=&cant=");
                        }
                        lblPrecioFinal.Text = carroNegocio.SumarImporte(listaCarro).ToString("F2");
                        Session["listaCarro"] = listaCarro;
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx",false);
                    Context.ApplicationInstance.CompleteRequest(); //Tuve que agregarle esta linea que encontre en Stack Overflow porque me pinchaba al querer redireccionar sin haber terminado de cargar los componentes de la pagina.
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