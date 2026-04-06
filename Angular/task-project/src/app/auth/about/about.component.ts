import { Component, inject } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-about',
  templateUrl: './about.component.html',
  styleUrl: './about.component.scss',
})
export class AboutComponent {
  goToContact = 'contact';
  router = inject(Router);

  navigateToContact() {
    this.router.navigate(['/contact']);
  }
}
