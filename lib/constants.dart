import 'package:flutter/material.dart';

//logo image path
const String mainLogo = 'assets/images/logo/main_logo.png';

const String companyName = 'DMD Import & Whole Sale';
const String companyNameShort = 'DMD';

// social media links and address
const String address = 'Addis Ababa, Ethiopia';
const String tel = '+251 921 986 249';
const String webAddress = 'www.ankabootechs.com';
const String emailAddress = 'contacts@ankabootechs.com';
final facebookUrl = Uri.parse('https://www.facebook.com/abderehman.ali');
final telegramUrl = Uri.parse('https://t.me/Musab4');
final whatsappUrl = Uri.parse('https://wa.link/0jqn7j');
final instagramUrl = Uri.parse('https://www.instagram.com/abderehman.a/');
final twitterUrl = Uri.parse('');

const String darkBgImage = 'assets/images/materials/dark_bg_11.png';
const String lightBgImage = 'assets/images/materials/light_bg_11.png';

//Assets path
const String mail = 'assets/images/materials/mail_02.png';
const String darkBgImageSecondary = 'assets/images/materials/dark_bg_02.png';
const String trust = 'assets/images/materials/trust.png';
const String quality = 'assets/images/materials/quality.png';
const String mobility = 'assets/images/materials/mobility.png';
const String containerBg = 'assets/images/materials/container_background.jpg';
const String darkSecondary = 'assets/images/materials/dark_secondary_bg.png';
const String lightSecondary = 'assets/images/materials/light_secondary_bg.png';
const String aboutBg = 'assets/images/materials/about_bg.png';
const String tileCoffee = 'assets/images/materials/coffee_01.png';
const String tileMachines = 'assets/images/materials/machines_01.png';
const String contactUsBgImgDark = 'assets/images/materials/noon.png';
const String contactUsBgImgLight = 'assets/images/materials/light_bg.png';

const String materials = 'assets/images/materials/';

//our works // // //
const coffeeTitle = '$companyNameShort\'s Exquisite Ethiopian Coffee Exports\n';
const coffeeDescription =
    'Embark on a journey through Ethiopia\'s rich coffee heritage with $companyNameShort, a distinguished exporter of Ethiopian coffee. Renowned for our commitment to quality, authenticity, and sustainability, we invite you to discover the extraordinary flavors and cultural significance of Ethiopian coffee through our exclusive selection.\n';
const itTitle = 'IT and Data Center Equipments\n';
const itDescription =
    'Revolutionize your business\'s IT infrastructure with $companyNameShort Import and Export\'s premium selection of servers and data center racks. As a trusted provider of top-tier IT solutions, we specialize in importing high-performance equipment designed to meet the demanding needs of modern enterprises.\n';
const machinesTitle = 'Electrical Equipments and Machineries\n';
const machinesDescription =
    'Powering Your World: Explore our curated collection of top-tier electrical equipment and appliances. From cutting-edge gadgets to essential home essentials, $companyNameShort ensures seamless functionality and unmatched performance for every need. Discover innovation, reliability, and efficiency at your fingertips.\n';

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
    'your premier destination for electrical appliances and machinery imports, coupled with the finest quality coffee exports. At $companyNameShort, we specialize in sourcing and delivering top-of-the-line electrical appliances and machinery from around the globe, catering to a diverse range of industries and businesses. Our extensive catalogue encompasses everything from cutting-edge electronics to robust industrial equipment, providing solutions that empower businesses to thrive in today\'s dynamic marketplace.';
const String dtWhoWeTxt =
    'At $companyNameShort, we are more than just a company; we are your strategic partner in success. With a commitment to excellence and innovation, we specialize in sourcing top-quality electrical appliances and machinery imports while also offering the finest coffee exports. Backed by years of industry expertise, $companyNameShort stands as a beacon of reliability, providing tailored solutions and unparalleled service to businesses worldwide. Our dedication to ethical sourcing practices, customer-centric approach, and relentless pursuit of excellence sets us apart, making $companyNameShort the preferred choice for businesses seeking quality, reliability, and unmatched service. Join us and experience the $companyNameShort difference today.';

//about us /// ///

const String aboutUsTxt1 =
    'Welcome to $companyNameShort, your premier partner in global trade. At $companyNameShort, we specialize in importing top-quality electrical equipment and appliances while also exporting the finest coffee beans sourced from around the world. With a commitment to excellence and a passion for fostering international connections, $companyNameShort is dedicated to delivering exceptional products and services to our valued clients.';
