using System;
using System.Collections.Generic;

namespace WebApp.Model;

public partial class CentroDeportivo
{
    public int Rut { get; set; }

    public string Nombre { get; set; } = null!;

    public string Direccion { get; set; } = null!;

    public string Telefono { get; set; } = null!;

    public string Correo { get; set; } = null!;

    public TimeOnly? Apertura { get; set; }

    public TimeOnly? Cierre { get; set; }

    public int Capacidad { get; set; }

    public string Estado { get; set; } = null!;

    public virtual ICollection<Inscripcion> Inscripcions { get; set; } = new List<Inscripcion>();

    public virtual ICollection<Valoracione> Valoraciones { get; set; } = new List<Valoracione>();
}
