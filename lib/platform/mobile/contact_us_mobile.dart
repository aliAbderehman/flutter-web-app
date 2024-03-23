import 'package:dmd_web_01/constants.dart';
import 'package:dmd_web_01/costom_materials/footer.dart';
import 'package:dmd_web_01/costom_materials/mobile_menu.dart';
import 'package:dmd_web_01/platform/materials.dart';
import 'package:flutter/material.dart';

class ContactUsMobile extends StatefulWidget {
  const ContactUsMobile({super.key});

  @override
  State<ContactUsMobile> createState() => _ContactUsMobileState();
}

class _ContactUsMobileState extends State<ContactUsMobile>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        isDarkTheme(context)
                            ? 'assets/images/materials/noon.png'
                            : 'assets/images/materials/noon.png',
                      ))),
              height: 230,
              width: double.infinity,
              child: const SelectableText(
                'Contact Us',
                style: TextStyle(fontFamily: 'Metropolis', color: Colors.white),
              ),
            ),
            SizedBox(
              width: screenWidth(context) * 0.8,
              child: const DescriptionContainer(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Text(
                        'Get in touch',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Metropolis',
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      Text(
                        'Have a question, feedback, or just want to say hello? We\'d love to hear from you! Our team is here to assist you with any inquiries you may have regarding our services, products, or partnerships.',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'MetropolisReg',
                            height: 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const ContactsBox(),
            const SizedBox(
              height: 40,
            ),
            const SmallMobileSizeFooter(),
          ],
        ),
      ),
    );
  }
}

class ContactsBox extends StatelessWidget {
  const ContactsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return screenWidth(context) > 600
        ? const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoList(
                    icn: Icons.phone,
                    title: 'FOR FURTHER INQUIRIES',
                    text: tel,
                    isDesktop: false,
                  ),
                  InfoList(
                    icn: Icons.location_on,
                    title: 'Address Location',
                    text: address,
                    isDesktop: false,
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
                    isDesktop: false,
                  ),
                  InfoList(
                    icn: Icons.language_sharp,
                    title: 'Website Address',
                    text: webAddress,
                    isDesktop: false,
                  )
                ],
              ),
            ],
          )
        : Padding(
            padding: EdgeInsets.only(left: screenWidth(context) * 0.2),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoList(
                  icn: Icons.phone,
                  title: 'FOR FURTHER INQUIRIES',
                  text: '($tel)',
                  isDesktop: false,
                ),
                InfoList(
                  icn: Icons.location_on,
                  title: 'Address Location',
                  text: address,
                  isDesktop: false,
                ),
                InfoList(
                  icn: Icons.email,
                  title: 'Email Address',
                  text: emailAddress,
                  isDesktop: false,
                ),
                InfoList(
                  icn: Icons.language_sharp,
                  title: 'Website Address',
                  text: webAddress,
                  isDesktop: false,
                ),
              ],
            ),
          );
  }
}
