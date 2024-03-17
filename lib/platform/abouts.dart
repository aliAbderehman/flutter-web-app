import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    // Retrieve the screen width using MediaQuery.
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Hide overlays if the screen width is less than 700.
    adjustScreen(
        screenWidth: screenWidth,
        overlayController: _overlayController,
        socialMediasController: _socialMediasController);

    // Construct the scaffold containing the desktop UI components.
    print(screenWidth);
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
                  SizedBox(
                    height: 1200,
                    child: Stack(
                      children: [
                        AnimatedSwitcher(
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
                        ),
                        Align(
                          alignment: const Alignment(0, -0.5),
                          child: SizedBox(
                            width: 1200,
                            child: Text(
                              'Welcome to Noon, your premier partner in global trade. At Noon, we specialize in importing top-quality electrical equipment and appliances while also exporting the finest coffee beans sourced from around the world. With a commitment to excellence and a passion for fostering international connections, Noon is dedicated to delivering exceptional products and services to our valued clients.',
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
                        const Align(
                            alignment: Alignment(0.6, 0.2),
                            child: SizedBox(
                              height: 400,
                              width: 700,
                              child: DescriptionContainer(
                                child: Padding(
                                  padding: EdgeInsets.all(40.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Importing Excellence:',
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontFamily: 'Metropolis',
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                      Text(
                                        'Noon is at the forefront of importing electrical equipment and appliances, catering to the diverse needs of industries worldwide. From cutting-edge machinery to innovative appliances, our curated selection ensures superior performance and reliability. We work closely with leading manufacturers and suppliers to bring the latest technologies to our clients, helping them stay ahead in today\'s competitive markets.',
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
                            )),
                        const Align(
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
                                      'Importing Excellence:',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontFamily: 'Metropolis',
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    Text(
                                      'Noon is at the forefront of importing electrical equipment and appliances, catering to the diverse needs of industries worldwide. From cutting-edge machinery to innovative appliances, our curated selection ensures superior performance and reliability. We work closely with leading manufacturers and suppliers to bring the latest technologies to our clients, helping them stay ahead in today\'s competitive markets.',
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
                        ),
                        Align(
                          alignment: const Alignment(0.6, 0.8),
                          child: SizedBox(
                            height: 60,
                            child: FittedBox(
                              child: ContactButton(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/our_work_page');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    'Visit Our Works',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                  Navigator.pushNamed(
                                      context, '/contact_us_page');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    'CONTACT US',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
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
                          text:
                              'Noon is at the forefront of importing electrical equipment and appliances, catering to the diverse needs of industries worldwide. From cutting-edge machinery to innovative appliances, our curated selection ensures superior performance and reliability. We work closely with leading manufacturers and suppliers to bring the latest technologies to our clients, helping them stay ahead in today\'s competitive markets.',
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
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: FooterContainer(),
              ),
            ],
          ),
        ));
  }
}

// Row(
//           children: [
//             HeaderActions(overlayController: _overlayController),
//             Container(
//               color: Theme.of(context).colorScheme.primaryContainer,
//               width: MediaQuery.of(context).size.width * 0.15,
//               child: Expanded(
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 150, bottom: 50),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {},
//                           child: Text('Introduction'),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: Text('Our Vision'),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: Text('Services'),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: Text('Introduction'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//                 child: Container(
//               height: MediaQuery.of(context).size.height,
//               color: Theme.of(context).colorScheme.secondaryContainer,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 100,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 80),
//                       child: abtText(context),
//                     ),
//                   ],
//                 ),
//               ),
//             ))
//           ],
//         ),
