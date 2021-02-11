import { Injectable } from '@angular/core';
import {CanActivate, Router, RouterState, RouterStateSnapshot} from '@angular/router';
import{ AuthService } from './auth.service';
@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private auth: AuthService, private router: Router,state:RouterStateSnapshot){}
  canActivate(): boolean{
    if (this.auth.loggedIn()){
      return true;
    }
    else{
      this.router.navigate(['login'] )
      return false;
    }
    const token=localStorage.getItem('token');
    return (!!token)
  }

}
