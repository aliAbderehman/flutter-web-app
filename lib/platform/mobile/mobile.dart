import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dmd_web_01/constants.dart';
import 'package:dmd_web_01/costom_materials/footer.dart';
import 'package:flutter/material.dart';
import 'package:dmd_web_01/costom_materials/mobile_menu.dart';

import '../materials.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();
bool val = brightness == Brightness.dark;

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> with TickerProviderStateMixin {
  late AnimationController _controller;

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

  // final AnimateIconController animateIconController = AnimateIconController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        onEndDrawerChanged: (isOpened) {
          if (!isOpened) {
            _controller.reverse();
          }
        },
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          controller: _controller,
        ),
        endDrawerEnableOpenDragGesture: false,
        endDrawer: Drawer(
          elevation: 0,
          width: 200,
          backgroundColor: Colors.transparent,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: const MobileMenu(),
            ),
          ),
        ),
        // floatingActionButton: const ContactsOverlay(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(isDarkTheme(context)
                        ? '${materials}dark_bg_hd.png'
                        : 'assets/images/materials/blue_bg_hd.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 80, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 170,
                        child: Text(
                          companyName,
                          style: TextStyle(
                              fontFamily: 'Metropolis',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            // height: 80,
                            child: Text(
                              'Unlock global opportunities. Seamlessly import and export goods across continents with precision and reliability.',
                              style: TextStyle(
                                  fontFamily: 'MetropolisReg',
                                  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.2),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          MoreButton(
                            onTap: () {
                              Navigator.pushNamed(context, '/about');
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 50),
                        child: SizedBox(
                          width: 150,
                          child: ContactButton(
                              child: const Text(
                                'CONTACT US',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Metropolis',
                                    color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/contact_us_page');
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(isDarkTheme(context)
                        ? '${materials}context_02.png'
                        : 'assets/images/materials/context_01.png'),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 100, bottom: 20),
                  child: Text.rich(
                    TextSpan(
                      text: 'Welcome to $companyNameShort\n',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: 'MetropolisReg',
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      children: [
                        TextSpan(
                          text: dtWelcomeTxt,
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
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
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 18,
                        color: isDarkTheme(context)
                            ? const Color(0xffa2a2a2)
                            : const Color.fromARGB(255, 123, 123, 123),
                      ),
                    ),
                  )),
              FocusableActionDetector(
                mouseCursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/our_work_page'),
                  child: CarouselSlider.builder(
                    itemCount: featuredProduct.length,
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 200,
                        viewportFraction: 1,
                        // pageSnapping: false,
                        pauseAutoPlayOnTouch: true),
                    itemBuilder: (context, index, realIndex) {
                      final Widget slidable = featuredProduct[index];
                      return slidable;
                    },
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: Column(
                    children: [
                      Text(
                        'Authorized Reseller of ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: isDarkTheme(context)
                              ? const Color(0xffa2a2a2)
                              : const Color.fromARGB(255, 123, 123, 123),
                        ),
                      ),
                      const FargoAndFujitsu(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            isDarkTheme(context)
                                ? 'assets/images/materials/component_m2.png'
                                : 'assets/images/materials/component_m1.png',
                          ))),
                  child: SizedBox(
                    width: screenWidth(context),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 50),
                            child: DescriptionContainer(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                    text: 'Why should choose us?',
                                    style: const TextStyle(
                                      fontSize: 25,
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
                                                  height: 1,
                                                  fontFamily: 'MetropolisReg',
                                                  fontSize: 14,
                                                  color: Color(0xfff3f3f3)),
                                            ),
                                          ),
                                          if (e != whyUsTxt.last)
                                            const Divider(
                                              height: 0,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: 400,
                            child: Text.rich(
                              softWrap: true,
                              TextSpan(
                                text:
                                    'Choose $companyNameShort: Elevating Excellence, Every Time.\n',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'MetropolisReg',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff3f3f3),
                                ),
                                children: [
                                  const TextSpan(
                                    text:
                                        'Committed to staying ahead of the curve, $companyNameShort continuously seeks new products and trends to meet evolving market demands, ensuring you\'re always at the forefront of innovation.\n',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xfff3f3f3)),
                                  ),
                                  WidgetSpan(
                                      child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(40.0),
                                      child: SizedBox(
                                        height: 50,
                                        width: 80,
                                        child: ContactButton(
                                            child: const Center(
                                              child: Text(
                                                'More',
                                                style: TextStyle(
                                                    fontSize: 12,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SmallMobileSizeFooter()
            ],
          ),
        ));
  }
}

List<Widget> featuredProduct = ourWorksTxt.map((e) {
  return SwipableCard(
      title: e.title, description: e.content, imgPath: e.imgPath);
}).toList();

class SwipableCard extends StatelessWidget {
  const SwipableCard({
    super.key,
    required this.title,
    required this.description,
    this.imgPath,
    this.position,
  });
  final String title;
  final String description;
  final String? imgPath;
  final int? position;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDarkTheme(context) ? const Color(0xff262626) : Colors.white,
      child: position == 1
          ? Row(
              children: [
                if (imgPath != '')
                  Expanded(
                    child: Container(
                      color: isDarkTheme(context)
                          ? const Color(0xff1d1d23)
                          : const Color(0xffdcdcdc),
                      child: Image(
                        height: 200,
                        image: AssetImage(imgPath!),
                      ),
                    ),
                  ),
                Expanded(
                  child: SizedBox(
                    // width: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                          text: '$title\n',
                          style: const TextStyle(
                            // fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 1,

                            fontFamily: 'Metropolis',
                          ),
                          children: [
                            TextSpan(
                              text: description,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'MetropolisReg',
                                // color: Color.fromARGB(255, 200, 200, 200),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: SizedBox(
                    // width: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        maxLines: 6,
                        overflow: TextOverflow.fade,
                        TextSpan(
                          text: '$title\n',
                          style: const TextStyle(
                            // fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 1,

                            fontFamily: 'Metropolis',
                          ),
                          children: [
                            TextSpan(
                              text: description,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'MetropolisReg',
                                // color: Color.fromARGB(255, 200, 200, 200),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (imgPath != '')
                  Expanded(
                    child: Container(
                      color: isDarkTheme(context)
                          ? const Color(0xff1d1d23)
                          : const Color(0xffdcdcdc),
                      child: Image(
                        height: 200,
                        image: AssetImage(imgPath!),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
