import 'package:flutter/material.dart';

import 'package:uhh/costom_materials/footer.dart';
import 'package:uhh/costom_materials/mobile_menu.dart';

import '../constants.dart';
import 'materials.dart';

class Abouts extends StatefulWidget {
  const Abouts({super.key});

  @override
  State<Abouts> createState() => _AboutsState();
}

class _AboutsState extends State<Abouts> with TickerProviderStateMixin {
  late final OverlayPortalController _overlayController;

  late final OverlayPortalController _socialMediasController;

  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _overlayController = OverlayPortalController();
    _socialMediasController = OverlayPortalController();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Hide overlays if the screen width is less than 700.
    adjustScreen(
        screenWidth: screenWidth,
        overlayController: _overlayController,
        socialMediasController: _socialMediasController);

    // Construct the scaffold containing the desktop UI components.
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
        appBar:
            screenWidth < 750 ? CustomAppBar(controller: _controller) : null,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderActions(overlayController: _overlayController),
              SocialMedias(socialMediasController: _socialMediasController),
              Stack(
                children: [
                  _mainBgImage(context),
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Column(
                      children: [
                        _topText1(context),
                        _buidPartnershipBanner(context),
                        _importingWidget(),
                        _exportingWidget(),
                        _twoButtons(context, screenWidth),
                        _commitmentTxtBuilder(context),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 100,
                  // ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: FooterContainer(),
              ),
            ],
          ),
        ));
  }

  Widget _commitmentTxtBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: 800,
        child: Text.rich(
          TextSpan(
              text: 'Our Commitment\n',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Metropolis',
                color: isDarkTheme(context)
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color(0xFF0b394e),
              ),
              children: [
                TextSpan(
                  text: aboutUsTxt2,
                  style: TextStyle(
                      fontSize: 20,
                      color: isDarkTheme(context)
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : const Color(0xFF0b394e),
                      fontFamily: 'MetropolisReg',
                      height: 1.2),
                )
              ]),
        ),
      ),
    );
  }

  Widget _twoButtons(BuildContext context, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: const Alignment(0.6, 0.8),
            child: SizedBox(
              height: 60,
              child: FittedBox(
                child: ContactButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/our_work_page');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Visit Our Works',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: screenWidth > 1000
                ? const Alignment(0.6, 0.93)
                : const Alignment(0.6, 1),
            child: SizedBox(
              height: 60,
              child: FittedBox(
                child: ContactButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/contact_us_page');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'CONTACT US',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Align _exportingWidget() {
    return const Align(
      alignment: Alignment(-0.6, 1),
      child: SizedBox(
        height: 400,
        width: 700,
        child: DescriptionContainer(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exporting Excellence:',
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Metropolis',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Text(
                  aboutUsTxt2,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'MetropolisReg',
                      height: 1.2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _importingWidget() {
    return const Align(
      // alignment: Alignment(0.6, 0),
      child: SizedBox(
        height: 400,
        width: 700,
        child: DescriptionContainer(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Importing Excellence:',
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Metropolis',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Text(
                  aboutUsTxt2,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'MetropolisReg',
                      height: 1.2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buidPartnershipBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 60, right: 60, top: 100, bottom: 20),
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Container(
              color: isDarkTheme(context)
                  ? const Color.fromARGB(255, 66, 66, 66)
                  : const Color(0xff4b88a7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Authorized Reseler Of',
                    style: TextStyle(
                        color: isDarkTheme(context)
                            ? const Color(0xffa2a2a2)
                            : const Color.fromARGB(255, 214, 214, 214),
                        fontSize: 35,
                        fontFamily: 'MetropolisReg'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Image(
                          color: isDarkTheme(context)
                              ? const Color(0xffa2a2a2)
                              : const Color.fromARGB(255, 214, 214, 214),
                          height: 50,
                          image:
                              const AssetImage('${materials}component_14.png'),
                        ),
                      ),
                      const Text('&'),
                      Flexible(
                        child: Image(
                            color: isDarkTheme(context)
                                ? const Color(0xffa2a2a2)
                                : const Color.fromARGB(255, 214, 214, 214),
                            height: 80,
                            image: const AssetImage(
                                '${materials}component_13.png')),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Align _topText1(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.7),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox(
          width: 1200,
          child: Text(
            aboutUsTxt1,
            style: TextStyle(
                fontSize: 25,
                color: isDarkTheme(context)
                    ? Colors.white
                    : const Color.fromARGB(255, 38, 38, 38),
                fontFamily: 'MetropolisReg',
                height: 1.2),
          ),
        ),
      ),
    );
  }

  AnimatedSwitcher _mainBgImage(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: Image.asset(
        // width: double.infinity,

        key: Key(Theme.of(context).brightness.toString()),
        isDarkTheme(context)
            ? '${materials}component_8.png'
            : '${materials}component_4.png',

        // width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
