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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: ImageIcon(
                        const AssetImage('assets/images/logo/main_logo_02.png'),
                        color: isDarkTheme(context)
                            ? const Color(0xffa2a2a2)
                            : const Color.fromARGB(255, 214, 214, 214),
                        size: 70,
                      ),
                    ),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: '$companyName\nAddis Ababa, Ethiopia',
                        style: TextStyle(
                            color: isDarkTheme(context)
                                ? const Color(0xffa2a2a2)
                                : const Color.fromARGB(255, 214, 214, 214),
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
                            animationKey: '1',
                          ),
                          SquareSocialMediaButton(
                            imgPath: '${materials}facebook.png',
                            onTap: () {
                              launchUrl(facebookUrl);
                            },
                            animationKey: '2',
                          ),
                          SquareSocialMediaButton(
                            imgPath: '${materials}instagram.png',
                            onTap: () {
                              launchUrl(instagramUrl);
                            },
                            animationKey: '3',
                          ),
                          SquareSocialMediaButton(
                            imgPath: '${materials}twitterx.png',
                            onTap: () {
                              launchUrl(twitterUrl);
                            },
                            animationKey: '4',
                          ),
                          SquareSocialMediaButton(
                            imgPath: '${materials}telegram.png',
                            onTap: () {
                              launchUrl(telegramUrl);
                            },
                            animationKey: '5',
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Authorized Reseller of ',
                              style: TextStyle(
                                color: isDarkTheme(context)
                                    ? const Color(0xffa2a2a2)
                                    : const Color.fromARGB(255, 214, 214, 214),
                              ),
                            ),
                            const FargoAndFujitsu(),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
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
                      ),
                      Flexible(
                        child: Column(
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
        const SizedBox(
          height: 20,
        ),
        Text(
          'Authorized Reseller of ',
          style: TextStyle(
            color: isDarkTheme(context)
                ? const Color(0xffa2a2a2)
                : const Color.fromARGB(255, 214, 214, 214),
          ),
        ),
        const FargoAndFujitsu(),
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

class FargoAndFujitsu extends StatelessWidget {
  const FargoAndFujitsu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Flexible(
        child: Image(
          color: isDarkTheme(context)
              ? const Color(0xffa2a2a2)
              : const Color.fromARGB(255, 214, 214, 214),
          height: 30,
          image: const AssetImage('${materials}component_14.png'),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Text('&'),
      ),
      Flexible(
        child: Image(
          color: isDarkTheme(context)
              ? const Color(0xffa2a2a2)
              : const Color.fromARGB(255, 214, 214, 214),
          height: 60,
          image: const AssetImage('${materials}component_13.png'),
        ),
      ),
    ]);
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
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Authorized Reseller of ',
                  style: TextStyle(
                    color: isDarkTheme(context)
                        ? const Color(0xffa2a2a2)
                        : const Color.fromARGB(255, 214, 214, 214),
                  ),
                ),
                const FargoAndFujitsu(),
              ],
            ),
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
  int randomKey = 0;
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
            key: Key(randomKey.toString()),
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
    required this.animationKey,
  });
  final String imgPath;
  final Function() onTap;
  final String animationKey;

  @override
  State<SquareSocialMediaButton> createState() =>
      _SquareSocialMediaButtonState();
}

class _SquareSocialMediaButtonState extends State<SquareSocialMediaButton> {
  bool isHovered = false;
  int randomKeys = 0;

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      mouseCursor: MaterialStateMouseCursor.clickable,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isHovered = true;
          randomKeys = randomKeys + 1;
        }),
        onExit: (event) => setState(() {
          isHovered = false;
          randomKeys = randomKeys + 2;
        }),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedSwitcher(
            // key: Key(widget.animationKey),
            duration: const Duration(milliseconds: 250),
            child: Container(
              key: Key(randomKeys.toString()),
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
