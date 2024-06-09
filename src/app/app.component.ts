import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'proyecto';
  constructor(private router: Router) {}

  // Función para navegar al Login
  irALogin() {
    this.router.navigate(['/login']);
  }

  // Función para navegar a la página de Nueva Reserva
  irAReserva() {
    this.router.navigate(['/reserva']);
  }

  // Función para navegar al Listado de Reservas
  irAListadoReservas() {
    this.router.navigate(['/listado-reservas']);
  }

  // Función para navegar al Detalles de Reservas
  irARegistro() {
    this.router.navigate(['/registro']);
  }

  // Función para navegar al Formulario de Reserva
  irAFormularioReserva() {
    this.router.navigate(['/formulario-reserva']);
  }
}

