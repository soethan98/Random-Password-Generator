import 'dart:math';

import 'package:password_generator/character_option.dart';

class PasswordGenerator {
  

  PasswordGenerator._internal();

  static final PasswordGenerator _instance = PasswordGenerator._internal();

  factory PasswordGenerator(){
    return _instance;
  }


  final _letterLowercase = 'abcdefghijklmnopqrstuvwxyz';
  final _letterUppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final _numbers = '0123456789';
  final _special = "!#\$%&*+-=?@^_{}[]()/'`~,;:.<>";

  

   String generatePassword({required int length,required Map<CharacterOption,bool> characters}){
    String chars='';
    if(characters[CharacterOption.lowerCase] == true){
      chars+=_letterLowercase;
    }
    if(characters[CharacterOption.upperCase] == true){
      chars+=_letterUppercase;
    }
    if(characters[CharacterOption.specialCharacter] == true){
      chars+=_special;
    }
    if(characters[CharacterOption.number] == true){
      chars+=_numbers;
    }
    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join();
    
  }
}