import { Component } from '@angular/core';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.scss',
})
export class AdminComponent {
  currentTab: string = 'dashboard';

  changeTab(tabName: string) {
    this.currentTab = tabName;
  }
}
