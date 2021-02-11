import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {AuthService} from '../../../auth.service';

@Component({
  selector: 'app-putprofilsortie',
  templateUrl: './putprofilsortie.component.html',
  styleUrls: ['./putprofilsortie.component.css']
})
export class PutprofilsortieComponent implements OnInit {
data:any;
profilsortie:any;
  constructor( private route: ActivatedRoute, private service:AuthService) { }
  ngOnInit(): void {
    this.service.getProfilsortie().subscribe(
      (response:any) => {
        this.data = response
        let id=Number(this.route.snapshot.paramMap.get('id'));
        this.profilsortie=this.service.getprofilsortieById(id,this.data)

      },
      (error) => {
        alert('probleme acces api dnness afiche sont fake');
        console.log(error);

      }
    )


  }

}
