import {Component, OnInit, ViewChild} from '@angular/core';
import {ActivatedRoute, Params, Router} from '@angular/router';
import {AuthService} from '../../../auth.service';
import {FormBuilder, FormControl, FormGroup, NgForm} from '@angular/forms';
import {HttpClient} from '@angular/common/http';
import {first, map, pluck} from 'rxjs/operators';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-modifier-user',
  templateUrl: './modifier-user.component.html',
  styleUrls: ['./modifier-user.component.css']
})
export class ModifierUserComponent implements OnInit {

  @ViewChild('f') form: NgForm | any;
  user: any
  idEdit = 0
 selectedFile:File
  constructor(private route: ActivatedRoute, private service: AuthService,
              private router: Router,
              private formBuilder: FormBuilder,
              private http: HttpClient) {


  }


  ngOnInit(): void {
    this.route.params.subscribe(
      (params: Params) => {
        const id = params.id;
        this.idEdit = +id;
        this.service.getUserById(+id).subscribe(
          (data) => {
            this.user = data;
            console.log(data.id);
          })
      });
  }

  modifierUser() {
    // console.log(this.form.value)
    let formData = new FormData();
    formData.append("nom", this.form.value['nom']);
    formData.append("prenom", this.form.value['prenom']);
    formData.append("email", this.form.value['email']);
    formData.append("password", this.form.value['password']);
    formData.append("profil_id", this.form.value['profil_id']);
    formData.append("avatar",this.selectedFile);
    console.log(formData)

      this.service.updateuser(formData, this.idEdit).subscribe(res => {
        console.log(res)
        Swal.fire({
          icon: 'success',
          title: 'modifié!',
          position: 'top'
        })
        this.form.reset();
      },(error) => {
        console.log(error)
        Swal.fire({
          icon: 'error',
          title: 'non modifié!',
          text: 'Vérifiez les informations saisies!',
          position: 'top'
        })
      });

  }
  onFileSelected(event: any) {
    if(event.files){
      // var reade = new FileReader();
      this.selectedFile =  event.files[0];
      // reade.readAsDataURL(event.target.files[0]);
      // reade.onload = (event:any)=>{
      //   this.url=event.target.result;
      // }
      // console.log(this.selectedFile)
    }
  }

}
