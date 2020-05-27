using System;
using System.Collections.Generic;

namespace ModeloDominio
{
    public class Articulo
    {
        #region Propiedades

        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public Marca Marca { get; set; }
        public Categoria Categoria { get; set; }
        public string Imagen { get; set; }
        public decimal Precio { get; set; }
        public bool Eliminado { get; set; }

        #endregion
    }
}
