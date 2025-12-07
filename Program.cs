using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using WebApp.Data;
using WebApp.Model;

var builder = WebApplication.CreateBuilder(args);

// 1. MVC
builder.Services.AddControllersWithViews();

// 2. Cadena de conexi�n
var conString = builder.Configuration.GetConnectionString("conexion") ??
     throw new InvalidOperationException("Connection string 'conexion' not found.");


// 3. DbContext principal que ya ten�as
builder.Services.AddDbContext<ProyectoContext>(options =>
    options.UseMySql(conString, ServerVersion.Parse("10.4.32-mariadb")));


// 4. DbContext de Identity (NUEVO)
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseMySql(conString, ServerVersion.AutoDetect(conString)));


// 5. Identity (NUEVO)
builder.Services
    .AddDefaultIdentity<ApplicationUser>(options =>
    {
        options.SignIn.RequireConfirmedAccount = false;

        options.Password.RequireDigit = false;
        options.Password.RequireLowercase = false;
        options.Password.RequireUppercase = false;
        options.Password.RequireNonAlphanumeric = false;
        options.Password.RequiredLength = 6;
    })
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>();


// 6. Construcci�n de la app
var app = builder.Build();


// 7. Pipeline HTTP
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

// ?? IMPORTANTE � activar autenticaci�n y autorizaci�n
app.UseAuthentication();
app.UseAuthorization();


// 8. Rutas
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

// 9. Identity UI (si usas areas)
app.MapRazorPages();

app.Run();
