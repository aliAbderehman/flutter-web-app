import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';

class MySuperCard extends StatefulWidget {
  const MySuperCard(
      {super.key,
      required this.isExpanded,
      // required this.onTap,
      required this.title,
      required this.description,
      required this.leadingImg});
  final bool isExpanded;
  // final VoidCallback onTap;
  final String title;
  final String description;
  final String leadingImg;

  @override
  State<MySuperCard> createState() => _MySuperCardState();
}

class _MySuperCardState extends State<MySuperCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => SizeTransition(
          sizeFactor: animation,
          axisAlignment: -1.0,
          child: child,
        ),
        child: isExpanded == false
            ? FoldedCon(
                width: screenWidth,
                height: screenHeight * 0.4,
                // onTap: widget.onTap,
                title: widget.title,
                description: widget.description,
                isDropped: false, leadingImg: widget.leadingImg,
              )
            : UnfodedCon(
                width: screenWidth,
                description: widget.description,
                // onTap: widget.onTap,
                title: widget.title,
                height: screenHeight,
                isDroped: true, leadingImg: widget.leadingImg,
              ),
      ),
    );
  }
}

Color col = const Color.fromARGB(154, 111, 111, 111);
// bool isDroped = false;

class MoreButton extends StatefulWidget {
  const MoreButton({
    super.key,
    // required this.onTap,
    required this.isDropped,
  });

  // final VoidCallback onTap;
  final bool isDropped;

  @override
  State<MoreButton> createState() => _MoreButtonState();
}

class _MoreButtonState extends State<MoreButton> {
  Color myCol = const Color.fromARGB(0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            myCol = col;
          });
        },
        onExit: (event) {
          setState(() {
            myCol = const Color.fromARGB(0, 0, 0, 0);
          });
        },
        child: GestureDetector(
          // onTap: widget.onTap,
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: myCol),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      widget.isDropped == false ? 'More' : 'Close',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: Icon(widget.isDropped == false
                        ? Icons.arrow_drop_down_outlined
                        : Icons.arrow_drop_up_outlined),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 0.5}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class FoldedCon extends StatelessWidget {
  const FoldedCon(
      {super.key,
      required this.width,
      required this.height,
      // required this.onTap,
      required this.title,
      required this.description,
      required this.isDropped,
      required this.leadingImg});
  final double width;
  final double height;
  // final VoidCallback onTap;
  final String title;
  final String description;
  final bool isDropped;
  final String leadingImg;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: Container(
        width: width,
        // height: width * 0.2,
        // alignment: Alignment.centerLeft,
        decoration: cardBoxDecoration(context: context, img: leadingImg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, top: 30, bottom: 30),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Image.asset(
            //       leadingImg,
            //       // height: 100,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.end,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.7,
                    child: Text(
                      description,
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnfodedCon extends StatelessWidget {
  const UnfodedCon(
      {super.key,
      required this.width,
      required this.title,
      required this.description,
      // required this.onTap,
      required this.height,
      required this.isDroped,
      required this.leadingImg});
  final double width;
  final double height;
  final String title;
  final String description;
  // final VoidCallback onTap;
  final bool isDroped;
  final String leadingImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // height: height,
      // alignment: Alignment.centerLeft,
      decoration: cardBoxDecoration(context: context, img: leadingImg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20, top: 30, bottom: 30),
          //     child: Image.asset(
          //       leadingImg,
          //       // height: 200,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  width: width * 0.7,
                  child: Text(
                    description,
                    // maxLines: 4,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
