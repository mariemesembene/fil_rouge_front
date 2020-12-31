import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {ConnexionComponent} from './connexion/connexion.component';
import {HomeComponent} from './home/home.component';
import {UsersComponent} from './home/users/users.component';
import {ProfilsComponent} from './home/profils/profils.component';
import {ListerProfilsComponent} from './home/profils/lister-profils/lister-profils.component';
import {AddUserComponent} from './home/users/add-user/add-user.component';
import {ReferentielsComponent} from './home/referentiels/referentiels.component';
import {GroupescompetencesComponent} from './home/groupescompetences/groupescompetences.component';
import {AddreferentielsComponent} from './home/referentiels/addreferentiels/addreferentiels.component';
import {CompetencesComponent} from './home/competences/competences.component';
import {ListercompetencesComponent} from './home/competences/listercompetences/listercompetences.component';
import {PromosComponent} from './home/promos/promos.component';
import {ListerpromosComponent} from './home/promos/listerpromos/listerpromos.component';
import {ListerUsersComponent} from './home/users/lister-users/lister-users.component';
import {ProfilsortieComponent} from './home/profilsortie/profilsortie.component';
import {ListerprofilsortieComponent} from './home/profilsortie/listerprofilsortie/listerprofilsortie.component';
import {AddprofilsortieComponent} from './home/profilsortie/addprofilsortie/addprofilsortie.component';
import {AddPromoComponent} from './home/promos/add-promo/add-promo.component';
import {AddgroupecompetenceComponent} from './home/groupescompetences/addgroupecompetence/addgroupecompetence.component';
import {AddcompetencesComponent} from './home/competences/addcompetences/addcompetences.component';
import {ListerreferentielsComponent} from './home/referentiels/listerreferentiels/listerreferentiels.component';

let routes: Routes;
routes = [
  {
    path: '',
    redirectTo: '/connexion',
    pathMatch: 'full'
  },
  {
    path: 'connexion',
    component: ConnexionComponent
  },
  {
    path: 'home',
    component: HomeComponent,
    children: [
      {
        path: 'profilsortie',
        component: ProfilsortieComponent,
        children: [
          {
            path: 'listerprofilsortie',
            component: ListerprofilsortieComponent

          },
          {
            path: 'addProfilsortie',
            component: AddprofilsortieComponent
          }
        ]
      },
      {
        path: 'user',
        component: UsersComponent,
        children: [
          {
            path: 'addUser',
            component: AddUserComponent}
          ,
          {
            path: 'listerUser',
            component: ListerUsersComponent}
          ,

        ]
      },
      {
        path: 'profil',
        component: ProfilsComponent,
        children: [
          {
            path: 'listeProfil',
            component: ListerProfilsComponent,
          }
        ]
      },
      {
        path: 'referentiels',
        component: ReferentielsComponent,
        children: [
          {
            path: 'addreferentiels',
            component: AddreferentielsComponent
          },
          {
            path: 'listerreferentiels',
            component: ListerreferentielsComponent
          }
        ]
      },
      {
        path: 'groupescompetences',
        component: GroupescompetencesComponent,
        children: [
          {
            path: 'addgroupecompetence',
            component: AddgroupecompetenceComponent

          },
          {
            path: 'listegroupecompetence',
            component: AddgroupecompetenceComponent

          },
        ]
      },
      {
        path: 'competences',
        component: CompetencesComponent
      },
      {
        path: 'listecompetences',
        component: ListercompetencesComponent
      },
      {
        path: 'addcompetences',
        component: AddcompetencesComponent
      },
      {
        path: 'promos',
        component: PromosComponent,
        children: [
          {
            path: 'listerpromos',
            component: ListerpromosComponent

          },
          {
            path: 'addPromo',
            component: AddPromoComponent

          }
          ]

      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }
