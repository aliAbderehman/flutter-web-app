import 'package:flutter/material.dart';
import 'package:dmd_web_01/costom_materials/footer.dart';
import 'package:dmd_web_01/costom_materials/mobile_menu.dart';
import 'package:dmd_web_01/platform/desktop/desktop_body_builder.dart';

import '../materials.dart';
import '../../../constants.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody>
    with TickerProviderStateMixin {
  late final OverlayPortalController _overlayController;
  late final OverlayPortalController _socialMediasController;
  late AnimationController _controller;

  //
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

    adjustScreen(
        screenWidth: screenWidth,
        overlayController: _overlayController,
        socialMediasController: _socialMediasController);

    return Scaffold(
      //
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
      //
      body: SingleChildScrollView(
        child: Column(
          children: [
            SocialMedias(socialMediasController: _socialMediasController),

            const DesktopBodyBuilder(),

            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 150),
              child: SizedBox(
                width: 850,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: AvatorImages(
                        image: trust,
                        title: 'Trust',
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Flexible(
                      child: AvatorImages(
                        image: quality,
                        title: 'Quality',
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Flexible(
                      child: AvatorImages(
                        image: mobility,
                        title: 'Mobility',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50),
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
