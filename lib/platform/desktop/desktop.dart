import 'package:flutter/material.dart';
import 'package:uhh/costom_materials/footer.dart';
import 'package:uhh/costom_materials/mobile_menu.dart';
import 'package:uhh/platform/desktop/desktop_body_builder.dart';

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
      endDrawer: screenWidth < 750
          ? CustomEndDrawer(
              screenWidth: screenWidth,
            )
          : null,
      appBar: screenWidth < 750 ? CustomAppBar(controller: _controller) : null,
      //
      body: SingleChildScrollView(
        child: Column(
          children: [
            SocialMedias(socialMediasController: _socialMediasController),
            const DesktopBodyBuilder(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ),

            const SizedBox(height: 200),
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
