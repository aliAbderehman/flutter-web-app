import 'package:flutter/material.dart';

String darkBgImage = 'assets/images/materials/dark_bg_11.png';
String lightBgImage = 'assets/images/materials/light_bg_11.png';
String fbInactive = 'assets/images/materials/fb_inactive_01.png';

String waInactive = 'assets/images/materials/wa_inactive_01.png';

String tgInactive = 'assets/images/materials/tg_inactive_01.png';

String darkBgImageSecondary = 'assets/images/materials/dark_bg_02.png';
String lightBgImageSecondary = 'assets/images/materials/light_bg_02.png';
String lightBgImageTertiary = 'assets/images/materials/light_04.png';
String trust = 'assets/images/materials/trust.png';
String quality = 'assets/images/materials/quality.png';
String mobility = 'assets/images/materials/mobility.png';

String darkSecondary = 'assets/images/materials/dark_secondary_bg.png';
String lightSecondary = 'assets/images/materials/light_secondary_bg.png';
String aboutBg = 'assets/images/materials/about_bg.png';
String tileCoffee = 'assets/images/materials/coffee_01.png';
String tileMachines = 'assets/images/materials/machines_01.png';

Color avatorBgColors(BuildContext context) {
  return Theme.of(context).colorScheme.tertiary;
}

Image boatImg = Image.asset(
  'assets/images/materials/boat_01.png',
  scale: 4,
);
Image planeImg = Image.asset(
  'assets/images/materials/plane_01.png',
  scale: 4,
);

BoxDecoration cardBoxDecoration(
        {required BuildContext context, required String img}) =>
    BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff262626)
          : const Color.fromARGB(255, 30, 90, 114),
      borderRadius: BorderRadius.circular(30),
      boxShadow: const [
        BoxShadow(
            color: Color.fromARGB(83, 0, 0, 0),
            offset: Offset(5, -5),
            blurRadius: 10),
      ],
      image: DecorationImage(
          image: AssetImage(img),
          alignment: Alignment.centerLeft,
          // fit: BoxFit.contain,
          scale: 3),
    );

BoxDecoration mainBoxDecoration(BuildContext context) => BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.topCenter,
        // scale: 2,
        // colorFilter: ,
        opacity: 60,
        fit: BoxFit.contain,
        image: AssetImage(
          Theme.of(context).brightness == Brightness.dark
              ? 'assets/images/materials/cont_bg_black.png'
              : 'assets/images/materials/bg_lightblue.png',
        ),
        // fit: BoxFit.none,
      ),
    );

Text abtText(BuildContext context) => Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        text: 'Noon Import and Export: Your Gateway to Global Trade\n',
        children: [
          TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            text:
                'Welcome to For Noon Import and Export, where we transcend borders and connect businesses worldwide. With our seamless platform, we empower enterprises to engage in efficient and profitable import and export activities. Whether you\'re a seasoned trader or a budding entrepreneur, For Noon is your trusted partner for navigating the intricacies of international trade. Let us guide you on a journey towards success in the global market',
          )
        ],
      ),

      // 'Noon Import and Export: Your Gateway to Global Trade\n\n'
      // 'Introduction:\n'
      // 'Welcome to For Noon Import and Export, where we transcend borders and connect businesses worldwide. With our seamless platform, we empower enterprises to engage in efficient and profitable import and export activities. Whether you\'re a seasoned trader or a budding entrepreneur, For Noon is your trusted partner for navigating the intricacies of international trade. Let us guide you on a journey towards success in the global market.\n\n'
      // 'Our Vision:\n'
      // 'At For Noon, our vision is to foster a world where trade knows no bounds. We aim to be the premier online destination for importers and exporters, facilitating seamless transactions and fostering fruitful relationships across continents. With a commitment to innovation and excellence, we strive to redefine the landscape of global commerce.\n\n'
      // 'Services We Offer:\n\n'
      // 'Trade Matchmaking: Our platform facilitates connections between buyers and sellers worldwide, ensuring that businesses find the right partners for their needs. Whether you\'re sourcing products or looking to expand your market reach, our robust network has you covered.\n\n'
      // 'Logistics Solutions: We understand the importance of efficient logistics in international trade. That\'s why we offer comprehensive shipping and freight services to streamline the transportation of goods across borders. From documentation to customs clearance, we handle it all with precision and care.\n\n'
      // 'Market Intelligence: Stay ahead of the curve with our cutting-edge market intelligence tools. Gain valuable insights into global trends, pricing dynamics, and regulatory changes to make informed decisions and seize lucrative opportunities.\n\n'
      // 'Compliance Support: Navigating the complex web of international regulations can be daunting. Our team of experts is here to provide guidance and support, ensuring that your business remains compliant with all applicable laws and regulations.\n'
      // 'Why Choose For Noon?\n'
      // 'Reliability: With years of experience in the import-export industry, For Noon is a name you can trust. Our track record of success speaks for itself, as countless businesses have benefited from our services.\n\n'
      // 'Global Reach: From Asia to Africa, Europe to the Americas, our reach knows no bounds. With a vast network of partners and suppliers spanning the globe, we open doors to new markets and opportunities for your business.\n\n'
      // 'Customer-Centric Approach: At For Noon, customer satisfaction is our top priority. We go above and beyond to understand your unique needs and tailor our services accordingly. Your success is our success, and we are committed to supporting you every step of the way.\n\n'
      // 'Get Started Today:\n'
      // 'Ready to take your business to new heights? Join the For Noon community today and unlock the full potential of global trade. Whether you\'re looking to import, export, or expand your horizons, we have the tools and expertise to help you succeed. Let For Noon be your partner in prosperity.\n\n'
      // 'Contact Us:'
      // 'Have questions or ready to get started? Don\'t hesitate to reach out to our friendly team. You can contact us via phone, email, or through our website to learn more about how For Noon can support your import-export business. Get in touch today and embark on a journey towards limitless possibilities with For Noon Import and Export.\n\n',
      // textAlign: TextAlign.center,
      // style:
    );
