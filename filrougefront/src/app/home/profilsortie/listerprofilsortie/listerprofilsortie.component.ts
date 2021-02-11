import { Component, OnInit } from '@angular/core';
import {AuthService} from '../../../auth.service';
import {any} from 'codelyzer/util/function';


@Component({
  selector: 'app-listerprofilsortie',
  templateUrl: './listerprofilsortie.component.html',
  styleUrls: ['./listerprofilsortie.component.css']
})
export class ListerprofilsortieComponent implements OnInit {

  displayedColumns: string[] = ['id', 'libelle' , 'action'];
  dataSource: any;





  ngOnInit(): void {
    this.authservice.getProfilsortie().subscribe(
      (response) => {
        this.dataSource = response
        console.log(this.dataSource);
      },
      (error) => {
        alert('probleme acces api dnness afiche sont fake');
        console.log(error);

      }
    )


  }
  delete(id:any){
    this.authservice.deleteprofilsortie(id).subscribe(
      (response:any)=>{
        alert("success")
      }
    )
}
  constructor(private authservice: AuthService){}





}
