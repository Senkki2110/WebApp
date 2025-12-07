using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApp.Model;

namespace WebApp.Controllers
{
    public class ValoracionesController : Controller
    {
        private readonly ProyectoContext _context;

        public ValoracionesController(ProyectoContext context)
        {
            _context = context;
        }

        // GET: Valoraciones
        public async Task<IActionResult> Index()
        {
            var proyectoContext = _context.Valoraciones.Include(v => v.RutNavigation);
            return View(await proyectoContext.ToListAsync());
        }

        // GET: Valoraciones/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var valoracione = await _context.Valoraciones
                .Include(v => v.RutNavigation)
                .FirstOrDefaultAsync(m => m.Codigo == id);
            if (valoracione == null)
            {
                return NotFound();
            }

            return View(valoracione);
        }

        // GET: Valoraciones/Create
        public IActionResult Create()
        {
            ViewData["Rut"] = new SelectList(_context.CentroDeportivos, "Rut", "Rut");
            return View();
        }

        // POST: Valoraciones/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Codigo,Valoracion,Fhvaloracion,Cometario,Rut,IdUser")] Valoracione valoracione)
        {
            if (ModelState.IsValid)
            {
                _context.Add(valoracione);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Rut"] = new SelectList(_context.CentroDeportivos, "Rut", "Rut", valoracione.Rut);
            return View(valoracione);
        }

        // GET: Valoraciones/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var valoracione = await _context.Valoraciones.FindAsync(id);
            if (valoracione == null)
            {
                return NotFound();
            }
            ViewData["Rut"] = new SelectList(_context.CentroDeportivos, "Rut", "Rut", valoracione.Rut);
            return View(valoracione);
        }

        // POST: Valoraciones/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Codigo,Valoracion,Fhvaloracion,Cometario,Rut,IdUser")] Valoracione valoracione)
        {
            if (id != valoracione.Codigo)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(valoracione);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ValoracioneExists(valoracione.Codigo))
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
            ViewData["Rut"] = new SelectList(_context.CentroDeportivos, "Rut", "Rut", valoracione.Rut);
            return View(valoracione);
        }

        // GET: Valoraciones/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var valoracione = await _context.Valoraciones
                .Include(v => v.RutNavigation)
                .FirstOrDefaultAsync(m => m.Codigo == id);
            if (valoracione == null)
            {
                return NotFound();
            }

            return View(valoracione);
        }

        // POST: Valoraciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var valoracione = await _context.Valoraciones.FindAsync(id);
            if (valoracione != null)
            {
                _context.Valoraciones.Remove(valoracione);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ValoracioneExists(int id)
        {
            return _context.Valoraciones.Any(e => e.Codigo == id);
        }
    }
}
