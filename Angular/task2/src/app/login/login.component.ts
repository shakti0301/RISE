import { CommonModule } from '@angular/common';
import { Component, ViewChild } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, CommonModule],

  templateUrl: './login.component.html',
  styleUrl: './login.component.scss',
})
export class LoginComponent {
  @ViewChild('loginform') loginForm!: NgForm;

  email: string = '';
  password: string = '';
  isDisabled: boolean = false;

  constructor(private router: Router) {}

  // Email validation pattern
  emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

  isEmailValid(): boolean {
    return this.emailPattern.test(this.email);
  }

  isPasswordValid(): boolean {
    return this.password.length >= 8;
  }

  isFormValid(): boolean {
    return this.isEmailValid() && this.isPasswordValid();
  }

  loginClick() {
    if (!this.isFormValid()) {
      alert('Please fix the validation errors');
      return;
    }

    console.log('Email : ', this.email);
    console.log('Password : ', this.password);

    this.isDisabled = true;

    this.router.navigate(['/admin']);
  }
}
