import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_generator/colors.dart';

class PasswordFieldItem extends ConsumerWidget {
  final String passwordValue;
  late TextEditingController _controller;
  
  PasswordFieldItem({Key? key,required this.passwordValue}) : super(key: key){
    _controller = TextEditingController()..text = passwordValue;
  }

 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        controller: _controller,
        readOnly: true,
        enableInteractiveSelection: false,
        decoration: const InputDecoration(
          fillColor: kEbonyClay,
          filled: true,
          enabled: false,
          border: InputBorder.none,
          suffixIcon: Icon(Icons.copy)
        ),
      ),
    );
  }
}