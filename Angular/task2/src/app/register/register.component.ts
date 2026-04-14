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
import { ContactComponent } from '../Navbar/contact/contact.component';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [ReactiveFormsModule, ContactComponent],
  templateUrl: './register.component.html',
  styleUrl: './register.component.scss',
})
export class RegisterComponent {
  name: string = 'Shakti';
  contact: number = 990002939;
  city: string = 'anc';
  company: string = 'Ris';
  email: string = 'sjdfjsd@gamial.com';

  Obj1 = {
    name: 'shakti',
    age: 22,
  };

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

  gotMsg(msg: any) {
    alert(msg);
  }
}
