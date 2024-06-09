import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-formulario-reservas',
  templateUrl: './formulario-reserva.component.html',
  styleUrls: ['./formulario-reserva.component.css']
})
export class FormularioReservaComponent {
  nombre: string = '';
  fechaEntrada: Date = new Date();
  fechaSalida: Date = new Date();
  tipoHabitacion: string = '';
  tiposHabitacion: string[] = ['Individual', 'Doble', 'Suite'];
  ciudadesDisponibles: string[] = ['Quito', 'Guayaquil', 'Cuenca', 'Manta'];
  ciudadSeleccionada: string = '';
  hotelSeleccionado: any; // Variable para almacenar el hotel seleccionado

  constructor(private router: Router) {
    // Obtener la información del hotel seleccionado de localStorage
    this.hotelSeleccionado = JSON.parse(localStorage.getItem('hotelSeleccionado') || '{}');
  }

  guardarReserva() {
    const reservas = JSON.parse(localStorage.getItem('reservas') || '[]');
    reservas.push({
      nombre: this.nombre,
      fechaEntrada: this.fechaEntrada,
      fechaSalida: this.fechaSalida,
      tipoHabitacion: this.tipoHabitacion,
      ciudadSeleccionada: this.ciudadSeleccionada,
      hotel: this.hotelSeleccionado // Incluimos la información del hotel en la reserva
    });
    localStorage.setItem('reservas', JSON.stringify(reservas));
    this.router.navigate(['/listado-reservas']);
  }
}
