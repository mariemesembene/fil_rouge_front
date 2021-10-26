class Validators {
  isEmpty(value) {
    if (value.isEmpty) {
      return '\u26A0 Ce champs est obligatoire';
    }
    return null;
  }
}
