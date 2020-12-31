import { Component, OnInit } from '@angular/core';
import {AuthService} from '../../../auth.service';
import {any} from 'codelyzer/util/function';
export interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
}
const ELEMENT_DATA: PeriodicElement[] = [
  {position: 1, name: 'Hydrogen', weight: 1.0079, symbol: 'H'},
  {position: 2, name: 'Helium', weight: 4.0026, symbol: 'He'},
  {position: 3, name: 'Lithium', weight: 6.941, symbol: 'Li'},
  {position: 4, name: 'Beryllium', weight: 9.0122, symbol: 'Be'},
  {position: 5, name: 'Boron', weight: 10.811, symbol: 'B'},
  {position: 6, name: 'Carbon', weight: 12.0107, symbol: 'C'},
  {position: 7, name: 'Nitrogen', weight: 14.0067, symbol: 'N'},
  {position: 8, name: 'Oxygen', weight: 15.9994, symbol: 'O'},
  {position: 9, name: 'Fluorine', weight: 18.9984, symbol: 'F'},
  {position: 10, name: 'Neon', weight: 20.1797, symbol: 'Ne'},
];

@Component({
  selector: 'app-listerprofilsortie',
  templateUrl: './listerprofilsortie.component.html',
  styleUrls: ['./listerprofilsortie.component.css']
})
export class ListerprofilsortieComponent implements OnInit {

  displayedColumns: string[] = ['id', 'libelle' , 'action'];
  dataSource = [
    {
      id: 1,
      libelle: 'Libelle'
    },
    {
      id:2,
      libelle: 'Libelle'
    },
    {
      id: 3,
      libelle: 'Libelle'
    },
    {
      id: 4,
      libelle: 'Libelle'
    },
    {
      id: 5,
      libelle: 'Libelle'
    }
  ]

  ngOnInit(): void {
    this.authservice.getProfilsortie().subscribe(
      (response:any) => {
        //this.dataSource = response["hydra:member"]
        console.log(this.dataSource);
      },
      (error) => {
        alert('probleme acces api dnness afiche sont fake');
        console.log(error);

      }
    );

  }
  constructor(private authservice: AuthService){}



}
