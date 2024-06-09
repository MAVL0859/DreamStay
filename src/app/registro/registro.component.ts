import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent {
  firstName: string = '';
  lastName: string = '';
  phone: string = '';
  email: string = '';
  password: string = '';

  constructor(private router: Router) {}

  register() {
    if (this.firstName && this.lastName && this.phone.match(/^[0-9]{10}$/) && this.email && this.password.length >= 6) {
      console.log('Datos del usuario:', {
        firstName: this.firstName,
        lastName: this.lastName,
        phone: this.phone,
        email: this.email,
        password: this.password
      });

      // Suponiendo un registro exitoso
      this.router.navigate(['/welcome']);
    } else {
      alert('Por favor, completa todos los campos correctamente.');
    }
  }
}
