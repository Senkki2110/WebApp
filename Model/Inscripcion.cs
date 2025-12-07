using System;
using System.Collections.Generic;

namespace WebApp.Model;

public partial class Inscripcion
{
    public int Numero { get; set; }

    public DateOnly Fhinscripcion { get; set; }

    public string Telefono { get; set; } = null!;

    public string Correo { get; set; } = null!;

    public string? Estado { get; set; }

    public int Rut { get; set; }

    public int IdUser { get; set; }

    public virtual Usuario IdUserNavigation { get; set; } = null!;

    public virtual CentroDeportivo RutNavigation { get; set; } = null!;
}
