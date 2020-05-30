using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModeloDominio;
using Negocio;

namespace Negocio
{
    public class CarroNegocio
    {
        public Carro AgregarItem(Articulo articulo)
        {
            Carro carro = new Carro();

            carro.Codigo = articulo.Codigo;
            carro.Nombre = articulo.Nombre;
            carro.Descripcion = articulo.Descripcion;
            carro.Marca = articulo.Marca;
            carro.Categoria = articulo.Categoria;
            carro.Imagen = articulo.Imagen;
            carro.Precio = articulo.Precio;

            return carro;
        }

        public List<Carro> CargarLista(List<Carro> lista, Carro item)
        {
            foreach (Carro producto in lista)
            {
                if (producto.Codigo == item.Codigo)
                {
                    producto.Cantidad += item.Cantidad;
                    return lista;
                }
            }

            lista.Add(item);

            return lista;
        }

        public decimal SumarImporte(List<Carro> listaCarro)
        {
            decimal result = 0;

            foreach (Carro item in listaCarro)
            {
                result += item.Precio * item.Cantidad;
            }

            return result;
        }

        public List<Carro> ModificarCantidad(List<Carro> listaCarro, string codigo, string operacion)
        {
            if (operacion == "resta")
            {
                foreach (var item in listaCarro)
                {
                    if (item.Codigo == codigo)
                    {
                        item.Cantidad--;
                        if (item.Cantidad == 0)
                        {
                            listaCarro = EliminarArticulo(listaCarro, item.Codigo);
                            break;
                        }
                    }
                }
            }

            if (operacion == "suma")
            {
                foreach (var item in listaCarro)
                {
                    if (item.Codigo == codigo)
                    {
                        item.Cantidad++;
                    }
                }
            }

            return listaCarro;
        }

        public List<Carro> EliminarArticulo(List<Carro> listaCarro, string codigo)
        {
            foreach (var item in listaCarro)
            {
                if (item.Codigo == codigo)
                {
                    listaCarro.Remove(item);
                    break;
                }
            }

            return listaCarro;
        }
    }
}
