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
            if (txtBoxUsuario.Text == "" ||
                txtBoxContraseña.Text == "")
            {
                Response.Write("<div class='alert alert - danger' role='alert'>Complete todos los campos</div>");
            }
            else
            {
                
                Session[Session.SessionID + "nombreUsuario"] = txtBoxUsuario.Text;
                Response.Redirect("Home.aspx");
            }
        }
    }
}