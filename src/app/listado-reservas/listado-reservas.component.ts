import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-listado-reservas',
  templateUrl: './listado-reservas.component.html',
  styleUrls: ['./listado-reservas.component.css']
})
export class ListadoReservasComponent implements OnInit {
  reservas: any[] = [];

  constructor(private router: Router) {}

  ngOnInit(): void {
    this.cargarReservas();
  }

  cargarReservas() {
    const storedData = localStorage.getItem('reservas');
    if (storedData) {
      this.reservas = JSON.parse(storedData);
    }
  }
  editarReserva(index: number) {
    this.router.navigate(['/detalles-reserva', index]);
  }

  eliminarReserva(index: number) {
    this.reservas.splice(index, 1);
    localStorage.setItem('reservas', JSON.stringify(this.reservas));
  }

  hayReservas(): boolean {
    return this.reservas.length > 0;
  }
}
