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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtBoxUsuario.Text == "" ||
                    txtBoxContraseña.Text == "")
                {
                    lblCompletar.Visible = true;
                }
                else
                {
                    Session["nombreUsuario"] = txtBoxUsuario.Text;
                    Response.Redirect("Carrito.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}