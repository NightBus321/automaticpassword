import 'package:flutter/material.dart'; 
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart'; 



String generateRandomPassword(int length, option1, option2, option3, option4) {
  const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  const String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String numericChars = '0123456789';
  const String specialChars = '!@#\$%^&*()_+[]{}|;:,.<>?';   

  String allChars = "";
      

  if (option1) {
    allChars = allChars + lowercaseChars;
  } 
  if (option2) {
    allChars = allChars + uppercaseChars;
  } 
  if (option3) {
    allChars = allChars + numericChars;
  } 
  if (option4) {
    allChars = allChars + specialChars; 
  } 

  final Random random = Random.secure();
  String password = '';

  for (int i = 0; i < length; i++) {
    final int randomIndex = random.nextInt(allChars.length);
    password += allChars[randomIndex];
  } 

  if (option1 == false && option2 == false && option3 == false && option4 == false) {
    password = "No se puede generar una contraseña vacía";
  }

  return password;
}

class AppForms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppForms();
  }
}

class _AppForms extends State {  

  double length = 0.0; 
  bool option1 = true;  
  bool option2 = true; 
  bool option3 = true; 
  bool option4 = true;  
  bool option5 = true; 
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forms")),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Slider(value: length/100, onChanged: (value){
                length = value*100.round();
                password = generateRandomPassword(length.toInt(), option1, option2, option3, option4);
                setState(() {
                  
                });}),
              CheckboxListTile(value: option1, title: Text("Minusculas"), onChanged: (value){
                option1 = !option1;
                generateRandomPassword(length.toInt(), option1, option2, option3, option4);
                setState(() {
                  
                });
              }), 
              CheckboxListTile(value: option2, title: Text("Mayúsculas"), onChanged: (value){
                option2 = !option2;
                generateRandomPassword(length.toInt(), option1, option2, option3, option4);
                setState(() {
                  
                });
              }),
              CheckboxListTile(value: option3, title: Text("Números"), onChanged: (value){
                option3 = !option3;
                generateRandomPassword(length.toInt(), option1, option2, option3, option4);
                setState(() {
                  
                });
              }),
              CheckboxListTile(value: option4, title: Text("Especiales"), onChanged: (value){
                option4 = !option4;
                generateRandomPassword(length.toInt(), option1, option2, option3, option4);
                setState(() {
                  
                });
              }), 
               Visibility( visible: false,
                child: CheckboxListTile(value: option5, onChanged: (value){
                  option5 = !option5;
                  generateRandomPassword(length.toInt(), option1, option2, option3, option4);
                  setState(() {
                    
                  });
                }),
              ),
              ElevatedButton(
                onPressed: () { 
                  password = generateRandomPassword(length.toInt(), option1, option2, option3, option4);  
                  setState((){});
                 } // Longitud de la contraseña 
                 ,child: Text("Generar nueva contraseña"),
              ), 
              SizedBox(height: 20,),
              Text("$password",style: TextStyle(fontSize: 15),)
            ]
          )
        )
      );
  }
}