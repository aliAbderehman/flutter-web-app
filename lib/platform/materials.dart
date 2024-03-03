import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:popover/popover.dart';
import 'package:uhh/constants.dart';
import 'package:uhh/theme/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

// bool val = false;
var brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool val = brightness == Brightness.dark;

class MainHeader extends StatefulWidget {
  const MainHeader({super.key});

  @override
  State<MainHeader> createState() => _MainHeaderState();
}

class _MainHeaderState extends State<MainHeader> {
  @override
  Widget build(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool val = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              iconSize: 50,
              hoverColor: const Color(0xff1e1e24),
              icon: Image.asset(
                'assets/images/materials/main_logo_02.png',
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ),
          ////

          BlurryContainer(
            elevation: 3,
            blur: 4,
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(50, 0, 0, 0)
                : const Color.fromARGB(29, 5, 119, 212),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Consumer<ThemeProvider>(
                      builder: (context, provider, child) {
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
                ),
                HeaderTextButton(
                  title: 'Home',
                  rout: '',
                  isPressed: () {
                    print('whaaat');
                    Navigator.pushNamed(context, '/');
                  },
                ),
                HeaderTextButton(
                  title: 'About',
                  rout: '',
                  isPressed: () {
                    print('whaaat');
                    Navigator.pushNamed(context, '/about');
                  },
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
                        backgroundColor:
                            Theme.of(context).colorScheme.background);
                  },
                ),
                HeaderTextButton(
                  title: 'Our Works',
                  rout: '/our_work_page',
                  isPressed: () {
                    Navigator.pushNamed(context, '/our_work_page');
                  },
                ),
                ContactButton(
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'CONTACTS',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    onTap: () {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/homepage', (Route route) => false);
          },
          child: Text(
            'English',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        TextButton(
          onPressed: () {
            var snackBar = const SnackBar(
                backgroundColor: Color.fromARGB(255, 220, 75, 7),
                content: SelectableText(
                  'Not Available At the Moment',
                  style: TextStyle(color: Colors.white),
                ));
            // Step 3
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text(
            'Amharic',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class MobileMainHeader extends StatelessWidget {
  const MobileMainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.menu));
  }
}

class HeaderTextButton extends StatefulWidget {
  const HeaderTextButton({
    super.key,
    required this.title,
    required this.rout,
    required this.isPressed,
  });

  final String title;
  final String rout;
  final VoidCallback isPressed;

  @override
  State<HeaderTextButton> createState() => _HeaderTextButtonState();
}

class _HeaderTextButtonState extends State<HeaderTextButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: widget.title == 'Language'
              ? () {
                  showPopover(
                      context: context,
                      bodyBuilder: (context) => const MenuItems(),
                      height: 100,
                      width: 150,
                      backgroundColor:
                          Theme.of(context).colorScheme.background);
                }
              : widget.isPressed,
          // if (title == 'Language') {
          //   showPopover(
          //       context: context,
          //       bodyBuilder: (context) => MenuItems(),
          //       height: 100,
          //       width: 150,
          //       backgroundColor: Theme.of(context).colorScheme.background);
          // }
          // },
          child: Text(widget.title)),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyle? style;
  final Gradient? gradient;
  final double thickness;

  const MyOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.gradient,
    this.thickness = 2,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: gradient),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(thickness),
        child: OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: child,
        ),
      ),
    );
  }
}

class HeaderActions extends StatelessWidget {
  HeaderActions({
    super.key,
    required this.overlayController,
  });
  OverlayPortalController overlayController;
  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: overlayController,
      overlayChildBuilder: (BuildContext context) {
        return const MainHeader();
      },
      // child: Text('data'),
    );
  }
}

class SocialMedias extends StatefulWidget {
  SocialMedias({super.key, required this.socialMediasController});
  OverlayPortalController socialMediasController;

  @override
  State<SocialMedias> createState() => _SocialMediasState();
}

