const errorNullMessage = 'Ce champs est obligatoire';
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const errorInvalidEmailMessage = 'L\'email est invalide';
const errorSmallPassword = "Le mot de passe est trop court";
const errorInvalidMatchPassword = "Les deux mots de passe ne correspondent pas";