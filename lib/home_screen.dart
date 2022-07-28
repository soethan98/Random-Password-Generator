import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_generator/length_setting_item.dart';
import 'package:password_generator/password_field_item.dart';
import 'character_setting_item.dart';
import 'generator_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordValue = ref.watch(
        passwordGeneratorProvider.select((value) => value.generatedPassword));
    final lengthValue = ref.watch(passwordLengthSetting);
    final upperCaseSettingValue = ref.watch(upperCaseSettingsProvider);
    final lowerCaseSettingValue = ref.watch(lowerCaseSettingsProvider);
    final specialCaseSettingValue = ref.watch(specialCharSettingsProvider);
    final numberCaseSettingValue = ref.watch(numberSettingsProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Random Password Generator',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 32,
              ),
              PasswordFieldItem(
                passwordValue: passwordValue,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'LENGTH:${lengthValue.round()}',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white.withOpacity(0.5)),
              ),
              const LenghtSettingItem(),
              const SizedBox(
                height: 4,
              ),
              Text(
                'SETTINGS',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white.withOpacity(0.5)),
              ),
              CharacterSettingItem(
                title: 'Include Number',
                switchValue: numberCaseSettingValue,
                onValueChange: ((value) {
                  ref.read(passwordGeneratorProvider).toggleNumberSetting();
                }),
              ),
              CharacterSettingItem(
                title: 'Include Lowercase',
                switchValue: lowerCaseSettingValue,
                onValueChange: ((value) {
                  ref.read(passwordGeneratorProvider).toggleLowercaseSetting();
                }),
              ),
              CharacterSettingItem(
                title: 'Include Uppercase',
                switchValue: upperCaseSettingValue,
                onValueChange: ((value) {
                  ref.read(passwordGeneratorProvider).toggleUppercaseSetting();
                }),
              ),
              CharacterSettingItem(
                title: 'Include Special Characters',
                switchValue: specialCaseSettingValue,
                onValueChange: ((value) {
                  ref
                      .read(passwordGeneratorProvider)
                      .toggleSpecialCharSetting();
                }),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    ref.read(passwordGeneratorProvider).onGeneratePassword();
                  },
                  child: const Text('Generate Password')),
            ],
          ),
        ),
      ),
    );
  }
}