class _SocialMediasState extends State<SocialMedias> {
  // final Widget displayWidget;
  Widget focused = const DisplayWidget();

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: widget.socialMediasController,
      overlayChildBuilder: (BuildContext context) {
        return Align(
          alignment: Alignment.centerLeft,
          child: FocusableActionDetector(
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  focused = const socialMediasHovered();
                });
              },
              onExit: (event) {
                setState(() {
                  focused = const DisplayWidget();
                });
              },
              cursor: SystemMouseCursors.basic,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                // transitionBuilder: (Widget child, Animation<double> animation) {
                //   return ScaleTransition(scale: animation, child: child);
                // },
                child: focused,
              ),
            ),
          ),
        );
      },
    );
  }
}

class socialMediasHovered extends StatefulWidget {
  const socialMediasHovered({
    super.key,
  });

  @override
  State<socialMediasHovered> createState() => _socialMediasHoveredState();
}

// String icn = fbInactive;

class _socialMediasHoveredState extends State<socialMediasHovered> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(30),
          ),
          color: Theme.of(context).colorScheme.tertiary,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(83, 0, 0, 0),
                offset: Offset(5, 3),
                blurRadius: 3),
          ],
        ),
        height: 150,
        width: 50,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(icon: fbInactive),
            SocialButton(icon: waInactive),
            SocialButton(icon: tgInactive),
          ],
        ));
  }
}

class SocialButton extends StatefulWidget {
  const SocialButton({super.key, required this.icon});
  // final String active;
  final String icon;

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  String? icn;

  @override
  void initState() {
    icn = widget.icon;
    super.initState();
  }

  Color icnColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            // icn = widget.active;
            // print('what is going on');
            icnColor = Theme.of(context).brightness == Brightness.dark
                ? icnColor = const Color.fromARGB(255, 0, 195, 255)
                : Colors.amber;
          });
        },
        onExit: (event) {
          setState(() {
            // icn = widget.inactive;
            icnColor = Colors.black;
          });
        },
        child: GestureDetector(
          onTap: () {
            // print('tapped');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              icn!,
              scale: 1.5,
              color: icnColor,
            ),
          ),
        ),
      ),
    );
  }
}

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 15,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(30),
        ),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(83, 0, 0, 0),
              offset: Offset(5, 3),
              blurRadius: 3),
        ],
        color: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }
}

class FooterContainer extends StatelessWidget {
  const FooterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlurryContainer(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(50, 0, 0, 0)
          : const Color.fromARGB(57, 5, 119, 212),
      // decoration: BoxDecoration(
      //   borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      //   image: const DecorationImage(
      //     image: AssetImage(
      //       'assets/images/materials/fff.png',
      //     ),
      //     alignment: Alignment(0.95, 0),
      //     scale: 2,
      //   ),
      //   gradient: Theme.of(context).brightness == Brightness.dark
      //       ? const LinearGradient(
      //           colors: [
      //             Color.fromARGB(255, 24, 24, 24),
      //             Color.fromARGB(255, 0, 0, 0),
      //           ],
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //         )
      //       : const LinearGradient(
      //           colors: [
      //             Color(0xff115471),
      //             Color(0xff072939),
      //           ],
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //         ),
      //   boxShadow: const [
      //     BoxShadow(
      //         color: Color.fromARGB(83, 0, 0, 0),
      //         offset: Offset(5, -9),
      //         blurRadius: 10,
      //         spreadRadius: 5),
      //   ],
      // ),
      width: double.infinity,
      height: screenHeight * 0.2,
      // alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SelectableText(
                'Noon Import and Export 2024. Addis Ababa, Ethiopia\n'
                'contact@noonie.com\n'
                '+251-91-10-90-000',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(right: 60),
          //   child: Image(image: AssetImage('assets/images/materials/fff.png')),
          // )
        ],
      ),
    );
  }
}

// class BigContactButton extends StatefulWidget {
//   const BigContactButton({
//     super.key,
//   });

