using System;
using System.Collections.Generic;

namespace WebApp.Model;

public partial class Usuario
{
    public int IdUser { get; set; }

    public int Documento { get; set; }

    public string Nombre { get; set; } = null!;

    public string Direccion { get; set; } = null!;

    public string Telefono { get; set; } = null!;

    public string Correo { get; set; } = null!;

    public string Estado { get; set; } = null!;

    public string Contrasena { get; set; } = null!;

    public virtual ICollection <Inscripcion> Inscripcions { get; set; } = new List<Inscripcion>();

    public virtual ICollection <UsuarioRol> UsuarioRols { get; set; } = new List<UsuarioRol>();
}
