import { Component, OnInit } from '@angular/core';
import {AuthService} from '../../../auth.service';

@Component({
  selector: 'app-lister-profils',
  templateUrl: './lister-profils.component.html',
  styleUrls: ['./lister-profils.component.css']
})
export class ListerProfilsComponent implements OnInit {



  displayedColumns: string[] = ['id', 'libelle' , 'action'];
  dataSource: any;





  ngOnInit(): void {
    this.authservice.getProfil().subscribe(
      (Response) => {

        this.dataSource = Response["hydra:member"]
        console.log(this.dataSource);
      },
      (error) => {
        alert('probleme acces api dnness afiche sont fake');
        console.log(error);

      }
    )

  }
  constructor(private authservice: AuthService){}


}
