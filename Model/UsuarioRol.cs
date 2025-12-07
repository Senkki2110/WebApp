using System;
using System.Collections.Generic;

namespace WebApp.Model;

public partial class UsuarioRol
{
    public int Id { get; set; }

    public int? IdUsuario { get; set; }

    public int? IdRol { get; set; }

    public virtual Rol? IdRolNavigation { get; set; }

    public virtual Usuario? IdUsuarioNavigation { get; set; }
}
