import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uhh/constants.dart';
import 'package:uhh/costom_materials/footer.dart';
import 'package:uhh/costom_materials/mobile_menu.dart';
import 'package:uhh/platform/materials.dart';
import 'package:url_launcher/url_launcher.dart';

import 'mobile/mobile.dart';

class MobileContactUs extends StatefulWidget {
  const MobileContactUs({super.key});

  @override
  State<MobileContactUs> createState() => _MobileContactUsState();
}

class _MobileContactUsState extends State<MobileContactUs>
    with TickerProviderStateMixin {
  // Initialize overlay controllers when the state is initialize
  final OverlayPortalController menuOverlayController =
      OverlayPortalController()..show();

  bool _isPlaying = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the screen width using MediaQuery.

    // Construct the scaffold containing the desktop UI components.

    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
////
        onEndDrawerChanged: (isOpened) {
          if (!isOpened) {
            _controller.reverse();
            _isPlaying = false;
          }
        },
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: SizedBox(
            height: 20,
            child: IconButton(
              iconSize: 20,
              hoverColor: const Color(0xff1e1e24),
              icon: Image.asset(scale: 3, mainLogo),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: const Color.fromARGB(25, 0, 0, 0),
              ),
            ),
          ),
          actions: [
            OverlayPortal(
              overlayChildBuilder: (context) {
                return Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          if (scaffoldKey.currentState!.isEndDrawerOpen &&
                              _isPlaying == true) {
                            scaffoldKey.currentState!.closeEndDrawer();
                            _controller.reverse();
                            _isPlaying = false;
                            //close drawer, if drawer is open
                          } else {
                            scaffoldKey.currentState!.openEndDrawer();
                            _isPlaying = true;
                            _controller.forward();
                            //open drawer, if drawer is closed
                          }
                        },
                        child: AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            color: Theme.of(context).colorScheme.tertiary,
                            progress: _controller)),
                  ),
                );
              },
              controller: menuOverlayController,
            )
          ],
        ),
        // drawerEnableOpenDragGesture: false,
        endDrawer: Drawer(
          elevation: 0,
          width: 200,
          backgroundColor: Colors.transparent,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: const MobileMenu(),
            ),
          ),
        ),

        ///

        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.8,
                width: screenWidth,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          isDarkTheme
                              ? contactUsBgImgDark
                              : contactUsBgImgLight,
                          // width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment(-0.94, -0.65),
                      child: Text(
                        'Get in touch',
                        style:
                            TextStyle(fontSize: 30, fontFamily: 'Metropolis'),
                      ),
                    ),
                    const Align(
                      alignment: Alignment(-0.75, -0.5),
                      child: Text(
                        'Have a question, feedback, or just want to say hello? \nWe\'d love to hear from you! Our team is here to assist \nyou with any inquiries you may have regarding our \nservices, products, or partnerships.',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'MetropolisReg',
                            height: 1),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 1),
                      child: SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    // height: 350,
                                    // width: 300,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                    child: ListTile(
                                      titleAlignment:
                                          ListTileTitleAlignment.center,
                                      contentPadding:
                                          const EdgeInsets.only(left: 30),
                                      leading: const Icon(
                                        Icons.phone,
                                        size: 40,
                                      ),
                                      title: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          LinkLaunch(
                                            path: tel.toString(),
                                            scheme: 'tel',
                                          ),
                                          LinkLaunch(
                                            path: tel.toString(),
                                            scheme: 'tel',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    // height: 350,
                                    // width: 300,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                    child: ListTile(
                                      titleAlignment:
                                          ListTileTitleAlignment.center,
                                      contentPadding:
                                          const EdgeInsets.only(left: 30),
                                      leading: Image.asset(
                                        mail,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      title: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          LinkLaunch(
                                            path: emailAddress.toString(),
                                            scheme: 'mailto',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    // height: 350,
                                    // width: 300,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                    child: ListTile(
                                      titleAlignment:
                                          ListTileTitleAlignment.center,
                                      contentPadding:
                                          const EdgeInsets.only(left: 30),
                                      leading: Image.asset(
                                        social,
                                        color: isDarkTheme
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ListTile(
                                            titleAlignment:
                                                ListTileTitleAlignment.center,
                                            contentPadding:
                                                const EdgeInsets.only(left: 30),
                                            onTap: () {
                                              launchUrl(telegramUrl);
                                            },
                                            leading: Image.asset(
                                              tgInactive,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              scale: 1.5,
                                            ),
                                            title: Text(
                                              'Telegram',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary),
                                            ),
                                          ),
                                          ListTile(
                                            titleAlignment:
                                                ListTileTitleAlignment.center,
                                            contentPadding:
                                                const EdgeInsets.only(left: 30),
                                            onTap: () {
                                              launchUrl(facebookUrl);
                                            },
                                            leading: Image.asset(
                                              fbInactive,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              scale: 1.5,
                                            ),
                                            title: Text(
                                              'Facebook',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Text(
                  'Feel free to reach out to us via the contact form below, and we\'ll get back to you as soon as possible. Alternatively, you can connect with us through phone or email using the contact details provided',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: FooterContainer(),
              )
            ],
          ),
        ));
  }
}

class LinkLaunch extends StatelessWidget {
  const LinkLaunch({
    super.key,
    // required this.scheme,
    required this.path,
    required this.scheme,
  });
  final String scheme;
  final String path;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent)),
        onPressed: () async {
          final url = Uri(scheme: scheme, path: path);
          if (await canLaunchUrl(url)) {
            launchUrl(url);
          }
        },
        child: Text(
          path.toString(),
          style: TextStyle(
              fontSize: 20, color: Theme.of(context).colorScheme.tertiary),
        ));
  }
}
