import 'package:flutter/material.dart';
import 'package:dmd_web_01/costom_materials/footer.dart';
import 'package:dmd_web_01/costom_materials/mobile_menu.dart';

import '../../constants.dart';
import '../materials.dart';

bool isExpanded = false;

class OurWorksDesktop extends StatefulWidget {
  const OurWorksDesktop({super.key});

  @override
  State<OurWorksDesktop> createState() => _OurWorksDesktopState();
}

class _OurWorksDesktopState extends State<OurWorksDesktop>
    with TickerProviderStateMixin {
  late final OverlayPortalController _overlayController;
  late final OverlayPortalController _socialMediasController;
  late AnimationController _controller;

  // Initialize overlay controllers when the state is initialized.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _overlayController = OverlayPortalController();
    _socialMediasController = OverlayPortalController();
  }

  @override
  void dispose() {
    // _overlayController.hide();
    super.dispose();
  }

  // Build the UI for the desktop body.
  @override
  Widget build(BuildContext context) {
    // Retrieve the screen width using MediaQuery.
    final screenWidth = MediaQuery.of(context).size.width;

    // Hide overlays if the screen width is less than 700.
    adjustScreen(
        screenWidth: screenWidth,
        overlayController: _overlayController,
        socialMediasController: _socialMediasController);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      onEndDrawerChanged: (isOpened) {
        if (!isOpened) {
          _controller.reverse();
        }
      },
      endDrawer: screenWidth < 760
          ? CustomEndDrawer(
              screenWidth: screenWidth,
            )
          : null,
      appBar: screenWidth < 760 ? CustomAppBar(controller: _controller) : null,
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SocialMedias(socialMediasController: _socialMediasController),
            HeaderActions(overlayController: _overlayController),
            SizedBox(
              // height: 1700,
              child: Stack(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    // key: Key(Theme.of(context).brightness.toString()),
                    child: Image.asset(
                      height: screenHeight(context) * 0.42,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      key: Key(Theme.of(context).brightness.toString()),
                      isDarkTheme(context)
                          ? 'assets/images/materials/component_16.png'
                          : 'assets/images/materials/component_15.png',
                    ),
                  ),

                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: SizedBox(
                        // width: 700,
                        child: Text(
                          'Exploring Our Expertise\nInnovating in Imports, Excelling in Exports',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth > 1000 ? 40 : 30,
                            fontFamily: 'MetropolisReg',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xfff3f3f3),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Text.rich(TextSpan)
                ],
              ),
            ),
            const DesktopOurWorksWidget(),
            const FooterContainer(),
          ],
        ),
      ),
    );
  }
}

class DesktopOurWorksWidget extends StatelessWidget {
  const DesktopOurWorksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 850,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            'Emports:',
            style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 40,
                color: Theme.of(context).colorScheme.tertiary),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: ourWorksTxt.map((e) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                  child: RowCard(
                    title: e.title,
                    description: coffeeDescription,
                    mode: e.position ?? 2,
                    content: SelectableText.rich(
                      TextSpan(
                          text: '${e.title}\n',
                          style: TextStyle(
                            fontSize: 40,
                            height: 0.8,
                            fontFamily: 'MetropolisReg',
                            fontWeight: FontWeight.w400,
                            color: isDarkTheme(context)
                                ? const Color(0xfff3f3f3)
                                : const Color(0xff1e1e24),
                          ),
                          children: [
                            TextSpan(
                              text: e.content,
                              style: const TextStyle(fontSize: 20, height: 1),
                            )
                          ]),
                    ),
                    child: e == ourWorksTxt.last
                        ? const CoffeeImages()
                        : Image(image: AssetImage(e.imgPath ?? '')),
                  ),
                );
              }).toList()),
        ],
      ),
    );
  }
}

class CoffeeImages extends StatelessWidget {
  const CoffeeImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              width: 165,
              height: 350,
              fit: BoxFit.cover,
              image: AssetImage('${materials}component_11.png'),
            )),
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Image(
                width: 165,
                height: 165,
                image: AssetImage('${materials}component_9.png'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Image(
                width: 165,
                height: 165,
                image: AssetImage('${materials}component_10.png'),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RowCard extends StatelessWidget {
  const RowCard({
    super.key,
    required this.child,
    required this.title,
    required this.description,
    this.secondaryChild,
    required this.mode,
    required this.content,
  });
  final Widget child;
  final String title;
  final Widget content;
  // final Widget img;
  final String description;
  final Widget? secondaryChild;
  final int mode;

  @override
  Widget build(BuildContext context) {
    return mode == 1
        ? SizedBox(
            width: 850,
            child: Column(
              children: [
                if (title == 'Coffee')
                  SelectableText(
                    'Emports:',
                    style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 40,
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: 350,
                        // height: 350,
                        child: child,
                      ),
                    ),
                    secondaryChild ?? const SizedBox(),
                    Flexible(
                      fit: FlexFit.loose,
                      child: SizedBox(
                        width: 425,
                        child: content,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title == 'Coffee')
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: SelectableText(
                    'Emports:',
                    style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 40,
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: SizedBox(
                      width: 700,
                      child: content,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 420,
                        height: 420,
                        child: child,
                      ),
                      secondaryChild ?? const SizedBox(),
                    ],
                  ),
                ],
              ),
            ],
          );
  }
}
