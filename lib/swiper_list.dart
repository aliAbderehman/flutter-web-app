import 'package:dmd_web_01/constants.dart';
import 'package:flutter/material.dart';

// import 'responsive/constants.dart';

class SwipableCardDesktop extends StatelessWidget {
  const SwipableCardDesktop({
    super.key,
    required this.title,
    required this.description,
    this.imgPath,
    this.position,
  });
  final String title;
  final String description;
  final String? imgPath;
  final int? position;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: SizedBox(
        width: 900,
        // height: 600,
        child: position == 1
            ? Row(
                children: [
                  if (imgPath != '')
                    Expanded(
                      child: Image(
                        height: 400,
                        image: AssetImage(imgPath!),
                      ),
                    ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      // width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text.rich(
                          TextSpan(
                            text: '$title\n',
                            style: TextStyle(
                              // fontWeight: FontWeight.w600,
                              fontSize: 40,
                              height: 1,
                              color: isDarkTheme(context)
                                  ? const Color(0xfff3f3f3)
                                  : Colors.white,

                              fontFamily: 'Metropolis',
                            ),
                            children: [
                              TextSpan(
                                text: description,
                                style: const TextStyle(
                                  fontSize: 20,
                                  height: 1,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'MetropolisReg',
                                  // color: Color.fromARGB(255, 200, 200, 200),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      // width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text.rich(
                          maxLines: 6,
                          overflow: TextOverflow.fade,
                          TextSpan(
                            text: '$title\n',
                            style: TextStyle(
                              // fontWeight: FontWeight.w600,
                              fontSize: 40,
                              height: 1,
                              color: isDarkTheme(context)
                                  ? const Color(0xfff3f3f3)
                                  : Colors.white,

                              fontFamily: 'Metropolis',
                            ),
                            children: [
                              TextSpan(
                                text: description,
                                style: const TextStyle(
                                  fontSize: 20,
                                  height: 1,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'MetropolisReg',
                                  // color: Color.fromARGB(255, 200, 200, 200),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (imgPath != '')
                    Expanded(
                      child: Image(
                        height: 200,
                        image: AssetImage(imgPath!),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
