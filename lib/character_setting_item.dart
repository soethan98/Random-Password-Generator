import 'package:flutter/material.dart';
import 'package:password_generator/colors.dart';

class CharacterSettingItem extends StatelessWidget {
  final String title;
  final bool switchValue;
  final ValueChanged<bool> onValueChange;
  
  const CharacterSettingItem({Key? key,
  required this.title,
  required this.onValueChange,
  required this.switchValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
              color: kEbonyClay),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          Switch(
            activeTrackColor: kBlueRibbon,
            activeColor: kBlueRibbon,
            value: switchValue, 
            onChanged: onValueChange),
        ],
      ),
    );
  }
}