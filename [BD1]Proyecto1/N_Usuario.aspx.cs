using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BD1_Proyecto1
{
    public partial class N_Usuario : System.Web.UI.Page
    {
        Coneccion a;

        protected void Page_Load(object sender, EventArgs e)
        {
            a = new Coneccion();

            if (IsPostBack)
            {
                string user = Text1.Value;
                string contra1 = Password1.Value;
                string contra2 = Password2.Value;

                if (contra1.Length >= 6)
                {
                    if (contra1.Equals(contra2))
                    {
                        if (a.N_User(user, contra1))
                        {
                            Response.Redirect("Login.aspx");

                        }
                        else
                        {
                            Response.Write("Error Usuario Ya existente");
                        }
                    }
                    else
                    {
                        Response.Write("<p>Las Contraseñas no coinciden</p>");
                    }
                }
                else
                {
                    Response.Write("<p>La contraseña debe contener 6 caracteres como minimo</p>");
                }
            }

        }
    }
}