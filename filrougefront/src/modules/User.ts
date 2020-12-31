export class User {
  id: number;
    prenom: string;
    nom: string;
    password: string;
    email: string;
    token: string;
    constructor(prenom: string, nom: string, password: string, id: number, token: string , email: string)
    {   this.prenom = prenom;
        this.nom = nom;
        this.password = password;
        this.token = token;
        this.email = email;
        this.id = id;
    }
}
