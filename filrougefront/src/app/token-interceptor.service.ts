import { Injectable , Injector} from '@angular/core';
import { AuthService } from './auth.service';
import { Observable } from 'rxjs';
import {HttpEvent, HttpHandler, HttpHeaders, HttpInterceptor, HttpRequest} from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class TokenInterceptorService  implements HttpInterceptor{

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>>
  {
    const token = localStorage.getItem('token');
    if (token)
    {
      // Clone chaque requete interceptée et lui ajoute le token
      const CloneReq = req.clone(
        {
          headers: new HttpHeaders().set('Authorization', 'Bearer ' + token)
        });
      return next.handle(CloneReq);
    }

    return next.handle(req);

  }
}

