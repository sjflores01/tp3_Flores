using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoADatos
    {
        public SqlDataReader lector { get; set; }
        public SqlConnection conexion { get; set; }
        public SqlCommand comando { get; set; }

        public AccesoADatos()
        {
            conexion = new SqlConnection("data source=DESKTOP-1CME8C0\\SQLEXPRESS; initial catalog= CATALOGO_DB; integrated security= sspi");
            comando = new SqlCommand();
            comando.Connection = conexion;
        }

        public void SetearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }

        public void agregarParametros(string parametro, object valor)
        {
            comando.Parameters.AddWithValue(parametro, valor);
        }

        public void EjecutarAccion()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void EjecutarLector()
        {
            try
            {
            conexion.Open();
            lector = comando.ExecuteReader();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void CerrarConexion()
        {
            conexion.Close();
        }
    }
}
