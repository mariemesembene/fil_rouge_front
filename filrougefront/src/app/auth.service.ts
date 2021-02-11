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
    return this.http.post<any>(environment.url+'admin/users', user);
  }
  registerReferentiel(referentiel: any){
    return this.http.post<any>(environment.url+'admin/referentiels',referentiel);
  }
  registerProflSortie(profilsortie: any){
    return this.http.post<any>(environment.url+'admin/profilsorties', profilsortie);
  }
  loggedIn(){
    return !!localStorage.getItem('token')
  }
  getToken(){
    return localStorage.getItem('token')
  }

  getUser(): Observable<any>{
    return this.http.get<any>(environment.url+'admin/users?statut=true')
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
    return this.http.get<any>("http://127.0.0.1:8000/api/admin/profilsorties?statut=false")
  }
  deleteprofilsortie(id:any){
    return this.http.delete(environment.url+'admin/profilsortie/'+id)
  }
  deleteprofil(id:any){
    return this.http.delete(environment.url+'admin/profils/'+id)
  }
  deleteuser(id:any){
    return this.http.delete(environment.url+'admin/users/'+id)
  }
  logout(){
    localStorage.removeItem("token");
  }
  updateprofilsortie(data:any){
    return this.http.put(environment.url+'admin/profilsortie/'+data.id,data)
  }
  getprofilsortieById(id:number,data:any):any
  {
    const profilsortie = data.find(
      (p:any) => {
        return p.id===id;
      }
    );
    return profilsortie;
  }

}
