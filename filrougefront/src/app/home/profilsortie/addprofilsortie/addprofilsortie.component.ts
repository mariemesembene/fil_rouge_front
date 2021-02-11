import { Component, OnInit } from '@angular/core';
import {AuthService} from '../../../auth.service';

@Component({
  selector: 'app-addprofilsortie',
  templateUrl: './addprofilsortie.component.html',
  styleUrls: ['./addprofilsortie.component.css']
})
export class AddprofilsortieComponent implements OnInit {

  constructor(private service: AuthService) {
  }

  ngOnInit(): void {
  }

  Postuler(data: any) {
    data.statut=false;
console.log(data)
    this.service.registerProflSortie(data).subscribe(
      (response) =>
      {
        console.log (response);
       alert(
        "profil enregistre  "
       )
      },
      (error) =>
      {
        console.log(error);
      }
    );
  }
}
