using System;
using System.Collections.Generic;

namespace WebApp.Model;

public partial class Valoracione
{
    public int Codigo { get; set; }

    public decimal? Valoracion { get; set; }

    public DateOnly Fhvaloracion { get; set; }

    public string? Cometario { get; set; }

    public int Rut { get; set; }

    public int? IdUser { get; set; }

    public virtual CentroDeportivo RutNavigation { get; set; } = null!;
}
