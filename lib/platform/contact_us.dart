import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  // final OverlayPortalController _overlayController = OverlayPortalController()
  //   ..show();
  // final OverlayPortalController _socialMediasController =
  //     OverlayPortalController()..show();

  @override
  void initState() {
    super.initState();
    // _overlayController = OverlayPortalController()..show();
    // _socialMediasController = OverlayPortalController()..show();
  }

  @override
  void dispose() {
    // _overlayController.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Hide overlays if the screen width is less than 700.

    return Scaffold(
      body: Column(
        children: [
          // HeaderActions(overlayController: _overlayController),
          // SocialMedias(
          //   socialMediasController: _socialMediasController,
          // ),
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/materials/light_bg.png'),
                    fit: BoxFit.fitWidth)),
            width: double.infinity,
            height: 300,
            child: const Center(
              child: Text(
                'Get in touch',
                style: TextStyle(fontSize: 25, fontFamily: 'Metropolis'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
