import 'package:flutter/material.dart';
import 'package:quiz_app/constanst/colors.dart';

class LevelTile extends StatefulWidget {
  const LevelTile({super.key, required this.num, required this.gradient});

  final int num;
  final List<Color> gradient;

  @override
  State<LevelTile> createState() => _LevelTileState();
}

class _LevelTileState extends State<LevelTile> {
  int get num => widget.num;
  List<Color> get gradient => widget.gradient;

  @override
  Widget build(BuildContext context) {
    // This variable will hold the selected value
    String? selectedValue = '1';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'level $num',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                // Container(
                //   child: RadioListTile<String>(
                //     title: const Text(
                //       '1',
                //       style: TextStyle(
                //         color: Color.fromARGB(255, 71, 95, 116),
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     value: '1',
                //     groupValue: selectedValue,
                //     onChanged: (value) {
                //       setState(() {
                //         selectedValue = value;
                //       });
                //     },
                //   ),
                // ),

                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: mainColor, width: 2),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text.rich(TextSpan(
                  children: [
                    const TextSpan(
                      text: "Your highest score is ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: "40",
                      style: TextStyle(
                          color: mainColor, fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: " points ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

// gradient: LinearGradient(colors: gradient)