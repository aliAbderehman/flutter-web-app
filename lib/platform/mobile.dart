import 'dart:ui';

import 'package:animate_icons/animate_icons.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

import '../swiper_list.dart';
import '../theme/theme_provider.dart';
import 'materials.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();
bool val = brightness == Brightness.dark;

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> with TickerProviderStateMixin {
  final OverlayPortalController overlayPortalController =
      OverlayPortalController()..show();

  final OverlayPortalController menuOverlayController =
      OverlayPortalController()..show();

  final OverlayPortalController contactOverLayController =
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

  final AnimateIconController animateIconController = AnimateIconController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: IconButton(
          iconSize: 40,
          hoverColor: const Color(0xff1e1e24),
          icon: Image.asset(
            'assets/images/materials/main_logo_02.png',
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
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
      // floatingActionButton: const ContactsOverlay(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: Theme.of(context).brightness == Brightness.dark
                        ? const ColorFilter.mode(
                            Color.fromARGB(187, 0, 0, 0), BlendMode.multiply)
                        : const ColorFilter.mode(
                            Color.fromARGB(94, 0, 0, 0), BlendMode.multiply),
                    fit: BoxFit.cover,
                    image: const AssetImage(
                        'assets/images/materials/container_background.jpg'))),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: 100,
                        width: 1200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Center(
                                child: Swiper(
                                  duration: 1000,
                                  autoplay: true,
                                  curve: Curves.fastEaseInToSlowEaseOut,
                                  autoplayDisableOnInteraction: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50),
                                        child: FittedBox(
                                          alignment: Alignment.centerRight,
                                          child: mobileSwipeList[index],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: mobileSwipeList.length,
                                  control: SwiperControl(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ),
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Welcome to Noon\n Your Global Import and Export Partner',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Why Choose Us?',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: WhyUsDescription(
                description:
                    'With years of experience in international trade, we possess the expertise and insights to address your unique import and export requirements effectively.',
                title: 'Experience: ',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: WhyUsDescription(
                description:
                    'Count on us for transparent and trustworthy services. We prioritize integrity and accountability in every business relationship we build.',
                title: 'Reliability: ',
              ),
            ),
          ),
          ContactsMobileButton(
            overlayPortalController: contactOverLayController,
          ),
        ],
      ),
    );
  }
}

class WhyUsDescription extends StatelessWidget {
  const WhyUsDescription({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 20,
            color: Theme.of(context).colorScheme.secondary),
        text: title,
        children: [
          const WidgetSpan(
              child: SizedBox(
            height: 35,
          )),
          TextSpan(
            text: description,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
      // textAlign: TextAlign.center,

      // "Welcome to Noon Import and Export,\n"

      // textAlign: TextAlign.center,
      // style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class ContactsMobileButton extends StatelessWidget {
  const ContactsMobileButton({
    super.key,
    required this.overlayPortalController,
  });
  final OverlayPortalController overlayPortalController;

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
        controller: overlayPortalController,
        overlayChildBuilder: (BuildContext context) {
          return FabCircularMenuPlus(
              fabColor: Colors.transparent,
              alignment: Alignment.bottomRight,
              animationDuration: const Duration(milliseconds: 500),
              ringColor: Colors.transparent,
              fabSize: 50,
              ringDiameter: 150,
              ringWidth: 2,
              fabCloseIcon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: const Padding(
                    padding: EdgeInsets.all(8.0), child: Icon(Icons.close)),
              ),
              fabOpenIcon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/materials/contact_mail.png',
                    color: Colors.white,
                  ),
                ),
              ),
              children: [
                IconButton(
                    color: Colors.amber,
                    onPressed: () {},
                    icon: Image.asset(
                        'assets/images/materials/contact_mail.png')),
                IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
              ]);
        });
  }
}

class MobileMenu extends StatelessWidget {
  const MobileMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<ThemeProvider>(builder: (context, provider, child) {
              return Switch(
                activeThumbImage: const AssetImage(
                    'assets/images/materials/dark_mode_02.png'),
                inactiveThumbImage: const AssetImage(
                    'assets/images/materials/light_mode_02.png'),
                activeColor: const Color(0xff000000),
                activeTrackColor: const Color(0xff4D4D4D),
                inactiveThumbColor: const Color(0xff15688C),
                inactiveTrackColor: const Color(0xff01212E),
                onChanged: (bool value) {
                  provider.changeTheme(value ? 'dark' : 'light');

                  val = value;
                },
                value: val,
              );
            }),
            const Divider(
              indent: 30,
              endIndent: 30,
            ),
            HeaderTextButton(
              title: 'About',
              rout: '',
              isPressed: () {
                print('whaaat');
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(
              indent: 30,
              endIndent: 30,
            ),
            HeaderTextButton(
              title: 'Language',
              rout: '',
              isPressed: () {
                showPopover(
                    context: context,
                    bodyBuilder: (context) => const MenuItems(),
                    height: 100,
                    width: 150,
                    backgroundColor: Theme.of(context).colorScheme.background);
              },
            ),
            const Divider(
              indent: 30,
              endIndent: 30,
            ),
            HeaderTextButton(
              title: 'Our Works',
              rout: '/our_work_page',
              isPressed: () {
                Navigator.pushNamed(context, '/our_work_page');
              },
            ),
            const Divider(
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              width: 150,
              child: ContactButton(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'CONTACTS',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                  onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
