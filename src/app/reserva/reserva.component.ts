import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-reserva',
  templateUrl: './reserva.component.html',
  styleUrls: ['./reserva.component.css']
})
export class ReservaComponent {
  hotelSeleccionado: any; // Variable para almacenar el hotel seleccionado

  constructor(private router: Router) {}

  // Función para guardar la reserva y pasar la información al formulario
  guardarReserva(hotel: any) {
    this.hotelSeleccionado = hotel;
    // Aquí puedes agregar cualquier lógica adicional que necesites para la reserva
    // Por ejemplo, redireccionar a otra página después de guardar la reserva
    this.router.navigate(['/formulario-reserva']);
  }
}
