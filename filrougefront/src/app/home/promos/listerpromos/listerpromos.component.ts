import { Component, OnInit } from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';

export interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {position: 1, name: 'id', weight: 1.0079, symbol: 'H'},
  {position: 2, name: 'langue', weight: 4.0026, symbol: 'He'},
  {position: 3, name: 'titre', weight: 6.941, symbol: 'Li'},
  {position: 4, name: 'description', weight: 9.0122, symbol: 'Be'},
  {position: 5, name: 'lieu', weight: 10.811, symbol: 'B'},
  {position: 6, name: 'reference', weight: 12.0107, symbol: 'C'},
  {position: 7, name: 'fabrique', weight: 14.0067, symbol: 'N'},
  {position: 8, name: 'debut', weight: 14.0067, symbol: 'N'},
  {position: 9, name: 'fin', weight: 14.0067, symbol: 'N'},
  {position: 10, name: 'actions', weight: 14.0067, symbol: 'N'},

];

@Component({
  selector: 'app-listerpromos',
  templateUrl: './listerpromos.component.html',
  styleUrls: ['./listerpromos.component.css']
})
export class ListerpromosComponent implements OnInit {
  displayedColumns: string[] = ['id',  'titre' , 'description', 'lieu', 'reference', 'fabrique', 'debut', 'fin', 'actions'];
  dataSource = new MatTableDataSource<PeriodicElement>(ELEMENT_DATA);

  constructor() { }

  ngOnInit(): void {
  }

}
