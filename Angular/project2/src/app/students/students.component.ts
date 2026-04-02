import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-students',
  standalone: true,
  imports: [CommonModule, RouterOutlet, FormsModule],
  templateUrl: './students.component.html',
  styleUrl: './students.component.scss',
})
export class StudentsComponent {
  title = 'project2';

  showText = false;
  off = true;

  showSome() {
    this.showText = !this.showText;
    this.off = !this.off;
  }
  title2 = 'Hello World';
}
