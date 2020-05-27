using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModeloDominio;
using System.Data.SqlClient;

namespace Negocio
{
    public class MarcaNegocio
    {
        #region Metodos

        public List<Marca> Listar()
		{
			AccesoADatos datos = new AccesoADatos();
			List<Marca> lista = new List<Marca>();
			Marca marca;
			try
			{
				datos.SetearQuery("SELECT Id, Descripcion FROM Marcas");
				datos.EjecutarLector();

				while (datos.lector.Read())
				{
					marca = new Marca();
					marca.Id = datos.lector.GetInt32(0);
					marca.Descripcion = datos.lector["Descripcion"].ToString();
					lista.Add(marca);
				}

				return lista;
			}
			catch (Exception ex)
			{

				throw ex;
			}
			finally
			{
				datos.CerrarConexion();
			}
		}

		public void Alta(Marca marca)
		{
			AccesoADatos datos = new AccesoADatos();

			try
			{
				datos.SetearQuery("INSERT INTO Marcas VALUES (@Descripcion)");
				datos.agregarParametros("@Descripcion", marca.Descripcion);
				datos.EjecutarAccion();
			}
			catch (Exception ex)
			{

				throw ex;
			}
			finally
			{
				datos.CerrarConexion();
			}
		}

		public bool BuscarNombre(string nombre)
		{
			bool result = false;
			List<Marca> lista;
			lista = Listar();

			foreach(Marca marca in lista)
			{
				if(nombre == marca.Descripcion.ToLower())
				{
					result = true;
					return result;
				}
			}
			return result;
		}

        #endregion
    }
}
