import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AuthRoutingModule } from './auth-routing.module';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { AdminComponent } from './admin/admin.component';
import { ContactComponent } from './contact/contact.component';
import { DashboardComponent } from './admin/dashboard/dashboard.component';
import { SettingComponent } from './admin/setting/setting.component';


@NgModule({
  declarations: [
    HomeComponent,
    AboutComponent,
    AdminComponent,
    ContactComponent,
    DashboardComponent,
    SettingComponent
  ],
  imports: [
    CommonModule,
    AuthRoutingModule
  ]
})
export class AuthModule { }
