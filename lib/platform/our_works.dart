import 'package:flutter/material.dart';

import '../constants.dart';
import 'card.dart';
import 'materials.dart';

bool isExpanded = false;

class OurWorks extends StatefulWidget {
  const OurWorks({super.key});

  @override
  State<OurWorks> createState() => _OurWorksState();
}

class _OurWorksState extends State<OurWorks> {
  late final OverlayPortalController _overlayController;
  late final OverlayPortalController _socialMediasController;
  late final OverlayPortalController _cardOverlayController;

  // Initialize overlay controllers when the state is initialized.
  @override
  void initState() {
    super.initState();
    _overlayController = OverlayPortalController();
    _socialMediasController = OverlayPortalController();
    _cardOverlayController = OverlayPortalController();
  }

  @override
  void dispose() {
    // _overlayController.hide();
    super.dispose();
  }

  void triggerExpansion() {
    setState(() {
      if (isExpanded == false) {
        isExpanded = true;
      } else {
        isExpanded = false;
      }
    });
  }

  // Build the UI for the desktop body.
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
            SocialMedias(
              socialMediasController: _socialMediasController,
            ),
            HeaderActions(
              overlayController: _overlayController,
            ),
            // Container containing background image and other UI elements.
            Container(
              decoration: mainBoxDecoration(context),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 100, left: 20, right: 20),
                    child: MySuperCard(
                      title: 'Exotic Ethiopian Coffee',
                      description:
                          'Step into the world of Ethiopian coffee, where every sip is an expedition through centuries of tradition and a landscape rich with flavor. In the heart of the birthplace of coffee, where the ancient Abyssinian forests whisper tales of discovery, Ethiopian coffee captivates with its unparalleled complexity and depth.'
                          'Embark on a sensory journey as you indulge in the rich aroma that wafts from freshly roasted Ethiopian beans, carrying hints of floral notes, fruity undertones, and earthy nuances. Each cup is a masterpiece, meticulously crafted through generations of expertise and a profound connection to the land.'
                          'Step into the world of Ethiopian coffee, where every sip is an expedition through centuries of tradition and a landscape rich with flavor. In the heart of the birthplace of coffee, where the ancient Abyssinian forests whisper tales of discovery, Ethiopian coffee captivates with its unparalleled complexity and depth.',
                      isExpanded: isExpanded, leadingImg: tileCoffee,
                      // onTap: triggerExpansion,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: MySuperCard(
                      title: 'Electrical Equipments and Appeliances',
                      description:
                          'Welcome to the electrifying realm of electrical equipment and appliances, where innovation meets functionality in a symphony of modern convenience and cutting-edge technology. Step into a world where the mundane is transformed into the extraordinary, where the flick of a switch ignites a cascade of power and possibility.'
                          'From sleek kitchen marvels that turn culinary dreams into reality to indispensable gadgets that streamline our daily lives, electrical appliances are the unsung heroes of the modern age. With their sleek designs and intuitive interfaces, they seamlessly integrate into our homes, enhancing efficiency and elevating the mundane tasks of daily life to moments of joy.',
                      isExpanded: isExpanded, leadingImg: tileMachines,
                      // onTap: triggerExpansion,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 50),
                    child: MySuperCard(
                      title: 'IT Equipments',
                      description:
                          'Welcome to the electrifying realm of electrical equipment and appliances, where innovation meets functionality in a symphony of modern convenience and cutting-edge technology. Step into a world where the mundane is transformed into the extraordinary, where the flick of a switch ignites a cascade of power and possibility.'
                          'From sleek kitchen marvels that turn culinary dreams into reality to indispensable gadgets that streamline our daily lives, electrical appliances are the unsung heroes of the modern age. With their sleek designs and intuitive interfaces, they seamlessly integrate into our homes, enhancing efficiency and elevating the mundane tasks of daily life to moments of joy.',
                      isExpanded: isExpanded, leadingImg: tileMachines,
                      // onTap: triggerExpansion,
                    ),
                  ),
                ],
              ),
            ),

            FooterContainer(),
          ],
        ),
      ),
    );
  }
}
