import 'package:flutter/material.dart';

enum GenderList { male, female }


class UserRegistration extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: GetTextFieldValue()
          );
  }
}

class GetTextFieldValue extends StatefulWidget {
 
  _TextFieldValueState createState() => _TextFieldValueState();
 
}
 
class _TextFieldValueState extends State<GetTextFieldValue> {
 
  final textFieldValueHolder = TextEditingController();
 
  String result = '';
 
  getTextInputData(){
    setState(() {
      result = textFieldValueHolder.text;
      // POST Request premaking
      /*
      Future<http.Response> postRequest () async {
        var url ='https://pae.ipportalegre.pt/testes2/wsjson/api/app/ws-authenticate';
        var body = jsonEncode();
      }*/
    });
  }
 
  @override
  final _formKey = GlobalKey<FormState>();
  GenderList _gender;
  bool _agreement = false;
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Registration'),
        ),

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new Text(
                  'Імя користувача:',
                  style: TextStyle(fontSize: 20.0),
                ),
                new TextFormField(validator: (value) {
                  if (value.isEmpty) return 'Будь ласка, вкажіть своє імя';
                }),
                new SizedBox(height: 20.0),
                new Text(
                  'Ваш E-mail:',
                  style: TextStyle(fontSize: 20.0),
                ),
                new TextFormField(validator: (value) {
                  if (value.isEmpty) return 'Будь ласка вкажіть ваш Email';

                  String p =
                      "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                  RegExp regExp = new RegExp(p);

                  if (regExp.hasMatch(value)) return null;

                  return 'Це не E-mail';
                }),
                new SizedBox(height: 20.0),
                new Text(
                  'Ваш рід:',
                  style: TextStyle(fontSize: 20.0),
                ),
                new RadioListTile(
                  title: const Text('Чоловік'),
                  value: GenderList.male,
                  groupValue: _gender,
                  onChanged: (GenderList value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                new RadioListTile(
                  title: const Text('Жінка'),
                  value: GenderList.female,
                  groupValue: _gender,
                  onChanged: (GenderList value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                new SizedBox(height: 20.0),
                new CheckboxListTile(
                    value: _agreement,
                    title: new Text('Я ознайомлен' +
                        (_gender == null
                            ? '(ий)'
                            : _gender == GenderList.male
                                ? ''
                                : 'а') +
                        ' з правилами користування ОСББ та готовий нести покарання у вигляді штрафів за їх порушення!'),
                    onChanged: (bool value) =>
                        setState(() => _agreement = value)),
                new SizedBox(height: 20.0),
                new RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Color color = Colors.red;
                      String text;

                      if (_gender == null)
                        text = 'Виберіть свій рід(чол/жін)';
                      else if (_agreement == false)
                        text = 'Необхідно прийняти правила користування ОСББ';
                      else {
                        text = 'Форма успішно заповнена';
                        color = Colors.green;
                      }

                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(text),
                        backgroundColor: color,
                      ));
                    }
                  },
                  child: Text('Перевірити'),
                  color: Colors.green,
                  textColor: Colors.white,
                )
              ],
            ))));
  }
  }
