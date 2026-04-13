import { Routes } from '@angular/router';
import { HomeComponent } from './Navbar/home/home.component';
import { AboutComponent } from './Navbar/about/about.component';
import { ContactComponent } from './Navbar/contact/contact.component';
import { AdminComponent } from './Navbar/admin/admin.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';

export const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'about', component: AboutComponent },
  { path: 'contact', component: ContactComponent },
  { path: 'admin', component: AdminComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
];
