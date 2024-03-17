import 'package:flutter/material.dart';

const String darkBgImage = 'assets/images/materials/dark_bg_11.png';
const String lightBgImage = 'assets/images/materials/light_bg_11.png';
const String fbInactive = 'assets/images/materials/fb_inactive_01.png';

const String waInactive = 'assets/images/materials/wa_inactive_01.png';

const String tgInactive = 'assets/images/materials/tg_inactive_01.png';
const String mail = 'assets/images/materials/mail_02.png';

const String darkBgImageSecondary = 'assets/images/materials/dark_bg_02.png';
const String lightBgImageSecondary = 'assets/images/materials/light_bg_02.png';
const String lightBgImageTertiary = 'assets/images/materials/light_04.png';
const String trust = 'assets/images/materials/trust.png';
const String quality = 'assets/images/materials/quality.png';
const String mobility = 'assets/images/materials/mobility.png';
const String mainLogo = 'assets/images/materials/main_logo_02.png';
const String containerBg = 'assets/images/materials/container_background.jpg';

const String darkSecondary = 'assets/images/materials/dark_secondary_bg.png';
const String lightSecondary = 'assets/images/materials/light_secondary_bg.png';
const String aboutBg = 'assets/images/materials/about_bg.png';
const String tileCoffee = 'assets/images/materials/coffee_01.png';
const String tileMachines = 'assets/images/materials/machines_01.png';

const String contactUsBgImgDark = 'assets/images/materials/noon.png';
const String contactUsBgImgLight = 'assets/images/materials/light_bg.png';
const String social = 'assets/images/materials/social.png';

const String emailAddress = 'contacts@ankabootecks.com';
const String webAddress = 'www.ankabootechs.com';
const String materials = 'assets/images/materials/';
const String tel = '+251 921 986 249';
const String address = 'Addis Ababa, Ethiopia';
const String companyName = 'Noon Import & Export';
const String companyNameShort = 'Noon';

final facebookUrl = Uri.parse('https://www.facebook.com/abderehman.ali');
final telegramUrl = Uri.parse('https://t.me/Musab4');
final whatsappUrl = Uri.parse('https://wa.link/0jqn7j');
final instagramUrl = Uri.parse('https://www.instagram.com/abderehman.a/');
final twitterUrl = Uri.parse('');

//our works // // //
const coffeTitle = 'Noon\'s Exquisite Ethiopian Coffee Exports\n';
const coffeDescription =
    'Embark on a journey through Ethiopia\'s rich coffee heritage with Noon, a distinguished exporter of Ethiopian coffee. Renowned for our commitment to quality, authenticity, and sustainability, we invite you to discover the extraordinary flavors and cultural significance of Ethiopian coffee through our exclusive selection.\n';
const itTitle = 'IT and Data Center Equipments\n';
const itDesctiption =
    'Revolutionize your business\'s IT infrastructure with Noon Import and Export\'s premium selection of servers and data center racks. As a trusted provider of top-tier IT solutions, we specialize in importing high-performance equipment designed to meet the demanding needs of modern enterprises.\n';
const machinesTitle = 'Electrical Equipments and Machineries\n';
const machinesDescription =
    'Revolutionize your business\'s IT infrastructure with Noon Import and Export\'s premium selection of servers and data center racks. As a trusted provider of top-tier IT solutions, we specialize in importing high-performance equipment designed to meet the demanding needs of modern enterprises.\n';

//desktop // // //

List<String> whyUsTxt = [
  'Exceptional Quality',
  'Wide Range of Products',
  'Expertise and Experience',
  'Ethical Sourcing Practices',
  'Customer Satisfaction',
  'Competitive Pricing'
];
const String dtWelcomeTxt =
    'your premier destination for electrical appliances and machinery imports, coupled with the finest quality coffee exports. At Noon, we specialize in sourcing and delivering top-of-the-line electrical appliances and machinery from around the globe, catering to a diverse range of industries and businesses. Our extensive catalogue encompasses everything from cutting-edge electronics to robust industrial equipment, providing solutions that empower businesses to thrive in today\'s dynamic marketplace.';
const String dtWhoWeTxt =
    'At Noon, we are more than just a company; we are your strategic partner in success. With a commitment to excellence and innovation, we specialize in sourcing top-quality electrical appliances and machinery imports while also offering the finest coffee exports. Backed by years of industry expertise, Noon stands as a beacon of reliability, providing tailored solutions and unparalleled service to businesses worldwide. Our dedication to ethical sourcing practices, customer-centric approach, and relentless pursuit of excellence sets us apart, making Noon the preferred choice for businesses seeking quality, reliability, and unmatched service. Join us and experience the Noon difference today.';

Color avatorBgColors(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? Theme.of(context).colorScheme.secondary
      : const Color(0xff114052);
}

bool isDarkTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

Image boatImg = Image.asset(
  'assets/images/materials/boat_01.png',
  scale: 4,
);
Image planeImg = Image.asset(
  'assets/images/materials/plane_01.png',
  scale: 4,
);

//screeen size controller
void adjustScreen(
    {required double screenWidth,
    required OverlayPortalController overlayController,
    required OverlayPortalController socialMediasController}) {
  if (screenWidth < 750) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      overlayController.hide();
      // _socialMediasController.hide();
    });
  } else {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      overlayController.show();
      socialMediasController.show();
    });
  }
  if (screenWidth < 665) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // _overlayController.hide();
      socialMediasController.hide();
    });
  } else {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      socialMediasController.show();
    });
  }
}

BoxDecoration cardBoxDecoration(
        {required BuildContext context, required String img}) =>
    BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff262626)
          : const Color.fromARGB(255, 255, 255, 255),
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
        // fit: BoxFit.contain,
        image: AssetImage(
          Theme.of(context).brightness == Brightness.dark
              ? 'assets/images/materials/bg_001.png'
              : 'assets/images/materials/blue_bg_001.png',
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
