import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dmd_web_01/constants.dart';
import 'package:dmd_web_01/platform/materials.dart';
import 'package:dmd_web_01/swiper_list.dart';

class DesktopBodyBuilder extends StatelessWidget {
  const DesktopBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        const BackgroundImage01(),
        Column(
          children: [
            const SizedBox(height: 100),
            _buildSwipeableCards(context),
            const SizedBox(height: 100),
            _buildContactButton(context),
            _buildWelcomeMessage(context),
            const Text('Trusted By 100+ companies'),
            _buildAnimatedSwitcher(
              imageAsset: isDarkTheme(context)
                  ? 'assets/images/materials/component_8.png'
                  : 'assets/images/materials/component_4.png',
              title: 'Who We Are',
              description: dtWhoWeTxt,
              context: context,
            ),
            buildResellerWidget(context),
            _buildWhyChooseUsWidget(context, screenWidth),
            const SizedBox(
              height: 100,
            ),
            SelectableText(
              'Get Started Today',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'MetropolisReg',
                fontWeight: FontWeight.w400,
                color: isDarkTheme(context)
                    ? const Color(0xfff3f3f3)
                    : const Color(0xff0b0b0e),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 850,
                child: SelectableText(
                  'Ready to experience excellence with $companyNameShort? Explore our products, learn more about our services, and get in touch with our team to discover how we can help you achieve your goals. Welcome to $companyNameShort - where excellence knows no bounds.',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MetropolisReg',
                    color: isDarkTheme(context)
                        ? const Color(0xfff3f3f3)
                        : const Color(0xff0b0b0e),
                  ),
                ),
              ),
            ),
            _buildContactButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildSwipeableCards(
    BuildContext context,
  ) {
    // SwiperController swiperController = SwiperController();
    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/our_work_page'),
        child: CarouselSlider.builder(
          itemCount: featuredProductDesktop.length,
          options: CarouselOptions(
              autoPlay: true,
              height: 200,
              viewportFraction: 1,
              // pageSnapping: false,
              pauseAutoPlayOnTouch: true),
          itemBuilder: (context, index, realIndex) {
            final Widget slidable = featuredProductDesktop[index];

            return slidable;
          },
        ),
      ),
    );
  }

// FocusableActionDetector(
//       mouseCursor: SystemMouseCursors.click,
//       child: MouseRegion(
//         onHover: (event) {
//           swiperController.stopAutoplay();
//         },
//         onExit: (event) {
//           swiperController.startAutoplay();
//         },
//         child: FittedBox(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 50),
//             child: SizedBox(
//               height: 300,
//               width: 1200,
//               child: Swiper(
//                 autoplayDelay: 6000,
//                 autoplayDisableOnInteraction: true,
//                 controller: swiperController,
//                 duration: 1000,
//                 autoplay: true,
//                 curve: Curves.fastEaseInToSlowEaseOut,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Center(
//                     child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: FittedBox(
//                           alignment: Alignment.centerRight,
//                           child: swipeList[index],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: swipeList.length,
//                 control: SwiperControl(
//                   color: Theme.of(context).colorScheme.tertiary,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     )
// Method to build the contact button
  Widget _buildContactButton(BuildContext context) {
    return SizedBox(
      height: 60,
      child: FittedBox(
        child: ContactButton(
          onTap: () {
            Navigator.pushNamed(context, '/contact_us_page');
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
    );
  }

// Method to build the welcome message
  Widget _buildWelcomeMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: SizedBox(
        width: 850,
        child: Text.rich(
          TextSpan(
            text: 'Welcome to $companyNameShort\n',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 40,
              fontFamily: 'MetropolisReg',
              color: Theme.of(context).colorScheme.tertiary,
            ),
            children: [
              TextSpan(
                text: dtWelcomeTxt,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'MetropolisReg',
                  color: isDarkTheme(context)
                      ? const Color.fromARGB(255, 200, 200, 200)
                      : const Color.fromARGB(255, 11, 11, 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWhyChooseUsWidget(BuildContext context, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                isDarkTheme(context)
                    ? 'assets/images/materials/component_7.png'
                    : 'assets/images/materials/component_6.png',
              ))),
      // height: 700,
      width: double.infinity,
      child: Align(
        // alignment: const Alignment(1, -0.1),
        child: SizedBox(
          width: 850,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // height: 700,
                width: 400,
                child: DescriptionContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 80),
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Why should choose us?',
                        style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'MetropolisReg',
                          fontWeight: FontWeight.w400,
                          color: Color(0xfff3f3f3),
                        ),
                        children: whyUsTxt.map((e) {
                          return WidgetSpan(
                              child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.check_sharp,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                title: Text(
                                  e,
                                  style: const TextStyle(
                                      fontSize: 20, color: Color(0xfff3f3f3)),
                                ),
                              ),
                              if (e != whyUsTxt.last)
                                const Divider(
                                  indent: 20,
                                  endIndent: 20,
                                  color: Colors.white38,
                                )
                            ],
                          ));
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: 410,
                  child: Text.rich(
                    TextSpan(
                      text:
                          'Choose $companyNameShort: Elevating Excellence, Every Time.\n',
                      style: const TextStyle(
                        fontSize: 40,
                        fontFamily: 'MetropolisReg',
                        fontWeight: FontWeight.w400,
                        color: Color(0xfff3f3f3),
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'Committed to staying ahead of the curve, $companyNameShort continuously seeks new products and trends to meet evolving market demands, ensuring you\'re always at the forefront of innovation.\n',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xfff3f3f3)),
                        ),
                        WidgetSpan(
                            child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: SizedBox(
                              height: 60,
                              width: 120,
                              child: ContactButton(
                                  child: const Center(
                                    child: Text(
                                      'More',
                                      style: TextStyle(
                                          fontFamily: 'MetropolisReg',
                                          color: Colors.white),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/about');
                                  }),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// Method to build the AnimatedSwitcher with image and description
  Widget _buildAnimatedSwitcher({
    required String imageAsset,
    required String title,
    required String description,
    required BuildContext context,
  }) {
    return SizedBox(
      height: 700,
      width: double.infinity,
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Image.asset(
              width: double.infinity,
              fit: BoxFit.cover,
              key: Key(Theme.of(context).brightness.toString()),
              imageAsset,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0),
            child: SizedBox(
              height: 450,
              width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: DescriptionContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: '$title\n',
                        style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'MetropolisReg',
                          fontWeight: FontWeight.w400,
                          color: Color(0xfff3f3f3),
                        ),
                        children: [
                          TextSpan(
                            text: description,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xfff3f3f3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

int pos = 0;
// Method to build the swipeable cards section
List<Widget> featuredProductDesktop = ourWorksTxt.map((e) {
  if (pos == 2) {
    pos = 1;
  }
  pos++;
  return SwipableCardDesktop(
      position: pos,
      title: e.title,
      description: e.content,
      imgPath: e.imgPath);
}).toList();
