import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MyButtonTestComponent } from './my-button-test/my-button-test.component';
import { MyDropdownTestComponent } from './my-dropdown-test/my-dropdown-test.component';
import { MatButtonModule, MatSelectModule } from '@angular/material';
import { Form } from '@angular/forms';
import { CountryDropdownComponent } from './country-dropdown/country-dropdown.component';
import { TelInputComponent } from './tel-input/tel-input.component';

@NgModule({
  declarations: [
    AppComponent,
    MyButtonTestComponent,
    MyDropdownTestComponent,
    CountryDropdownComponent,
    TelInputComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatButtonModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
