import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_generator/generator_provider.dart';

import 'colors.dart';


class LenghtSettingItem extends ConsumerWidget {
 
  const LenghtSettingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderValue = ref.watch(passwordLengthSetting);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: kEbonyClay),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          const Text('4'),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Slider(
              label: sliderValue.round().toString(),
              value: sliderValue,
              divisions: 100,
              onChanged: (value) {
                ref.read(passwordLengthSetting.notifier).state = value;
                // widget.onSliderValueChanged(value.round());
                // setState(() {
                //   sliderValue = value;
                // });
              },
              min: 4,
              max: 32,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Text('32'),
        ],
      ),
    );
  }
}

// class LenghtSettingItem extends StatefulWidget {

//   final ValueChanged<int> onSliderValueChanged;
//   const LenghtSettingItem({Key? key,
//   required this.onSliderValueChanged}) : super(key: key);

//   @override
//   State<LenghtSettingItem> createState() => _LenghtSettingItemState();
// }

// class _LenghtSettingItemState extends State<LenghtSettingItem> {

//   double sliderValue = 8;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8), color: kEbonyClay),
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       child: Row(
//         children: [
//           const Text('4'),
//           const SizedBox(
//             width: 5,
//           ),
//           Expanded(
//             child: Slider(
//               label: sliderValue.round().toString(),
//               value: sliderValue,
//               divisions: 100,
//               onChanged: (value) {
//                 widget.onSliderValueChanged(value.round());
//                 setState(() {
//                   sliderValue = value;
//                 });
//               },
//               min: 4,
//               max: 32,
//             ),
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           const Text('32'),
//         ],
//       ),
//     );
//   }
// }
