import 'package:flutter/material.dart';
import 'package:dmd_web_01/constants.dart';
import 'package:dmd_web_01/costom_materials/footer.dart';
import 'package:dmd_web_01/costom_materials/mobile_menu.dart';
import 'package:dmd_web_01/platform/materials.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsDesktop extends StatefulWidget {
  const ContactUsDesktop({super.key});

  @override
  State<ContactUsDesktop> createState() => _ContactUsDesktopState();
}

class _ContactUsDesktopState extends State<ContactUsDesktop>
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
  Widget build(BuildContext context) {
    // Hide overlays if the screen width is less than 700.
    adjustScreen(
        screenWidth: screenWidth(context),
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
        endDrawer: screenWidth(context) < 760
            ? CustomEndDrawer(
                screenWidth: screenWidth(context),
              )
            : null,
        appBar: screenWidth(context) < 760
            ? CustomAppBar(controller: _controller)
            : null,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderActions(overlayController: _overlayController),
              SocialMedias(socialMediasController: _socialMediasController),
              SizedBox(
                height: 500,
                child: Stack(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: Image.asset(
                        key: Key(Theme.of(context).brightness.toString()),
                        isDarkTheme(context)
                            ? '${materials}component_8.png'
                            : '${materials}component_4.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Align(
                      alignment: Alignment(0, 1),
                      child: GetInTouchWidget(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              ResponsiveContactWidgets(
                screenWidth: screenWidth(context),
              ),
              const SizedBox(
                height: 100,
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

class ResponsiveContactWidgets extends StatefulWidget {
  const ResponsiveContactWidgets({super.key, required this.screenWidth});
  final double screenWidth;

  @override
  State<ResponsiveContactWidgets> createState() =>
      _ResponsiveContactWidgetsState();
}

class _ResponsiveContactWidgetsState extends State<ResponsiveContactWidgets> {
  @override
  Widget build(BuildContext context) {
    return screenWidth(context) > 1180
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InfoList(
                icn: Icons.phone,
                title: 'FOR FURTHER INQUIRIES',
                text: tel,
                isDesktop: true,
              ),
              InfoList(
                icn: Icons.location_on,
                title: 'Address Location',
                text: address,
                isDesktop: true,
              ),
              InfoList(
                icn: Icons.email,
                title: 'Email Address',
                text: emailAddress,
                isDesktop: true,
              ),
              InfoList(
                icn: Icons.language_sharp,
                title: 'Website Address',
                text: webAddress,
                isDesktop: true,
              )
            ],
          )
        : const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoList(
                    icn: Icons.phone,
                    title: 'FOR FURTHER INQUIRIES',
                    text: tel,
                    isDesktop: true,
                  ),
                  InfoList(
                    icn: Icons.location_on,
                    title: 'Address Location',
                    text: address,
                    isDesktop: true,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoList(
                    icn: Icons.email,
                    title: 'Email Address',
                    text: emailAddress,
                    isDesktop: true,
                  ),
                  InfoList(
                    icn: Icons.language_sharp,
                    title: 'Website Address',
                    text: webAddress,
                    isDesktop: true,
                  )
                ],
              ),
            ],
          );
  }
}

class GetInTouchWidget extends StatelessWidget {
  const GetInTouchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(192, 0, 0, 0),
            offset: Offset(5, 5),
            spreadRadius: 2,
            blurRadius: 20,
          )
        ],
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: const Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: [
            Text(
              'Get in touch',
              style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Metropolis',
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Text(
              'Have a question, feedback, or just want to say hello? \nWe\'d love to hear from you! Our team is here to assist \nyou with any inquiries you may have regarding our \nservices, products, or partnerships.',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'MetropolisReg',
                  height: 1),
            ),
          ],
        ),
      ),
    );
  }
}

class AddresBox extends StatelessWidget {
  const AddresBox({super.key, required this.children});
  final Widget children;

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 350,
        // width: 300,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(192, 0, 0, 0),
              offset: Offset(5, 5),
              spreadRadius: 2,
              blurRadius: 20,
            )
          ],
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: children);
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