const String aboutUsTxt2 =
    '$companyNameShort is at the forefront of importing electrical equipment and appliances, catering to the diverse needs of industries worldwide. From cutting-edge machinery to innovative appliances, our curated selection ensures superior performance and reliability. We work closely with leading manufacturers and suppliers to bring the latest technologies to our clients, helping them stay ahead in today\'s competitive markets.';
const String aboutUsTxt3 = '';

//  //
Color avatorBgColors(BuildContext context) {
  return isDarkTheme(context)
      ? const Color.fromARGB(255, 66, 66, 66)
      : const Color(0xff4b88a7);
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

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class AboutUsTxt {
  AboutUsTxt(
      {required this.title,
      required this.content,
      this.imgPath,
      this.position});
  String title;
  String content;
  String? imgPath;
  int? position;
}

List<AboutUsTxt> aboutUsTexts1 = [
  AboutUsTxt(
      title: 'Diverse Product Range: ',
      content:
          'From state-of-the-art servers and computer hardware to cutting-edge appliances and aromatic coffee blends, $companyNameShort offers a diverse range of products tailored to meet the needs of modern consumers and businesses.'),
  AboutUsTxt(
      title: 'Quality Assurance: ',
      content:
          'We prioritize quality at every stage of our operations. Whether it\'s sourcing products from reputable manufacturers or conducting rigorous quality checks, we ensure that every item that bears the $companyNameShort name meets the highest standards of excellence.'),
  AboutUsTxt(
      title: 'Global Reach: ',
      content:
          'With a strong presence in international markets, $companyNameShort is your gateway to a world of possibilities. Our global network of partners and distributors enables us to seamlessly connect with customers around the globe, delivering our products with speed, efficiency, and reliability.'),
  AboutUsTxt(
      title: 'Customer-Centric Approach: ',
      content:
          'At $companyNameShort, customer satisfaction is our top priority. We go above and beyond to understand our customers\' needs and provide personalized solutions that exceed their expectations. From prompt assistance to hassle-free returns, we\'re committed to making every interaction with $companyNameShort a positive experience.'),
  //Our values
];

List<AboutUsTxt> aboutUsTexts2 = [
  AboutUsTxt(
      title: 'Integrity: ',
      content:
          'We conduct our business with honesty, transparency, and integrity, earning the trust and respect of our customers, partners, and stakeholders.'),
  AboutUsTxt(
      title: 'Innovation: ',
      content:
          'We embrace innovation as a driving force behind our success, continuously exploring new ideas and technologies to stay at the forefront of our industry.'),
  AboutUsTxt(
      title: 'Sustainability: ',
      content:
          'We are committed to sustainability and environmental responsibility, striving to minimize our ecological footprint and promote sustainable practices throughout our supply chain.'),
];

List<AboutUsTxt> ourWorksTxt = [
  AboutUsTxt(
    position: 1,
    imgPath: '${materials}electrical_equipments.png',
    title: 'Electrical Equipment',
    content:
        'From circuit breakers to wiring accessories, $companyNameShort is your one-stop destination for high-quality electrical equipment. We have supplied essential electrical components to residential, commercial, and industrial projects, ensuring safety, reliability, and efficiency.',
  ),
  AboutUsTxt(
      position: 2,
      imgPath: '${materials}component_12.png',
      title: 'IT Solutions',
      content:
          'Our expertise in IT solutions extends to providing state-of-the-art servers, computer hardware, and networking equipment to businesses of all sizes. Whether it\'s optimizing data centers or enhancing network infrastructure, $companyNameShort delivers innovative solutions tailored to meet the evolving demands of the digital age.'),
  AboutUsTxt(
      position: 1,
      imgPath: '${materials}appliance.png',
      title: 'Appliances',
      content:
          'Transform your home with our range of stylish and functional appliances. From energy-efficient refrigerators to sleek kitchen gadgets, $companyNameShort offers a curated selection of appliances designed to enhance your everyday living experience.'),
  AboutUsTxt(
      position: 2,
      imgPath: '${materials}coffe_03.png',
      title: 'Coffee',
      content:
          'Indulge in the rich aroma and exquisite flavor of $companyNameShort\'s premium coffee blends. Sourced from the finest beans around the world and expertly roasted to perfection, our coffee delivers a sensory experience like no other. Whether you\'re a coffee connoisseur or a casual enthusiast, $companyNameShort has the perfect blend for you.'),
];
