import 'package:flutter/material.dart';
import 'package:uhh/costom_materials/footer.dart';
import 'package:uhh/costom_materials/mobile_menu.dart';

import '../constants.dart';
import 'materials.dart';

bool isExpanded = false;

class OurWorks extends StatefulWidget {
  const OurWorks({super.key});

  @override
  State<OurWorks> createState() => _OurWorksState();
}

class _OurWorksState extends State<OurWorks> with TickerProviderStateMixin {
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
      endDrawer: screenWidth < 750
          ? CustomEndDrawer(
              screenWidth: screenWidth,
            )
          : null,
      appBar: screenWidth < 750 ? CustomAppBar(controller: _controller) : null,
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
                  const BackgroundImage01(),
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
            screenWidth > 1080
                ? const DesktopOurWorksWidget()
                : const MobileOurWorksWidget(),
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: RowCard(
            title: coffeTitle,
            description: coffeDescription,
            secondaryChild: ImageTopTitle(),
            mode: 1,
            child: CoffeeImages(),
          ),
        ),

        //it section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: RowCard(
            title: itTitle,
            description: itDesctiption,
            mode: 2,
            child: Image(
                height: 420, image: AssetImage('${materials}component_12.png')),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: RowCard(
            title: machinesTitle,
            description: machinesDescription,
            mode: 1,
            child: Image(
                height: 420, image: AssetImage('${materials}machines_01.png')),
          ),
        ),
      ],
    );
  }
}

class ImageTopTitle extends StatelessWidget {
  const ImageTopTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      width: 160,
      child: DescriptionContainer(
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: '100%\nOrganic',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'MetropolisReg',
              fontWeight: FontWeight.w400,
              color: Color(0xfff3f3f3),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileOurWorksWidget extends StatelessWidget {
  const MobileOurWorksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(height: 420, width: 420, child: CoffeeImages()),
            ImageTopTitle(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Text.rich(TextSpan(
              text: coffeTitle,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'MetropolisReg',
                fontWeight: FontWeight.w400,
                color: isDarkTheme(context)
                    ? const Color(0xfff3f3f3)
                    : const Color(0xff1e1e24),
              ),
              children: const [
                TextSpan(text: coffeDescription, style: TextStyle(fontSize: 20))
              ])),
        ),
        const Image(
            height: 420, image: AssetImage('${materials}component_12.png')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text.rich(TextSpan(
              text: itTitle,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'MetropolisReg',
                fontWeight: FontWeight.w400,
                color: isDarkTheme(context)
                    ? const Color(0xfff3f3f3)
                    : const Color(0xff1e1e24),
              ),
              children: const [
                TextSpan(text: itDesctiption, style: TextStyle(fontSize: 20))
              ])),
        ),
        const Image(
            height: 420, image: AssetImage('${materials}machines_01.png')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text.rich(TextSpan(
              text: machinesTitle,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'MetropolisReg',
                fontWeight: FontWeight.w400,
                color: isDarkTheme(context)
                    ? const Color(0xfff3f3f3)
                    : const Color(0xff1e1e24),
              ),
              children: const [
                TextSpan(
                    text: machinesDescription, style: TextStyle(fontSize: 20))
              ])),
        ),
      ],
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
              width: 200,
              height: 420,
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
                width: 200,
                height: 200,
                image: AssetImage('${materials}component_9.png'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Image(
                width: 200,
                height: 200,
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
  });
  final Widget child;
  final String title;
  final String description;
  final Widget? secondaryChild;
  final int mode;

  @override
  Widget build(BuildContext context) {
    return mode == 1
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  width: 700,
                  child: Text.rich(TextSpan(
                      text: title,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'MetropolisReg',
                        fontWeight: FontWeight.w400,
                        color: isDarkTheme(context)
                            ? const Color(0xfff3f3f3)
                            : const Color(0xff1e1e24),
                      ),
                      children: [
                        TextSpan(
                            text: description,
                            style: const TextStyle(fontSize: 20))
                      ])),
                ),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  width: 700,
                  child: Text.rich(TextSpan(
                      text: title,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'MetropolisReg',
                        fontWeight: FontWeight.w400,
                        color: isDarkTheme(context)
                            ? const Color(0xfff3f3f3)
                            : const Color(0xff1e1e24),
                      ),
                      children: [
                        TextSpan(
                            text: description,
                            style: const TextStyle(fontSize: 20))
                      ])),
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
          );
  }
}
