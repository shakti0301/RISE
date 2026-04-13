import { Component } from '@angular/core';

@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrl: './nav.component.scss',
})
export class NavComponent {
  homePath = 'home';
  aboutPath = 'about';
  contactPath = 'contact';
  adminPath = 'admin';
  loginPath = 'login';
  registerPath = 'register';
}
