using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BD1_Proyecto1
{
    public partial class Editor : System.Web.UI.Page
    {
        Coneccion a;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            a = new Coneccion();

            if (IsPostBack)
            {
                string query = TextArea1.Value;

                string respuesta = a.Consultas(query);

                TextArea1.Value = respuesta;
            }
        }
    }
}