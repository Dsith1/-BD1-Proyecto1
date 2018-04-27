using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace _BD1_Proyecto1
{


    public partial class Login : System.Web.UI.Page
    {

        Coneccion a;

        protected void Page_Load(object sender, EventArgs e)
        {
            a = new Coneccion();
            
            if (IsPostBack)
            {
                string user = Text1.Value;
                string contra = Password1.Value;

                if (a.Login(user, contra))
                {
                    Response.Redirect("Menu.html");
                }
                else
                {
                    Response.Write("<p>Usuario/contraseña incorrectos</p>");
                }
            }
        }

  








    }
}