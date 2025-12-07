using System;
using System.Collections.Generic;

namespace WebApp.Model;

public partial class Permiso
{
    public int Id { get; set; }

    public string? Accion { get; set; }

    public string? Tabla { get; set; }

    public virtual ICollection<RolPermiso> RolPermisos { get; set; } = new List<RolPermiso>();
}
