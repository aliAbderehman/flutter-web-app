import 'package:flutter/material.dart';

import 'package:dmd_web_01/costom_materials/footer.dart';
import 'package:dmd_web_01/costom_materials/mobile_menu.dart';

import '../../constants.dart';
import '../materials.dart';

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
      endDrawer: screenWidth < 760
          ? CustomEndDrawer(
              screenWidth: screenWidth,
            )
          : null,
      appBar: screenWidth < 760 ? CustomAppBar(controller: _controller) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    isDarkTheme(context)
                        ? '${materials}component_8.png'
                        : '${materials}component_4.png',
                  ),
                ),
              ),
              child: const SelectableText(
                'About Us',
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Metropolis',
                    color: Colors.white),
              ),
            ),
            SizedBox(
              width: 850,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderActions(overlayController: _overlayController),
                  SocialMedias(socialMediasController: _socialMediasController),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: SelectableText(
                      'Welcome to $companyNameShort - your trusted partner in sourcing top-quality electrical equipment, IT solutions, appliances, and premium coffee from around the globe. At $companyNameShort, we\'re passionate about delivering excellence in every aspect of our business, from product selection to customer service.',
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'MetropolisReg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SelectableText(
                      'Our Mission',
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'MetropolisReg',
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: SelectableText(
                      'At $companyNameShort, our mission is simple: to empower individuals and businesses with innovative, reliable, and sustainable solutions that enhance their lives and drive success. We strive to be a catalyst for positive change, leveraging our expertise and global network to deliver unparalleled value to our customers and partners.',
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'MetropolisReg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text.rich(
                      TextSpan(
                        text: 'What Sets Us Apart\n',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'MetropolisReg',
                            color: Theme.of(context).colorScheme.tertiary),
                        children: aboutUsTexts1.map((e) {
                          return WidgetSpan(
                              child: ListBody(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: e.title,
                                  style: const TextStyle(
                                      fontFamily: 'Metropolis', fontSize: 20),
                                  children: [
                                    TextSpan(
                                      text: '${e.content}\n',
                                      style: const TextStyle(
                                          fontFamily: 'MetropolisReg',
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Our Values\n',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'MetropolisReg',
                            color: Theme.of(context).colorScheme.tertiary),
                        children: aboutUsTexts2.map((e) {
                          return WidgetSpan(
                              child: ListBody(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: e.title,
                                  style: const TextStyle(
                                      fontFamily: 'Metropolis', fontSize: 20),
                                  children: [
                                    TextSpan(
                                      text: e.content,
                                      style: const TextStyle(
                                          fontFamily: 'MetropolisReg',
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: SelectableText(
                      'Get in touch',
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'MetropolisReg',
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: SelectableText(
                      'Whether you\'re looking for the latest IT equipment, stylish appliances for your home, or premium coffee to delight your senses, $companyNameShort is here to serve you. Join us on our journey as we redefine excellence in product sourcing and customer service.',
                      style:
                          TextStyle(fontFamily: 'MetropolisReg', fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          width: 200,
                          child: ContactButton(
                            onTap: () {
                              Navigator.pushNamed(context, '/contact_us_page');
                            },
                            child: const Text(
                              'Contact Us',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Metropolis'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          width: 200,
                          child: ContactButton(
                            onTap: () {
                              Navigator.pushNamed(context, '/our_work_page');
                            },
                            child: const Text(
                              'Our Works',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Metropolis'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const FooterContainer(),
          ],
        ),
      ),
    );
  }
}
