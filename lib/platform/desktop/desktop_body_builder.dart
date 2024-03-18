import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:uhh/constants.dart';
import 'package:uhh/costom_materials/footer.dart';
import 'package:uhh/platform/materials.dart';
import 'package:uhh/swiper_list.dart';

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
            const SizedBox(height: 10),
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
            _buildResellerWidget(context),
            _buildWhyChooseUsWidget(context, screenWidth),
          ],
        ),
      ],
    );
  }

  Padding _buildResellerWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 50, bottom: 20),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Container(
            color: isDarkTheme(context)
                ? const Color(0xFF333636)
                : const Color(0xff4685a4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Authorized Reseler Of',
                    style: TextStyle(
                        color: isDarkTheme(context)
                            ? const Color(0xffa2a2a2)
                            : const Color.fromARGB(255, 214, 214, 214),
                        fontSize: 35,
                        fontFamily: 'MetropolisReg'),
                  ),
                  const FargoAndFujitsu(),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildSwipeableCards(
    BuildContext context,
  ) {
    SwiperController swiperController = SwiperController();
    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      child: MouseRegion(
        onHover: (event) {
          swiperController.stopAutoplay();
        },
        onExit: (event) {
          swiperController.startAutoplay();
        },
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              height: 300,
              width: 1200,
              child: Swiper(
                autoplayDelay: 6000,
                autoplayDisableOnInteraction: true,
                controller: swiperController,
                duration: 1000,
                autoplay: true,
                curve: Curves.fastEaseInToSlowEaseOut,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: FittedBox(
                          alignment: Alignment.centerRight,
                          child: swipeList[index],
                        ),
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
      ),
    );
  }

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
    return SizedBox(
      height: 1000,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Image.asset(
              key: Key(Theme.of(context).brightness.toString()),
              isDarkTheme(context)
                  ? 'assets/images/materials/component_7.png'
                  : 'assets/images/materials/component_6.png',
            ),
          ),
          Align(
            alignment: const Alignment(1, -0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: SizedBox(
                      height: 700,
                      width: 450,
                      child: DescriptionContainer(
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                    title: Text(
                                      e,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Color(0xfff3f3f3)),
                                    ),
                                  ),
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
                      )),
                ),
                const Flexible(
                  child: SizedBox(
                    width: 50,
                  ),
                ),
                screenWidth > 800
                    ? Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: SizedBox(
                          width: 800,
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
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xfff3f3f3)),
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
                                            Navigator.pushNamed(
                                                context, '/about');
                                          }),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
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
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Image.asset(
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




// Method to build the swipeable cards section
