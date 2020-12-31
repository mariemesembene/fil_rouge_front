import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { Observable } from 'rxjs';
import {environment} from '../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }
  connexionUser(user: any){
    return this.http.post<any>(environment.url+'login', user);
  }
  registerUser(user: any){
    return this.http.post<any>('http://127.0.0.1:8000/api/admin/users', user);
  }
  loggedIn(){
    return !!localStorage.getItem('token')
  }
  getToken(){
    return localStorage.getItem('token')
  }

  getUser(): Observable<any>{
    return this.http.get<any>(environment.url+'admin/users')
  }
  /*getUserbyId(id:number):User
   {
     const user=this.users.find(predicate:user=>{
       return user.id == id;
     });
     return user;

  }*/
  getProfil(): Observable<any>{
    return this.http.get<any>(environment.url+'admin/profils')
  }
  getProfilsortie(): Observable<any>{
    return this.http.get<any>("http://127.0.0.1:8000/api/admin/profilsorties")
  }
}