//   @override
//   State<BigContactButton> createState() => _BigContactButtonState();
// }

// class _BigContactButtonState extends State<BigContactButton> {
//   @override
//   Widget build(BuildContext context) {
//     return FocusableActionDetector(
//       // autofocus: true,

//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         onHover: (event) {
//           setState(() {
//             darkButton = 'assets/images/buttons/button_hovered_black.png';
//             lightButton = 'assets/images/buttons/button_hovered.png';
//           });
//         },
//         onExit: (event) {
//           setState(() {
//             lightButton = 'assets/images/buttons/contact_b_light_02.png';
//             darkButton = 'assets/images/buttons/contact_b_dark_02.png';
//           });
//         },
//         child: GestureDetector(
//           onTap: () {
//             showPopover(
//                 context: context,
//                 bodyBuilder: (context) => Center(
//                         child: SelectableText(
//                       '+2513325666',
//                       style: Theme.of(context).textTheme.bodyLarge,
//                     )),
//                 height: 100,
//                 width: 200,
//                 backgroundColor: Theme.of(context).colorScheme.tertiary,
//                 direction: PopoverDirection.top);
//           },
//           child: Image.asset(
//             Theme.of(context).brightness == Brightness.dark
//                 ? darkButton
//                 : lightButton,
//             scale: 1.5,
//           ),
//         ),
//       ),
//     );
//   }
// }

class AvatorImages extends StatelessWidget {
  const AvatorImages({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: avatorBgColors(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              image,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SelectableText(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class ContactButton extends StatefulWidget {
  const ContactButton({super.key, required this.child, required this.onTap});
  final Widget child;
  final Function()? onTap;

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderOnForeground: false,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(50.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        onHover: (value) {
          if (value) {
            setState(() {
              isHovered = true;
            });
          } else {
            setState(() {
              isHovered = false;
            });
          }
        },

        // overlayColor: const MaterialStatePropertyAll(Colors.green),
        child: Container(
          decoration: BoxDecoration(
            gradient: Theme.of(context).brightness == Brightness.dark
                ? isHovered
                    ? const LinearGradient(
                        colors: [
                          Color(0xffF8C30C),
                          Color(0xffF8C30C),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                    : const LinearGradient(
                        // transform: GradientRotation(-6.8),
                        colors: [
                            Color(0xffF8C30C),
                            Color.fromARGB(0, 0, 0, 0),
                          ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)
                : isHovered
                    ? const LinearGradient(
                        colors: [
                          Color(0xff2ADAFF),
                          Color(0xff2ADAFF),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                    : const LinearGradient(
                        // transform: GradientRotation(-6.8),
                        colors: [
                            Color(0xff2ADAFF),
                            Color.fromARGB(0, 0, 0, 0),
                          ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight),
            borderRadius: BorderRadius.circular(50),
          ),
          // height: 100,
          // width: 300,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : const Color(0xff094762),
                  borderRadius: BorderRadius.circular(50)),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class MobileAppBar extends StatefulWidget {
  const MobileAppBar(
      {super.key, this.scaffoldKey, required this.menuOverlayController});
  final scaffoldKey;
  final OverlayPortalController menuOverlayController;

  @override
  State<MobileAppBar> createState() => MobileAppBarState();
}

class MobileAppBarState extends State<MobileAppBar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = false;

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
    return AppBar(
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
                      if (widget.scaffoldKey.currentState!.isEndDrawerOpen &&
                          _isPlaying == true) {
                        widget.scaffoldKey.currentState!.closeEndDrawer();
                        _controller.reverse();
                        _isPlaying = false;
                        //close drawer, if drawer is open
                      } else {
                        widget.scaffoldKey.currentState!.openEndDrawer();
                        _isPlaying = true;
                        _controller.forward();
                        //open drawer, if drawer is closed
                      }
                    },
                    child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close, progress: _controller)),
              ),
            );
          },
          controller: widget.menuOverlayController,
        )
      ],
    );
  }
}
