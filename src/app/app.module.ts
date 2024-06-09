import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms'; // Importación necesaria para ngModel

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { RegistroComponent } from './registro/registro.component';
import { LoginComponent } from './login/login.component';
import { ReservaComponent } from './reserva/reserva.component';
import { ListadoReservasComponent } from './listado-reservas/listado-reservas.component';
import { FormularioReservaComponent } from './formulario-reserva/formulario-reserva.component';

@NgModule({
  declarations: [
    AppComponent,
    RegistroComponent,
    LoginComponent,
    ReservaComponent,
    ListadoReservasComponent,
    FormularioReservaComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule // Importar FormsModule aquí
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
