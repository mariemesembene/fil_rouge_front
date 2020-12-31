import { Component, OnInit } from '@angular/core';

import { AuthService } from '../auth.service';
import {Router} from '@angular/router';




@Component({
  selector: 'app-connexion',
  templateUrl: './connexion.component.html',
  styleUrls: ['./connexion.component.css']
})
export class ConnexionComponent implements OnInit {
  constructor(private auth: AuthService, private router: Router){}

  registerUserData = {
    email: '',
    password: ''
  };
  ngOnInit(): void {
  }

  // tslint:disable-next-line:typedef
  registerUser() {
    this.auth.connexionUser(this.registerUserData)
      .subscribe(
        res => {
          console.log(res);
          localStorage.setItem('token', res.token);
        },

        log => console.log(log)
      );
  }
}
