import 'dart:ui';

import 'package:animate_icons/animate_icons.dart';

import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';
import 'package:uhh/costom_materials/mobile_menu.dart';

import '../materials.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();
bool val = brightness == Brightness.dark;

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> with TickerProviderStateMixin {
  final OverlayPortalController overlayPortalController =
      OverlayPortalController()..show();

  final OverlayPortalController contactOverLayController =
      OverlayPortalController()..show();

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

  final AnimateIconController animateIconController = AnimateIconController();

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
      body: Column(
        children: [
          Container(),
          ContactsMobileButton(
            overlayPortalController: contactOverLayController,
          ),
        ],
      ),
    );
  }
}

class ContactsMobileButton extends StatelessWidget {
  const ContactsMobileButton({
    super.key,
    required this.overlayPortalController,
  });
  final OverlayPortalController overlayPortalController;

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
        controller: overlayPortalController,
        overlayChildBuilder: (BuildContext context) {
          return FabCircularMenuPlus(
              fabColor: Colors.transparent,
              alignment: Alignment.bottomRight,
              animationDuration: const Duration(milliseconds: 500),
              ringColor: Colors.transparent,
              fabSize: 50,
              ringDiameter: 150,
              ringWidth: 2,
              fabCloseIcon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: const Padding(
                    padding: EdgeInsets.all(8.0), child: Icon(Icons.close)),
              ),
              fabOpenIcon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/materials/contact_mail.png',
                    color: Colors.white,
                  ),
                ),
              ),
              children: [
                IconButton(
                    color: Colors.amber,
                    onPressed: () {},
                    icon: Image.asset(
                        'assets/images/materials/contact_mail.png')),
                IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
              ]);
        });
  }
}
