using System;
using System.Collections.Generic;
using System.Text;

namespace ModeloDominio
{
    public class Marca
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }

        public Marca() { }

        public Marca (int Id, string Descripcion)
        {
            this.Id = Id;
            this.Descripcion = Descripcion;
        }

        public override string ToString()
        {
            return Descripcion;
        }
    }
}
