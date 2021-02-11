import {Component, OnInit, ViewChild} from '@angular/core';
import {AuthService} from '../../../auth.service';
import {MatPaginator} from '@angular/material/paginator';
import {MatTableDataSource} from '@angular/material/table';
import {User} from '../../../../modules/User';

@Component({
  selector: 'app-lister-users',
  templateUrl: './lister-users.component.html',
  styleUrls: ['./lister-users.component.css']
})
export class ListerUsersComponent implements OnInit {
  constructor(private authservice: AuthService){}
  displayedColumns: string[] = ['id', 'avatar', 'nom', 'prenom', 'email', 'action' ];
  dataSource: any;

  ngOnInit(): void  {
    this.listeruser();

  }
  // tslint:disable-next-line:typedef
  listeruser(){
    this.authservice.getUser().subscribe(
      (Response) => {
        console.log(Response);
        this.dataSource = Response ["hydra:member"];
        console.log(this.dataSource);
      },
      (error) =>{
        alert('probleme acces api dnness afiche sont fake');
        console.log(error);

      }
    );
  }
  delete(id:any){
    this.authservice.deleteuser(id).subscribe(
      (response:any)=>{
        alert("success")
      }
    )
  }
}
