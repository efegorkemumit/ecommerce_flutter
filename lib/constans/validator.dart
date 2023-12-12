class MyValidators{

  static String? displayNameValidator(String? displayName){
    if(displayName== null || displayName.isEmpty){
      return 'Display name cannot be empty';
    }
    if(displayName.length<3 || displayName.length>20)
      {
        return 'display name must be beetween 3 and 20 characters';
      }
    return null;
  }
  static String? EmailValidator(String? value){
    if(value!.isEmpty)
      {
        return 'plaese enter an email';
      }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? PasswordValidator(String? value){
    if(value!.isEmpty)
    {
      return 'plaese enter an password';
    }
    if(value.length<6){
      return 'password must be least 6 characters';

    }

    return null;
  }

  static String? repeatPasswordValidator(String? value, String? password){
    if(value!=password)
    {
      return 'Password do not match';
    }

    return null;
  }







}