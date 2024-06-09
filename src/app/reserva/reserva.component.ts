import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-reserva',
  templateUrl: './reserva.component.html',
  styleUrls: ['./reserva.component.css']
})
export class ReservaComponent {
  constructor(private router: Router) {}
  redirectToFormularioReserva() {
    this.router.navigate(['/formulario-reserva']);
  }
}

