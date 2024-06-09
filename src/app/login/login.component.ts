import { Component } from '@angular/core';
//buscar para que sirve esto
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
//buscar para que sirve esto
export class LoginComponent {
  usuario: string = '';
  contrasena: string = '';

  constructor(private router: Router) {}

  iniciarSesion() {
    if (this.usuario === 'admin' && this.contrasena === 'admin') {
      this.router.navigate(['/listado-reservas']);
    } else {
      alert('Usuario o contraseña incorrectos');
    }
  }
}


