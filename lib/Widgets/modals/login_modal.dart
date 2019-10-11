

class LoginFormModel {

  final String type;
  final String placeholder;
  final String validatorRegex;
  final String text;
  

  LoginFormModel.fromJson(Map<String, dynamic>parsedJson)
  : type = parsedJson['type'],
    placeholder = parsedJson['placeholder'],
    validatorRegex = parsedJson['validatorRegex'],
    text = parsedJson['text'];
}

class LoginModel {
  final String name;
  final String background;
  final String accent;
  final List<LoginFormModel> children;

  LoginModel.fromJson(Map<String,dynamic> parsedJson)
    : name=parsedJson['name'],
      children = [...parsedJson['children'].map((data){return LoginFormModel.fromJson(data);})],
      background= parsedJson['background'],
      accent= parsedJson['accent'];

}
