import 'package:flutter/material.dart';

import '../constants.dart';
import 'materials.dart';

class Abouts extends StatefulWidget {
  const Abouts({super.key});

  @override
  State<Abouts> createState() => _AboutsState();
}

class _AboutsState extends State<Abouts> {
  late final OverlayPortalController _overlayController;

  late final OverlayPortalController _socialMediasController;

  // Initialize overlay controllers when the state is initialized.
  @override
  void initState() {
    super.initState();
    _overlayController = OverlayPortalController();
    _socialMediasController = OverlayPortalController();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the screen width using MediaQuery.
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Hide overlays if the screen width is less than 700.
    if (screenWidth < 665) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _overlayController.hide();
        _socialMediasController.hide();
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _overlayController.show();
        _socialMediasController.show();
      });
    }

    // Construct the scaffold containing the desktop UI components.

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderActions(overlayController: _overlayController),
              SocialMedias(socialMediasController: _socialMediasController),
              Container(
                height: screenHeight * 0.15,
                color: Color(0xff09090B),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                    child: SelectableText(
                  'we are your trusted trade agent',
                  style: Theme.of(context).textTheme.displayLarge,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(aboutBg),
                      fit: BoxFit.none,
                    ),
                  ),
                  width: screenWidth,
                  // height: screenHeight * 0.35,
                  child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 120),
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            // color: Colors.amber,
                          ),
                          text: "Welcome to Noon Import and Export,\n",
                          children: [
                            WidgetSpan(
                                child: SizedBox(
                              height: 35,
                            )),
                            TextSpan(
                              text:
                                  "where we transcend borders and connect businesses world wide. With our seamless platform, w empower enterprises to engage in efficient and profitable import and export activities. Whether you're a seasoned trader or a budding entrepreneur, For Noon is your trusted partner for navigating the intricacies of international trade. Let us guide you on a journey towards success in the global market",
                              style: TextStyle(
                                height: 1,
                                fontFamily: 'MetropolisReg',
                                fontSize: 25,
                                color: Color(0xFFB9CCD0),
                              ),
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,

                        // "Welcome to Noon Import and Export,\n"

                        // textAlign: TextAlign.center,
                        // style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: SelectableText('Our Services'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text.rich(
                      TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Metropolis',
                            color: Colors.amber,
                          ),
                          text: 'Export\n\n',
                          children: [
                            TextSpan(
                              text: 'Exotic high quality ethiopian coffee',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ]),
                      textAlign: TextAlign.center,
                    ),
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontFamily: 'Metropolis',
                          color: Colors.amber,
                        ),
                        text: 'Import\n\n',
                        children: [
                          TextSpan(
                              text:
                                  'IT Equipments\nElectrical Equipment and Appeliance',
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
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
