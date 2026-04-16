import { Component, OnInit } from '@angular/core';
import { UserService } from '../../../services/user.service';
import { FormsModule } from '@angular/forms';
import { CommonModule, JsonPipe } from '@angular/common';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.scss',
  imports: [FormsModule, CommonModule, JsonPipe],
})
export class DashboardComponent implements OnInit {
  userData: any;
  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.userService.getUser().subscribe({
      next: (res: any) => {
        this.userData = res;
      },
      error: (err) => {
        console.error('Error fetching user data:', err);
      },
      complete: () => {
        console.log('User data fetch complete');
      },
    });
  }
  createUser() {
    const newUser = {
      name: 'Shakti Raolji',
      email: 'shakti.raolji@example.com',
    };
    this.userService.createUser(newUser).subscribe({
      next: (res) => {
        this.userData.push(res);
      },
      error: (err) => {
        console.error('Error creating user:', err);
      },
      complete: () => {
        console.log('New User Created Successfully');
      },
    });
  }
}
