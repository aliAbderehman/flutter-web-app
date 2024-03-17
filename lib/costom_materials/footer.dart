import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uhh/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterContainer extends StatelessWidget {
  const FooterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: Container(
        key: Key(Theme.of(context).brightness.toString()),
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(50, 0, 0, 0)
            : const Color(0xff004e63),
        // height: screenHeight * 0.7,
        width: screenWidth,
        child: SizedBox(
            // width: 200,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: ImageIcon(
                        AssetImage('assets/images/materials/main_logo_02.png'),
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: '$companyName\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MetropolisReg',
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: SizedBox(
                      width: 280,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SquareSocialMediaButton(
                            imgPath: '${materials}whatsapp.png',
                            onTap: () {
                              launchUrl(whatsappUrl);
                            },
                          ),
                          SquareSocialMediaButton(
                            imgPath: '${materials}facebook.png',
                            onTap: () {
                              launchUrl(facebookUrl);
                            },
                          ),
                          SquareSocialMediaButton(
                            imgPath: '${materials}instagram.png',
                            onTap: () {
                              launchUrl(instagramUrl);
                            },
                          ),
                          SquareSocialMediaButton(
                            imgPath: '${materials}twitterx.png',
                            onTap: () {
                              launchUrl(twitterUrl);
                            },
                          ),
                          SquareSocialMediaButton(
                            imgPath: '${materials}telegram.png',
                            onTap: () {
                              launchUrl(telegramUrl);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 0.3,
              endIndent: 100,
              indent: 100,
              color: Colors.white,
            ),
            if (screenWidth > 820)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: SelectableText(
                      style: Theme.of(context).textTheme.labelMedium,
                      'Experience Innovation, Reliability, and Unparalleled Service. Join us on a Journey of Excellence Today.',
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'QUICK LINKS',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      QuikLink(
                        text: 'About Us',
                        onTap: () {},
                      ),
                      QuikLink(
                        text: 'Our Works',
                        onTap: () {},
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CONTACT',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SelectableText(
                        'Email: $emailAddress',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        'Tel: $tel',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              )
            else if (screenWidth > 750)
              const MobileSizeFooter()
            else
              const SmallMobileSizeFooter(),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: SelectableText(
                '$companyName 2024 All Rights Reserved',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            )
          ],
        )),
      ),
    );
  }
}

class SmallMobileSizeFooter extends StatelessWidget {
  const SmallMobileSizeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          child: SelectableText(
            style: Theme.of(context).textTheme.labelMedium,
            'Experience Innovation, Reliability, and Unparalleled Service. Join us on a Journey of Excellence Today.',
          ),
        ),
        const Divider(
          endIndent: 50,
          indent: 50,
          thickness: 0.3,
          color: Colors.white,
        ),
        Text(
          'QUICK LINKS',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        QuikLink(
          text: 'About Us',
          onTap: () {},
        ),
        QuikLink(
          text: 'Our Works',
          onTap: () {},
        ),
        const Divider(
          endIndent: 50,
          indent: 50,
          thickness: 0.3,
          color: Colors.white,
        ),
        Text(
          'CONTACT',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        SelectableText(
          'Email: $emailAddress',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          'Tel: $tel',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}

class MobileSizeFooter extends StatelessWidget {
  const MobileSizeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 400,
          child: SelectableText(
            style: Theme.of(context).textTheme.labelMedium,
            'Experience Innovation, Reliability, and Unparalleled Service. Join us on a Journey of Excellence Today.',
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'QUICK LINKS',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            QuikLink(
              text: 'About Us',
              onTap: () {},
            ),
            QuikLink(
              text: 'Our Works',
              onTap: () {},
            ),
            const Divider(
              endIndent: 10,
              // thickness: 2,
              color: Colors.white,
            ),
            Text(
              'CONTACT',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            SelectableText(
              'Email: $emailAddress',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'Tel: $tel',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ],
    );
  }
}

class QuikLink extends StatefulWidget {
  const QuikLink({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function() onTap;

  @override
  State<QuikLink> createState() => _QuikLinkState();
}

class _QuikLinkState extends State<QuikLink> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      mouseCursor: MaterialStateMouseCursor.clickable,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Text.rich(
            textAlign: TextAlign.left,
            key: Key(isHovered.toString()),
            TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.navigate_next_sharp,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                TextSpan(
                  text: widget.text,
                  onEnter: (event) => setState(() {
                    isHovered = true;
                  }),
                  onExit: (event) => setState(() {
                    isHovered = false;
                  }),
                  style: TextStyle(
                    color: isHovered ? Colors.white : const Color(0xFFa2a2a2),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SquareSocialMediaButton extends StatefulWidget {
  const SquareSocialMediaButton({
    super.key,
    required this.imgPath,
    required this.onTap,
  });
  final String imgPath;
  final Function() onTap;

  @override
  State<SquareSocialMediaButton> createState() =>
      _SquareSocialMediaButtonState();
}

class _SquareSocialMediaButtonState extends State<SquareSocialMediaButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      mouseCursor: MaterialStateMouseCursor.clickable,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isHovered = true;
        }),
        onExit: (event) => setState(() {
          isHovered = false;
        }),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedSwitcher(
            // key: Key(isHovered.toString()),
            duration: const Duration(milliseconds: 100),
            child: Container(
              key: Key(isHovered.toString()),
              decoration: BoxDecoration(
                color: isHovered
                    ? Theme.of(context).colorScheme.tertiary
                    : Colors.transparent,
                border: Border.all(
                    width: 0.5,
                    color: isHovered
                        ? Theme.of(context).colorScheme.tertiary
                        : const Color.fromARGB(182, 166, 166, 166)),
                // borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  size: 20,
                  color: isHovered ? Colors.black : Colors.white,
                  AssetImage(widget.imgPath),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
