import { Component, OnInit } from '@angular/core';
import {AuthService} from '../../../auth.service';
import {FormControl, Validators} from '@angular/forms';

@Component({
  selector: 'app-add-user',
  templateUrl: './add-user.component.html',
  styleUrls: ['./add-user.component.css']
})
export class AddUserComponent implements OnInit {

  constructor(private service: AuthService){}

  email = new FormControl('', [Validators.required, Validators.email]);

  getErrorMessage() {
    if (this.email.hasError('required')) {
      return 'You must enter a value';
    }

    return this.email.hasError('email') ? 'Not a valid email' : '';
  }

  ngOnInit(): void {
  }
  hide = true;
  avatar: any



  Postuler(data:any){
    console.log(data)
    const formdata=new FormData();
    formdata.append("email",data.email)
    formdata.append("prenom",data.nom)
    formdata.append("nom",data.nom)
    formdata.append("password",data.password)
    formdata.append("profil_id",data.profil)
    formdata.append("avatar",this.avatar,this.avatar.name)
    this.service.registerUser(formdata).subscribe(
      (response)=>
      {
        console.log (response)
      },
      (error) =>
      {
        console.log(error)
      }
    )

  }

  selectedFile(files: FileList)
  {
    this.avatar = files.item(0);
  }



}
