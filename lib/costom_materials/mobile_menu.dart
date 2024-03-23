import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';
import 'package:dmd_web_01/constants.dart';
import 'package:dmd_web_01/platform/materials.dart';
import 'package:dmd_web_01/theme/theme_provider.dart';

class MobileMenu extends StatelessWidget {
  const MobileMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<ThemeProvider>(builder: (context, provider, child) {
              return Switch(
                thumbIcon: MaterialStatePropertyAll(Icon(
                    Theme.of(context).brightness == Brightness.light
                        ? Icons.light_mode
                        : Icons.dark_mode)),
                activeColor: const Color.fromARGB(255, 113, 113, 113),
                activeTrackColor: Theme.of(context).colorScheme.background,
                inactiveThumbColor: const Color(0xff15688C),
                inactiveTrackColor: const Color(0xff01212E),
                trackOutlineColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.secondary,
                ),
                onChanged: (bool value) {
                  provider.changeTheme(value ? 'dark' : 'light');

                  val = value;
                },
                value: val,
              );
            }),
            const SizedBox(
              height: 10,
            ),
            HeaderTextButton(
              title: 'Home',
              rout: '',
              isPressed: () {
                Navigator.pushNamed(context, '/');
              },
              // icon: Icons.info_outline_rounded,
            ),
            const SizedBox(
              height: 10,
            ),
            HeaderTextButton(
              title: 'About',
              rout: '',
              isPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              // icon: Icons.info_outline_rounded,
            ),
            const SizedBox(
              height: 10,
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
              // icon: Icons.language,
            ),
            const SizedBox(
              height: 10,
            ),
            HeaderTextButton(
              title: 'Our Works',
              rout: '/our_work_page',
              isPressed: () {
                Navigator.pushNamed(context, '/our_work_page');
              },
              // icon: Icons.work,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 120,
              child: ContactButton(
                  child: const Center(
                      child: Text(
                    'CONTACTS',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )),
                  onTap: () {
                    Navigator.pushNamed(context, '/contact_us_page');
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class MyAnimatedIcon extends StatefulWidget {
  const MyAnimatedIcon({super.key, required this.controller});
  final AnimationController controller;

  @override
  State<MyAnimatedIcon> createState() => _MyAnimatedIconState();
}

class _MyAnimatedIconState extends State<MyAnimatedIcon>
    with TickerProviderStateMixin {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
  }

  final OverlayPortalController menuOverlayController =
      OverlayPortalController()..show();
  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      overlayChildBuilder: (context) {
        return Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
                onTap: () {
                  if (Scaffold.of(context).isEndDrawerOpen &&
                      _isPlaying == true) {
                    Scaffold.of(context).closeEndDrawer();
                    widget.controller.reverse();
                    _isPlaying = false;
                    //close drawer, if drawer is open
                  } else {
                    Scaffold.of(context).openEndDrawer();
                    _isPlaying = true;
                    widget.controller.forward();
                    //open drawer, if drawer is closed
                  }
                },
                child: AnimatedIcon(
                    color: Theme.of(context).colorScheme.tertiary,
                    icon: AnimatedIcons.menu_close,
                    progress: widget.controller)),
          ),
        );
      },
      controller: menuOverlayController,
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.controller,
  });
  final AnimationController controller;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 3,
      leading: IconButton(
        iconSize: 20,
        hoverColor: Colors.transparent,
        icon: Image.asset(mainLogo),
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
      ),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          // blendMode: BlendMode.colorBurn,
          child: Container(
            color: isDarkTheme(context)
                ? const Color.fromARGB(50, 0, 0, 0)
                : const Color.fromARGB(29, 5, 119, 212),
          ),
        ),
      ),
      actions: [
        MyAnimatedIcon(
          controller: controller,
        ),
      ],
    );
  }
}

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({super.key, required this.screenWidth});
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: 200,
      backgroundColor: Colors.transparent,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: const MobileMenu(),
        ),
      ),
    );
  }
}
