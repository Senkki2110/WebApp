using System;
using System.Collections.Generic;

namespace WebApp.Model;

public partial class RolPermiso
{
    public int Id { get; set; }

    public int? IdRol { get; set; }

    public int? IdPermiso { get; set; }

    public virtual Permiso? IdPermisoNavigation { get; set; }

    public virtual Rol? IdRolNavigation { get; set; }
}
