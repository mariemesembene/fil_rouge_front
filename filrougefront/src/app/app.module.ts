import { BrowserModule } from '@angular/platform-browser';
import {CUSTOM_ELEMENTS_SCHEMA, NgModule, OnInit} from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {MatSliderModule} from '@angular/material/slider';
import {AngularMaterialModule} from '../appmateriel.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HeaderComponent } from './header/header.component';
import { ConnexionComponent } from './connexion/connexion.component';
import { HomeComponent } from './home/home.component';
import { UsersComponent } from './home/users/users.component';
import { AddUserComponent } from './home/users/add-user/add-user.component';
import { ProfilsComponent } from './home/profils/profils.component';
import { ListerProfilsComponent } from './home/profils/lister-profils/lister-profils.component';
import { ReferentielsComponent } from './home/referentiels/referentiels.component';
import { GroupescompetencesComponent } from './home/groupescompetences/groupescompetences.component';
import { AddreferentielsComponent } from './home/referentiels/addreferentiels/addreferentiels.component';
import { CompetencesComponent } from './home/competences/competences.component';
import { ListercompetencesComponent } from './home/competences/listercompetences/listercompetences.component';
import { PromosComponent } from './home/promos/promos.component';
import { ListerpromosComponent } from './home/promos/listerpromos/listerpromos.component';
import {FormsModule, NgModel, ReactiveFormsModule} from '@angular/forms';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import {MatDialogModule} from '@angular/material/dialog';
import {MatMenuModule} from '@angular/material/menu';
import {AuthService} from './auth.service';
import {EventService} from './event.service';
import {AuthGuard} from './authguard.service';
import {TokenInterceptorService} from './token-interceptor.service';
import { ListerUsersComponent } from './home/users/lister-users/lister-users.component';
import { ProfilsortieComponent } from './home/profilsortie/profilsortie.component';
import { ListerprofilsortieComponent } from './home/profilsortie/listerprofilsortie/listerprofilsortie.component';
import { AddprofilsortieComponent } from './home/profilsortie/addprofilsortie/addprofilsortie.component';
import { AddPromoComponent } from './home/promos/add-promo/add-promo.component';
import { AddgroupecompetenceComponent } from './home/groupescompetences/addgroupecompetence/addgroupecompetence.component';
import { ListegroupecompetenceComponent } from './home/groupescompetences/listegroupecompetence/listegroupecompetence.component';
import { AddcompetencesComponent } from './home/competences/addcompetences/addcompetences.component';
import { ListerreferentielsComponent } from './home/referentiels/listerreferentiels/listerreferentiels.component';
import {MatChipsModule} from '@angular/material/chips';
import {MatStepperModule} from '@angular/material/stepper';


@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    ConnexionComponent,
    HomeComponent,
    UsersComponent,
    AddUserComponent,
    ProfilsComponent,
    ListerProfilsComponent,
    ReferentielsComponent,
    GroupescompetencesComponent,
    AddreferentielsComponent,
    CompetencesComponent,
    ListercompetencesComponent,
    PromosComponent,
    ListerpromosComponent,
    ListerUsersComponent,
    ProfilsortieComponent,
    ListerprofilsortieComponent,
    AddprofilsortieComponent,
    AddPromoComponent,
    AddgroupecompetenceComponent,
    ListegroupecompetenceComponent,
    AddcompetencesComponent,
    ListerreferentielsComponent,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MatSliderModule,
    AngularMaterialModule,
    BrowserAnimationsModule,
    FormsModule,
    HttpClientModule,
    MatDialogModule,
    MatMenuModule,
    ReactiveFormsModule,
    MatChipsModule,
    MatStepperModule



  ],
  providers: [AuthService, EventService, AuthGuard, TokenInterceptorService , {
    provide: HTTP_INTERCEPTORS,
    useClass: TokenInterceptorService,
    multi: true
  }],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
