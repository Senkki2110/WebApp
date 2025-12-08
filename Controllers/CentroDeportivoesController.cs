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
  [ Authorize]
    public class CentroDeportivoesController : Controller
    {
        private readonly ProyectoContext _context;

        public CentroDeportivoesController(ProyectoContext context)
        {
            _context = context;
        }

        // GET: CentroDeportivoes
        public async Task<IActionResult> Index()
        {
            return View(await _context.CentroDeportivos.ToListAsync());
        }

        // GET: CentroDeportivoes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var centroDeportivo = await _context.CentroDeportivos
                .FirstOrDefaultAsync(m => m.Rut == id);
            if (centroDeportivo == null)
            {
                return NotFound();
            }

            return View(centroDeportivo);
        }

        // GET: CentroDeportivoes/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: CentroDeportivoes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Rut,Nombre,Direccion,Telefono,Correo,Apertura,Cierre,Capacidad,Estado")] CentroDeportivo centroDeportivo)
        {
            if (ModelState.IsValid)
            {
                _context.Add(centroDeportivo);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(centroDeportivo);
        }

        // GET: CentroDeportivoes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var centroDeportivo = await _context.CentroDeportivos.FindAsync(id);
            if (centroDeportivo == null)
            {
                return NotFound();
            }
            return View(centroDeportivo);
        }

        // POST: CentroDeportivoes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Rut,Nombre,Direccion,Telefono,Correo,Apertura,Cierre,Capacidad,Estado")] CentroDeportivo centroDeportivo)
        {
            if (id != centroDeportivo.Rut)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(centroDeportivo);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CentroDeportivoExists(centroDeportivo.Rut))
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
            return View(centroDeportivo);
        }

        // GET: CentroDeportivoes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var centroDeportivo = await _context.CentroDeportivos
                .FirstOrDefaultAsync(m => m.Rut == id);
            if (centroDeportivo == null)
            {
                return NotFound();
            }

            return View(centroDeportivo);
        }

        // POST: CentroDeportivoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var centroDeportivo = await _context.CentroDeportivos.FindAsync(id);
            if (centroDeportivo != null)
            {
                _context.CentroDeportivos.Remove(centroDeportivo);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CentroDeportivoExists(int id)
        {
            return _context.CentroDeportivos.Any(e => e.Rut == id);
        }
    }
}
