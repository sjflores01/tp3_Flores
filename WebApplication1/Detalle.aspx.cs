using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModeloDominio;
using Negocio;

namespace WebApplication1
{
    public partial class Detalle : System.Web.UI.Page
    {
        public Articulo articulo { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            List<Articulo> lista;
            
            try
            {
                lista = articuloNegocio.Listar();
                string codigo = Request.QueryString["cArt"];
                articulo = lista.Find(A => A.Codigo == codigo);
                lblPrecio.Text = articulo.Precio.ToString("F2");
            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx");
            }

        }

        protected void btnAgregarArticulo_Click(object sender, EventArgs e)
        {
            CarroNegocio carroNegocio = new CarroNegocio();
            Carro item = new Carro();
            List<Carro> listaCarro = new List<Carro>();

            item = carroNegocio.AgregarItem(articulo);
            item.Cantidad = Convert.ToInt32(txtBoxCantidad.Text);

            if(Session["listaCarro"] != null)
            {
                listaCarro = (List<Carro>)Session["listaCarro"];
                Session["listaCarro"] = carroNegocio.CargarLista(listaCarro, item);
            }
            else
            {
                listaCarro.Add(item);
                Session["listaCarro"] = listaCarro;
            }

            Response.Redirect("Home.aspx");
        }
    }
}