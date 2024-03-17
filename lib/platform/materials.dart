import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:popover/popover.dart';
import 'package:uhh/constants.dart';
import 'package:uhh/theme/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
              iconSize: 10,
              hoverColor: Colors.transparent,
              icon: SizedBox(
                height: 50,
                child: Image.asset(
                  mainLogo,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ),
          ////

          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: BlurryContainer(
              key: Key(Theme.of(context).brightness.toString()),
              height: 50,
              // width: 400,
              elevation: 3,
              blur: 4,
              color: isDarkTheme(context)
                  ? const Color.fromARGB(50, 0, 0, 0)
                  : const Color.fromARGB(29, 5, 119, 212),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Consumer<ThemeProvider>(
                        builder: (context, provider, child) {
                      return AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: Switch(
                          key: Key(Theme.of(context).brightness.toString()),
                          thumbIcon: MaterialStatePropertyAll(Icon(
                              Theme.of(context).brightness == Brightness.light
                                  ? Icons.light_mode
                                  : Icons.dark_mode)),
                          activeColor: const Color.fromARGB(255, 113, 113, 113),
                          activeTrackColor:
                              Theme.of(context).colorScheme.background,
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
                        ),
                      );
                    }),
                  ),
                  HeaderTextButton(
                    title: 'Home',
                    rout: '',
                    isPressed: () {
                      // print('whaaat');
                      Navigator.pushNamed(context, '/');
                    },
                    // icon: Icons.home_outlined,
                  ),
                  HeaderTextButton(
                    title: 'About',
                    rout: '',
                    isPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    // icon: Icons.info_outline,
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
                    // icon: Icons.language_rounded,
                  ),
                  HeaderTextButton(
                    title: 'Our Works',
                    rout: '/our_work_page',
                    isPressed: () {
                      Navigator.pushNamed(context, '/our_work_page');
                    },
                    // icon: Icons.work,
                  ),
                  ContactButton(
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'CONTACTS',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/contact_us_page');
                      })
                ],
              ),
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
                .pushNamedAndRemoveUntil('/', (Route route) => false);
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
    // required this.icon,
  });

  final String title;
  final String rout;
  final VoidCallback isPressed;
  // final IconData icon;

  @override
  State<HeaderTextButton> createState() => _HeaderTextButtonState();
}

class _HeaderTextButtonState extends State<HeaderTextButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
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
          child: Row(
            children: [
              Text(widget.title),
            ],
          )),
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
  const HeaderActions({
    super.key,
    required this.overlayController,
  });
  final OverlayPortalController overlayController;
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
  const SocialMedias({super.key, required this.socialMediasController});
  final OverlayPortalController socialMediasController;

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
                  focused = const SocialMediasHovered();
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

class SocialMediasHovered extends StatefulWidget {
  const SocialMediasHovered({
    super.key,
  });

  @override
  State<SocialMediasHovered> createState() => _SocialMediasHoveredState();
}

// String icn = fbInactive;

class _SocialMediasHoveredState extends State<SocialMediasHovered> {
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
            GestureDetector(
                onTap: () async {
                  final url = Uri(scheme: 'mailto', path: emailAddress);
                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  }
                },
                child: const SocialButton(icon: '${materials}email.png')),
            GestureDetector(
                onTap: () {
                  launchUrl(whatsappUrl);
                },
                child: const SocialButton(icon: '${materials}whatsapp.png')),
            GestureDetector(
                onTap: () {
                  launchUrl(telegramUrl);
                },
                child: const SocialButton(icon: '${materials}telegram.png')),
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

  Color icnColor = const Color.fromARGB(255, 57, 85, 104);

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
            icnColor = const Color.fromARGB(255, 57, 85, 104);
          });
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
            fontSize: 25,
            color: Theme.of(context).colorScheme.secondary),
        text: title,
        children: [
          const WidgetSpan(
              child: SizedBox(
            height: 30,
          )),
          TextSpan(
            text: description,
            style: Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).textTheme.bodyMedium
                : TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontFamily: 'MetropolisReg',
                    fontSize: 25,
                  ),
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
          radius: 85,
          child: CircleAvatar(
            radius: 80,
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
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: Container(
            key: Key(Theme.of(context).brightness.toString()),
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
      ),
    );
  }
}

// class MobileAppBar extends StatefulWidget {
//   const MobileAppBar(
//       {super.key,  required this.menuOverlayController});
//   // final scaffoldKey;
//   final OverlayPortalController menuOverlayController;

//   @override
//   State<MobileAppBar> createState() => MobileAppBarState();
// }

// class MobileAppBarState extends State<MobileAppBar>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   bool _isPlaying = false;

//   @override
//   void initState() {
//     _controller = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 500));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       title: IconButton(
//         iconSize: 40,
//         hoverColor: const Color(0xff1e1e24),
//         icon: Image.asset(mainLogo),
//         onPressed: () {
//           Navigator.of(context).pushNamed('/');
//         },
//       ),
//       flexibleSpace: ClipRect(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//           child: Container(
//             color: const Color.fromARGB(25, 0, 0, 0),
//           ),
//         ),
//       ),
//       actions: [
//         OverlayPortal(
//           overlayChildBuilder: (context) {
//             return Align(
//               alignment: Alignment.topRight,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                     onTap: () {
//                       if (widget.scaffoldKey.currentState!.isEndDrawerOpen &&
//                           _isPlaying == true) {
//                         widget.scaffoldKey.currentState!.closeEndDrawer();
//                         _controller.reverse();
//                         _isPlaying = false;
//                         //close drawer, if drawer is open
//                       } else {
//                         widget.scaffoldKey.currentState!.openEndDrawer();
//                         _isPlaying = true;
//                         _controller.forward();
//                         //open drawer, if drawer is closed
//                       }
//                     },
//                     child: AnimatedIcon(
//                         icon: AnimatedIcons.menu_close, progress: _controller)),
//               ),
//             );
//           },
//           controller: widget.menuOverlayController,
//         )
//       ],
//     );
//   }
// }

class InfoList extends StatelessWidget {
  const InfoList({
    super.key,
    required this.icn,
    required this.title,
    required this.text,
  });

  final IconData icn;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(
                0xffa2a2a2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              color: Color(
                isDarkTheme(context) ? 0xffa2a2a2 : 0xFF434343,
              ),
              icn,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  height: 0,
                  color: Color(
                    isDarkTheme(context) ? 0xffa2a2a2 : 0xFF434343,
                  ),
                ),
              ),
              SelectableText(
                text,
                style: TextStyle(
                    color: Color(
                      isDarkTheme(context) ? 0xffa2a2a2 : 0xFF434343,
                    ),
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(192, 0, 0, 0),
            offset: Offset(5, 5),
            spreadRadius: 2,
            blurRadius: 20,
          )
        ],
        // border: Border.all(
        //   color: Colors.white,
        // ),
        color: isDarkTheme(context)
            ? const Color(0xff1E1E24)
            : const Color(0xff0B394E),
      ),
      duration: const Duration(seconds: 1),
      child: Center(
        child: child,
      ),
    );
  }
}

class BackgroundImage01 extends StatelessWidget {
  const BackgroundImage01({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      // key: Key(Theme.of(context).brightness.toString()),
      child: Image.asset(
        key: Key(Theme.of(context).brightness.toString()),
        isDarkTheme(context)
            ? 'assets/images/materials/bg_002.png'
            : 'assets/images/materials/blue_bg_002.png',
      ),
    );
  }
}
