import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-students',
  standalone: true,
  imports: [FormsModule, CommonModule],

  templateUrl: './students.component.html',
  styleUrl: './students.component.scss',
})
export class StudentsComponent {
  flag = false;

  showText() {
    this.flag = !this.flag;
  }

  users = ['Shakti', 'Abhay', 'NONE'];
}
