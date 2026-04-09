import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, CommonModule],

  templateUrl: './login.component.html',
  styleUrl: './login.component.scss',
})
export class LoginComponent {
  email: string = '';
  password: any = '';
  isDisabled: boolean = false;

  loginClick() {
    console.log('Email : ', this.email);
    console.log('Password : ', this.password);

    this.isDisabled = true;
  }
}
