import { FormularioReservaComponent } from './formulario-reserva/formulario-reserva.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { ReservaComponent } from './reserva/reserva.component';
import { ListadoReservasComponent } from './listado-reservas/listado-reservas.component';
import { RegistroComponent} from './registro/registro.component';

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'reserva', component: ReservaComponent },
  { path: 'listado-reservas', component: ListadoReservasComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'formulario-reserva', component: FormularioReservaComponent},
  { path: '', redirectTo: '/login', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
