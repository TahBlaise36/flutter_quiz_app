import 'package:flutter/material.dart';
import 'package:quiz_app/components/text_styles.dart';
import 'package:quiz_app/constanst/colors.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    super.key,
    required this.title,
    required this.index,
    required this.score,
  });
  final double? score;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Transform.translate(
        offset: const Offset(0, -60.0),
        child: Stack(
          children: [
            // The main container
            Container(
              width:
                  double.infinity, // Takes full width of its parent container
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35),
              decoration: BoxDecoration(
                border: Border.all(color: mainColor, width: 2),
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage('lib/images/quiz_bg4.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align the "1." text to the top
                children: [
                  Expanded(
                    child: Text.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$index.  ',
                            style: TextStyle(
                              color: white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: title,
                            style: TextStyle(
                              color: white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // The circular container
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: const Offset(
                    0, -28.0), // Move the circular container up by 28.0 points
                child: Center(
                  child: Container(
                    width: 56.0,
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: white, // Set the background color
                      shape: BoxShape.circle, // Make it circular
                      border: Border.all(
                        color: mainColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: TextStyles(
                        '$score',
                        color: mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ), // Add the text "2" inside the circular container
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
