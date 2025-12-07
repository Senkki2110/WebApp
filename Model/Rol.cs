using System;
using System.Collections.Generic;

namespace WebApp.Model;

public partial class Rol
{
    public int Id { get; set; }

    public string? Nombre { get; set; }

    public string? Contrasena { get; set; }

    public virtual ICollection<RolPermiso> RolPermisos { get; set; } = new List<RolPermiso>();

    public virtual ICollection<UsuarioRol> UsuarioRols { get; set; } = new List<UsuarioRol>();
}
