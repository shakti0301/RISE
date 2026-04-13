import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from './dashboard/dashboard.component';
import { SettingComponent } from './setting/setting.component';

@Component({
  selector: 'app-admin',
  standalone: true,
  imports: [CommonModule, DashboardComponent, SettingComponent],
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.scss',
})
export class AdminComponent {
  currentTab: string = 'dashboard';

  changeTab(tabName: string) {
    this.currentTab = tabName;
  }
}
