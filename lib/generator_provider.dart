import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_generator/character_option.dart';
import 'package:password_generator/password_generator.dart';

final lowerCaseSettingsProvider = StateProvider<bool>((ref) {
  return true;
});

final upperCaseSettingsProvider = StateProvider<bool>((ref) {
  return true;
});

final specialCharSettingsProvider = StateProvider<bool>((ref) {
  return true;
});

final numberSettingsProvider = StateProvider<bool>((ref) {
  return true;
});

final passwordLengthSetting = StateProvider<double>((ref) {
  //Default
  return 8;
});

final passwordGeneratorProvider =
    ChangeNotifierProvider<PasswordGeneratorNotifier>((ref) {
  return PasswordGeneratorNotifier(ref: ref);
});

class PasswordGeneratorNotifier extends ChangeNotifier {
  final Ref ref;
  PasswordGeneratorNotifier({required this.ref});

  String _generatedPassword = '';
  String get generatedPassword => _generatedPassword;

  final Map<CharacterOption, bool> _characterSettings = {
    CharacterOption.lowerCase: true,
    CharacterOption.upperCase: true,
    CharacterOption.specialCharacter: true,
    CharacterOption.number: true
  };

  void toggleLowercaseSetting() {
    _characterSettings[CharacterOption.lowerCase] == true
        ? _characterSettings[CharacterOption.lowerCase] = false
        : _characterSettings[CharacterOption.lowerCase] = true;

    ref.read(lowerCaseSettingsProvider.notifier).state =
        _characterSettings[CharacterOption.lowerCase]!;
  }

  void toggleUppercaseSetting() {
    _characterSettings[CharacterOption.upperCase] =
        !_characterSettings[CharacterOption.upperCase]!;
    ref.read(upperCaseSettingsProvider.notifier).state =
        _characterSettings[CharacterOption.upperCase]!;
  }

  void toggleNumberSetting() {
    _characterSettings[CharacterOption.number] =
        !_characterSettings[CharacterOption.number]!;
    ref.read(numberSettingsProvider.notifier).state =
        _characterSettings[CharacterOption.number]!;
  }

  void toggleSpecialCharSetting() {
    _characterSettings[CharacterOption.specialCharacter] =
        !_characterSettings[CharacterOption.specialCharacter]!;
    ref.read(specialCharSettingsProvider.notifier).state =
        _characterSettings[CharacterOption.specialCharacter]!;
  }

  void onGeneratePassword() {
    final length = ref.read(passwordLengthSetting).round();   
    if (!_characterSettings.containsValue(true)) {
      return;
    }
      final password = PasswordGenerator()
          .generatePassword(length: length, characters: _characterSettings);
      _generatedPassword = password;
      notifyListeners();
    
  }
}
