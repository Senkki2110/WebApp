using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Scaffolding.Internal;

namespace WebApp.Model;

public partial class ProyectoContext : DbContext
{
    public ProyectoContext()
    {
    }

    public ProyectoContext(DbContextOptions<ProyectoContext> options)
        : base(options)
    {
    }

    public virtual DbSet<CentroDeportivo> CentroDeportivos { get; set; }

    public virtual DbSet<Inscripcion> Inscripcions { get; set; }

    public virtual DbSet<Permiso> Permisos { get; set; }

    public virtual DbSet<Rol> Rols { get; set; }

    public virtual DbSet<RolPermiso> RolPermisos { get; set; }

    public virtual DbSet<Usuario> Usuarios { get; set; }

    public virtual DbSet<UsuarioRol> UsuarioRols { get; set; }

    public virtual DbSet<Valoracione> Valoraciones { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_0900_ai_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<CentroDeportivo>(entity =>
        {
            entity.HasKey(e => e.Rut).HasName("PRIMARY");

            entity.ToTable("centro_deportivo");

            entity.Property(e => e.Rut).HasColumnName("rut");
            entity.Property(e => e.Apertura)
                .HasColumnType("time")
                .HasColumnName("apertura");
            entity.Property(e => e.Capacidad).HasColumnName("capacidad");
            entity.Property(e => e.Cierre)
                .HasColumnType("time")
                .HasColumnName("cierre");
            entity.Property(e => e.Correo)
                .HasMaxLength(100)
                .HasColumnName("correo");
            entity.Property(e => e.Direccion)
                .HasMaxLength(150)
                .HasColumnName("direccion");
            entity.Property(e => e.Estado)
                .HasDefaultValueSql("'activo'")
                .HasColumnType("enum('activo','inactivo','mantenimiento')")
                .HasColumnName("estado");
            entity.Property(e => e.Nombre)
                .HasMaxLength(250)
                .HasColumnName("nombre");
            entity.Property(e => e.Telefono)
                .HasMaxLength(10)
                .HasColumnName("telefono");
        });

        modelBuilder.Entity<Inscripcion>(entity =>
        {
            entity.HasKey(e => e.Numero).HasName("PRIMARY");

            entity.ToTable("inscripcion");

            entity.HasIndex(e => e.IdUser, "id_user");

            entity.HasIndex(e => e.Rut, "rut");

            entity.Property(e => e.Numero).HasColumnName("numero");
            entity.Property(e => e.Correo)
                .HasMaxLength(100)
                .HasColumnName("correo");
            entity.Property(e => e.Estado)
                .HasDefaultValueSql("'postulante'")
                .HasColumnType("enum('proceso','realizado','postulante')")
                .HasColumnName("estado");
            entity.Property(e => e.Fhinscripcion).HasColumnName("fhinscripcion");
            entity.Property(e => e.IdUser).HasColumnName("id_user");
            entity.Property(e => e.Rut).HasColumnName("rut");
            entity.Property(e => e.Telefono)
                .HasMaxLength(10)
                .HasColumnName("telefono");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Inscripcions)
                .HasForeignKey(d => d.IdUser)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("inscripcion_ibfk_2");

            entity.HasOne(d => d.RutNavigation).WithMany(p => p.Inscripcions)
                .HasForeignKey(d => d.Rut)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("inscripcion_ibfk_1");
        });

        modelBuilder.Entity<Permiso>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("permiso");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Accion)
                .HasColumnType("enum('SELECT','CREATE','INSERT','UPDATE','DELETE')")
                .HasColumnName("accion");
            entity.Property(e => e.Tabla)
                .HasMaxLength(25)
                .HasColumnName("tabla");
        });

        modelBuilder.Entity<Rol>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("rol");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Contrasena)
                .HasMaxLength(255)
                .HasColumnName("contrasena");
            entity.Property(e => e.Nombre)
                .HasMaxLength(25)
                .HasColumnName("nombre");
        });

        modelBuilder.Entity<RolPermiso>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("rol_permiso");

            entity.HasIndex(e => e.IdPermiso, "fk_permiso_rol");

            entity.HasIndex(e => e.IdRol, "fk_rol_permiso");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IdPermiso).HasColumnName("id_permiso");
            entity.Property(e => e.IdRol).HasColumnName("id_rol");

            entity.HasOne(d => d.IdPermisoNavigation).WithMany(p => p.RolPermisos)
                .HasForeignKey(d => d.IdPermiso)
                .HasConstraintName("fk_permiso_rol");

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.RolPermisos)
                .HasForeignKey(d => d.IdRol)
                .HasConstraintName("fk_rol_permiso");
        });

        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.HasKey(e => e.IdUser).HasName("PRIMARY");

            entity.ToTable("usuario");

            entity.Property(e => e.IdUser).HasColumnName("id_user");
            entity.Property(e => e.Contrasena)
                .HasMaxLength(255)
                .HasColumnName("contrasena");
            entity.Property(e => e.Correo)
                .HasMaxLength(100)
                .HasColumnName("correo");
            entity.Property(e => e.Direccion)
                .HasMaxLength(150)
                .HasColumnName("direccion");
            entity.Property(e => e.Documento).HasColumnName("documento");
            entity.Property(e => e.Estado)
                .HasDefaultValueSql("'libre'")
                .HasColumnType("enum('activo','inactivo','libre')")
                .HasColumnName("estado");
            entity.Property(e => e.Nombre)
                .HasMaxLength(250)
                .HasColumnName("nombre");
            entity.Property(e => e.Telefono)
                .HasMaxLength(10)
                .HasColumnName("telefono");
        });

        modelBuilder.Entity<UsuarioRol>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("usuario_rol");

            entity.HasIndex(e => e.IdRol, "fk_rol_usuario");

            entity.HasIndex(e => e.IdUsuario, "fk_usuario_rol");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IdRol).HasColumnName("id_rol");
            entity.Property(e => e.IdUsuario).HasColumnName("id_usuario");

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.UsuarioRols)
                .HasForeignKey(d => d.IdRol)
                .HasConstraintName("fk_rol_usuario");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.UsuarioRols)
                .HasForeignKey(d => d.IdUsuario)
                .HasConstraintName("fk_usuario_rol");
        });

        modelBuilder.Entity<Valoracione>(entity =>
        {
            entity.HasKey(e => e.Codigo).HasName("PRIMARY");

            entity.ToTable("valoraciones");

            entity.HasIndex(e => e.Rut, "rut");

            entity.Property(e => e.Codigo).HasColumnName("codigo");
            entity.Property(e => e.Cometario)
                .HasColumnType("text")
                .HasColumnName("cometario");
            entity.Property(e => e.Fhvaloracion).HasColumnName("fhvaloracion");
            entity.Property(e => e.IdUser).HasColumnName("id_user");
            entity.Property(e => e.Rut).HasColumnName("rut");
            entity.Property(e => e.Valoracion)
                .HasPrecision(5, 1)
                .HasColumnName("valoracion");

            entity.HasOne(d => d.RutNavigation).WithMany(p => p.Valoraciones)
                .HasForeignKey(d => d.Rut)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("valoraciones_ibfk_1");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
