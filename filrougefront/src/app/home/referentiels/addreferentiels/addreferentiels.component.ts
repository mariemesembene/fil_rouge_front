import { Component, OnInit } from '@angular/core';
import {AuthService} from '../../../auth.service';

@Component({
  selector: 'app-addreferentiels',
  templateUrl: './addreferentiels.component.html',
  styleUrls: ['./addreferentiels.component.css']
})
export class AddreferentielsComponent implements OnInit {
  constructor(private service: AuthService){}

  ngOnInit(): void {
  }
  Postuler(data:any){
    console.log(data);
    const formdata=new FormData();
    formdata.append("libelle",data.libelle);
    formdata.append("presentation",data.presentation);
    formdata.append("grpecompetences",data.grpecompetences);
    formdata.append("CritereEvaluation",data.CritereEvaluation);
    formdata.append("CritereAdmission",data.CritereAdmission);
    formdata.append("avatar",this.avatar,this.avatar.name);
    this.service.registerReferentiel(formdata).subscribe(
      (response) =>
      {
        console.log (response);
      },
      (error) =>
      {
        console.log(error);
      }
    );

  }




}
