using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;

namespace _BD1_Proyecto1
{
    public class Coneccion
    {
        public OracleConnection con;

        public Coneccion()
        {

        }

        public void Conectar()
        {
            con = new OracleConnection();
            con.ConnectionString = "User Id=Dannek;Password=bobafet;Data Source=Oracle;";
            con.Open();
            Console.WriteLine("Connected to Oracle" + con.ServerVersion);
            
        }

        public bool Login(string user,string contra)
        {
            bool respuesta = false;

            Conectar();

            OracleCommand comando = con.CreateCommand();
            String query = "Select * from Usuario Where Usuario='" + user + "' and Contra='" + contra + "'";

            comando.CommandText = query;

            OracleDataReader lector = comando.ExecuteReader();

            if (lector.Read())
            {
                respuesta = true;
            }
            else
            {
                respuesta = false;
            }

            con.Close();

            return respuesta;
        }

        public bool N_User(string user,string contra)
        {
            bool respuesta = false;

            Conectar();

            OracleCommand comando = con.CreateCommand();
            String query = "Insert into Usuario(Usuario, Contra) values('" + user + "', '" + contra + "');";

            comando.CommandText = query;

            int actualizadas = comando.ExecuteNonQuery();

            if(actualizadas == 0)
            {
                respuesta = false;
            }
            else
            {
                respuesta = true;
            }


            return respuesta;
        }

        public string Consultas(string consulta)
        {
            string respuesta = "";

            try
            {
                Conectar();

                OracleCommand comando = con.CreateCommand();

                String query = consulta;

                comando.CommandText = query;

                OracleDataReader lector = comando.ExecuteReader();


                int cuenta = lector.FieldCount;

                for (int i = 0; i < cuenta; i++)
                {
                    respuesta += (lector.GetName(i)) + ";";
                }
                respuesta += "\n";

                while (lector.Read())
                {
                    for(int x = 0; x < cuenta; x++)
                    {
                        respuesta += (lector.GetValue(x))+";";
                    }

                    respuesta += "\n";
                }



            }
            catch (Exception e)
            {
                respuesta = "Error en Consulta";
            }

            con.Close();

            return respuesta;
        }

    }
}