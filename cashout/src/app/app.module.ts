import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
<<<<<<< HEAD
import { HttpClientModule } from '@angular/common/http';
=======
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
>>>>>>> ccf0cc5743c75b9d78a5c3c7bcb84373eeb2fbf2

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ProductsComponent } from './products/products.component';
import { CheckoutComponent } from './checkout/checkout.component';

@NgModule({
  declarations: [
    AppComponent,
    ProductsComponent,
    CheckoutComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
<<<<<<< HEAD
    HttpClientModule
=======
    NgbModule
>>>>>>> ccf0cc5743c75b9d78a5c3c7bcb84373eeb2fbf2
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
