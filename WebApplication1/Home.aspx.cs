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
    public partial class Home : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            string search = txtBoxBuscar.Text;

            if (search != null && search != "")
            {
                listaArticulos = articuloNegocio.Listar();
                listaArticulos = listaArticulos.FindAll(A => A.Nombre.ToLower().Contains(search.ToLower())  ||
                                                                A.Marca.Descripcion.ToLower().Contains(search.ToLower()));
            }
            else
            {
                listaArticulos = articuloNegocio.Listar();
            }

            if (listaArticulos.Count <= 0)
            {
                lblNoLoTenemos.Visible = true;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            
        }
    }
}