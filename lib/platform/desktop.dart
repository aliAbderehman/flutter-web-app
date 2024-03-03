import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import 'materials.dart';
import '../../swiper_list.dart';
import '../../constants.dart';
import 'mobile.dart';

// Define a StatefulWidget representing the body of the desktop version of the app.
class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

// Define the state for the desktop body.
class _DesktopBodyState extends State<DesktopBody> {
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
  void dispose() {
    // _overlayController.hide();
    super.dispose();
  }

  // Build the UI for the desktop body.
  @override
  Widget build(BuildContext context) {
    // Retrieve the screen width using MediaQuery.
    final screenWidth = MediaQuery.of(context).size.width;

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
            // Container containing background image and other UI elements.
            ClipRRect(
              child: Container(
                decoration: mainBoxDecoration(context),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display social media icons.
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SocialMedias(
                        socialMediasController: _socialMediasController,
                      ),
                    ),
                    const SizedBox(height: 100),
                    // Swipeable cards section.
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 200),
                        child: SizedBox(
                          height: 350,
                          width: 1200,
                          child: Swiper(
                            duration: 1000,
                            autoplay: true,
                            curve: Curves.fastEaseInToSlowEaseOut,
                            autoplayDisableOnInteraction: true,
                            itemBuilder: (BuildContext context, int index) {
                              return SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: FittedBox(
                                    alignment: Alignment.centerRight,
                                    child: swipeList[index],
                                  ),
                                ),
                              );
                            },
                            itemCount: swipeList.length,
                            control: SwiperControl(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 50),
                    // Display a big contact button.
                    Align(
                      alignment: const Alignment(0, 0.3),
                      child: SizedBox(
                        height: 60,
                        child: FittedBox(
                          child: ContactButton(
                            onTap: () {
                              Navigator.pushNamed(context, '/contact_us');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'CONTACT US',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),

                    ///
                  ],
                ),
              ),
            ),

            // const SizedBox(
            //   height: 20,
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AvatorImages(
                    image: trust,
                    title: 'Trust',
                  ),
                ),
                Expanded(
                  child: AvatorImages(
                    image: quality,
                    title: 'Quality',
                  ),
                ),
                Expanded(
                  child: AvatorImages(
                    image: mobility,
                    title: 'Mobility',
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40, left: 150, right: 150),
              child: Container(
                width: double.infinity,
                // height: 500,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 150),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Why Choose Us?',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 150),
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
                          padding: EdgeInsets.symmetric(horizontal: 150),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: WhyUsDescription(
                              description:
                                  'Count on us for transparent and trustworthy services. We prioritize integrity and accountability in every business relationship we build.',
                              title: 'Reliability: ',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 200),

            // Display header actions.

            HeaderActions(
              overlayController: _overlayController,
            ),
            // Display footer container.
            const FooterContainer(),
          ],
        ),
      ),
    );
  }
}
