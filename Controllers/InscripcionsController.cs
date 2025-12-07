using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApp.Model;

namespace WebApp.Controllers
{
    
    public class InscripcionsController : Controller
    {
    

        private readonly ProyectoContext _context;

        public InscripcionsController(ProyectoContext context)
        {
            _context = context;
        }

        // GET: Inscripcions
        public async Task<IActionResult> Index()
        {
            var proyectoContext = _context.Inscripcions.Include(i => i.IdUserNavigation).Include(i => i.RutNavigation);
            return View(await proyectoContext.ToListAsync());
        }

        // GET: Inscripcions/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var inscripcion = await _context.Inscripcions
                .Include(i => i.IdUserNavigation)
                .Include(i => i.RutNavigation)
                .FirstOrDefaultAsync(m => m.Numero == id);
            if (inscripcion == null)
            {
                return NotFound();
            }

            return View(inscripcion);
        }

        // GET: Inscripcions/Create
        public IActionResult Create()
        {
            ViewData["IdUser"] = new SelectList(_context.Usuarios, "IdUser", "IdUser");
            ViewData["Rut"] = new SelectList(_context.CentroDeportivos, "Rut", "Rut");
            return View();
        }

        // POST: Inscripcions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Numero,Fhinscripcion,Telefono,Correo,Estado,Rut,IdUser")] Inscripcion inscripcion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(inscripcion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdUser"] = new SelectList(_context.Usuarios, "IdUser", "IdUser", inscripcion.IdUser);
            ViewData["Rut"] = new SelectList(_context.CentroDeportivos, "Rut", "Rut", inscripcion.Rut);
            return View(inscripcion);
        }

        // GET: Inscripcions/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var inscripcion = await _context.Inscripcions.FindAsync(id);
            if (inscripcion == null)
            {
                return NotFound();
            }
            ViewData["IdUser"] = new SelectList(_context.Usuarios, "IdUser", "IdUser", inscripcion.IdUser);
            ViewData["Rut"] = new SelectList(_context.CentroDeportivos, "Rut", "Rut", inscripcion.Rut);
            return View(inscripcion);
        }

        // POST: Inscripcions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Numero,Fhinscripcion,Telefono,Correo,Estado,Rut,IdUser")] Inscripcion inscripcion)
        {
            if (id != inscripcion.Numero)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(inscripcion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!InscripcionExists(inscripcion.Numero))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdUser"] = new SelectList(_context.Usuarios, "IdUser", "IdUser", inscripcion.IdUser);
            ViewData["Rut"] = new SelectList(_context.CentroDeportivos, "Rut", "Rut", inscripcion.Rut);
            return View(inscripcion);
        }

        // GET: Inscripcions/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var inscripcion = await _context.Inscripcions
                .Include(i => i.IdUserNavigation)
                .Include(i => i.RutNavigation)
                .FirstOrDefaultAsync(m => m.Numero == id);
            if (inscripcion == null)
            {
                return NotFound();
            }

            return View(inscripcion);
        }

        // POST: Inscripcions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var inscripcion = await _context.Inscripcions.FindAsync(id);
            if (inscripcion != null)
            {
                _context.Inscripcions.Remove(inscripcion);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool InscripcionExists(int id)
        {
            return _context.Inscripcions.Any(e => e.Numero == id);
        }
    }
}
