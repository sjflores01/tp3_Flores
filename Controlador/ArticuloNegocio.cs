using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModeloDominio;
using System.Data.SqlClient;

namespace Negocio
{
    public class ArticuloNegocio
    {
        #region Metodos

        public List<Articulo> Listar()
        {
            List<Articulo> lista = new List<Articulo>();
            Articulo articulo;
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearQuery("SELECT a.Eliminado, a.Codigo, c.Descripcion as Categoria, m.Descripcion as Marca, a.Nombre, a.ImagenUrl, a.Precio, a.Id, m.Id, c.Id, a.Descripcion " +
                                      "from Articulos AS a " +
                                      "INNER JOIN Marcas as m ON a.IdMarca = m.Id " +
                                      "INNER JOIN Categorias as c ON a.IdCategoria = c.Id");
                datos.EjecutarLector();

                while (datos.lector.Read())
                {
                    articulo = new Articulo();
                    articulo.Eliminado = datos.lector.GetBoolean(0);
                    if (!articulo.Eliminado)
                    {
                        articulo.Id = datos.lector.GetInt32(7);
                        articulo.Codigo = datos.lector["Codigo"].ToString();
                        articulo.Marca = new Marca();
                        articulo.Marca.Id = datos.lector.GetInt32(8);
                        articulo.Marca.Descripcion = datos.lector["Marca"].ToString();
                        articulo.Categoria = new Categoria();
                        articulo.Categoria.Id = datos.lector.GetInt32(9);
                        articulo.Categoria.Descripcion = datos.lector["Categoria"].ToString();
                        articulo.Nombre = datos.lector["Nombre"].ToString();
                        articulo.Descripcion = datos.lector["Descripcion"].ToString();
                        articulo.Imagen = datos.lector["ImagenUrl"].ToString();
                        articulo.Precio = datos.lector.GetDecimal(6);

                        lista.Add(articulo);
                    }

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


        public void Alta(Articulo articulo)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearQuery("INSERT INTO ARTICULOS VALUES (@Codigo, @Nombre, @Descripcion, @Marca, @Categoria, @Imagen, @Precio, @Eliminado)");
                datos.agregarParametros("@Codigo",articulo.Codigo);
                datos.agregarParametros("@Nombre", articulo.Nombre);
                datos.agregarParametros("@Descripcion", articulo.Descripcion);
                datos.agregarParametros("@Marca", articulo.Marca.Id);
                datos.agregarParametros("@Categoria", articulo.Categoria.Id);
                datos.agregarParametros("@Imagen", articulo.Imagen);
                datos.agregarParametros("@Precio", articulo.Precio);
                datos.agregarParametros("@Eliminado", articulo.Eliminado);
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

        public void Baja(int Id)
        {
            AccesoADatos datos = new AccesoADatos();
            try
            {
                datos.SetearQuery("UPDATE Articulos SET Eliminado = 1 WHERE Id = " + Id);
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

        public void Modificar(Articulo articulo)
        {
            AccesoADatos datos = new AccesoADatos();
            try
            {
                datos.SetearQuery(" UPDATE Articulos SET Codigo = @Codigo, Nombre = @Nombre, Descripcion = @Descripcion," +
                    "IdMarca = @IdMarca, IdCategoria = @IdCategoria, ImagenURL = @Imagen, Precio = @Precio " +
                    "WHERE Id = @IdArticulo");
                datos.agregarParametros("@Codigo", articulo.Codigo);
                datos.agregarParametros("@Nombre", articulo.Nombre);
                datos.agregarParametros("@Descripcion", articulo.Descripcion);
                datos.agregarParametros("@IdMarca", articulo.Marca.Id);
                datos.agregarParametros("@IdCategoria", articulo.Categoria.Id);
                datos.agregarParametros("@Imagen", articulo.Imagen);
                datos.agregarParametros("@Precio", articulo.Precio);
                datos.agregarParametros("@IdArticulo", articulo.Id);
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

        public bool BuscarCodigo(string codigo)
        {
            bool result = false;
            List<Articulo> lista;
            lista = Listar();

            foreach(Articulo articulo in lista)
            {
                if(codigo == articulo.Codigo)
                {
                    result = true;
                    return result;
                }
            }
            return result;
        }

        public Articulo buscarArticulo(string codigo)
        {
            List<Articulo> articulos = Listar();

            foreach(Articulo articulo in articulos)
            {
                if(codigo == articulo.Codigo)
                {
                    return articulo;
                }
            }
            return null;
        }

        #endregion

    }
}
