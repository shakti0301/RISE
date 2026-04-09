import { Component } from '@angular/core';
import {
  AbstractControl,
  FormBuilder,
  FormControl,
  FormGroup,
  PatternValidator,
  ReactiveFormsModule,
  ValidationErrors,
  Validators,
} from '@angular/forms';
import { __values } from 'tslib';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [ReactiveFormsModule],
  templateUrl: './register.component.html',
  styleUrl: './register.component.scss',
})
export class RegisterComponent {
  registerForm: FormGroup;

  constructor(private fb: FormBuilder) {
    this.registerForm = this.fb.group(
      {
        email: [
          '',
          [
            Validators.required,
            Validators.pattern(/^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$/),
          ],
        ],
        password: [
          '',
          [
            Validators.required,
            Validators.maxLength(10),
            Validators.minLength(6),
          ],
        ],
        confirmPassword: ['', Validators.required],
        phone: ['', [Validators.required, Validators.pattern(/^[0-9]{10}$/)]],
      },
      { validators: this.passwordMatchValidators },
    );
  }

  onSubmit() {
    console.log(this.registerForm.value);
  }

  passwordMatchValidators(form: AbstractControl): ValidationErrors | null {
    const password = form.get('password')?.value;
    const confirmPassword = form.get('confirmPassword')?.value;

    return password === confirmPassword ? null : { mismatch: true };
  }
}
