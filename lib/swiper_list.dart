import 'package:flutter/material.dart';

// import 'responsive/constants.dart';

List<Widget> mobileSwipeList = [
  Container(
    alignment: Alignment.topRight,
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MainTxt(
          txt: 'Noon Import & \nExport',
          align: TextAlign.end,
        ),
        SizedBox(
          height: 20,
        ),
        DescriptionTxt(
          description:
              'Unlock global opportunities. Seamlessly import and export goods across\n'
              'continents with precision and reliability. Join us in shaping the future of commerce.\n'
              'Welcome to Noon',
          align: TextAlign.center,
        ),
        // Align(
        //   alignment: Alignment.center,
        //   child: MyOutlinedButton(),
        // ),
      ],
    ),
  ),

  // coffe image with description
  Container(
    alignment: Alignment.topRight,
    decoration: const BoxDecoration(
      image: DecorationImage(
        // scale: 1,
        alignment: Alignment.centerLeft,

        image: AssetImage('assets/images/materials/coffe_03.png'),
      ),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MainTxt(
          txt: 'Exotic Ethiopian Cofffee',
          align: TextAlign.end,
        ),
        SizedBox(
          height: 20,
        ),
        DescriptionTxt(
          description:
              'Indulge in the rich flavors of Ethiopia with our \nexquisite Ethiopian coffee. Sourced from the birthplace\n of coffee itself.',
          align: TextAlign.center,
        )
      ],
    ),
  ),

  // machine picture swipable

  Container(
    alignment: Alignment.topRight,
    decoration: const BoxDecoration(
      image: DecorationImage(
        // scale: 4,
        alignment: Alignment.centerLeft,
        image: AssetImage('assets/images/materials/machines_01.png'),
      ),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MainTxt(
          txt: 'Electrical Equipments',
          align: TextAlign.end,
        ),
        SizedBox(
          height: 30,
        ),
        DescriptionTxt(
          description:
              'Indulge in the rich flavors of Ethiopia with our \nexquisite Ethiopian coffee. Sourced from the birthplace\n of coffee itself.',
          align: TextAlign.center,
        )
      ],
    ),
  ),
];

List<Widget> swipeList = [
  Container(
    width: 1000,
    height: 300,
    alignment: Alignment.centerRight,
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MainTxt(
          txt: 'Welcome to Noon',
          align: TextAlign.end,
        ),
        SizedBox(
          height: 20,
        ),
        DescriptionTxt(
          description:
              'Unlock global opportunities. Seamlessly import and export goods across\n'
              'continents with precision and reliability. Join us in shaping the future of commerce.\n'
              'Welcome to Noon',
          align: TextAlign.center,
        ),
        // Align(
        //   alignment: Alignment.center,
        //   child: MyOutlinedButton(),
        // ),
      ],
    ),
  ),

  // coffe image with description
  Container(
    width: 1000,
    height: 300,
    alignment: Alignment.topRight,
    decoration: const BoxDecoration(
      // color: Colors.red,
      image: DecorationImage(
        // scale: 1,
        alignment: Alignment.centerLeft,
        // scale: 1,

        image: AssetImage('assets/images/materials/coffe_03.png'),
      ),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          height: 300,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MainTxt(
              txt: 'Exotic Ethiopian Cofffee',
              align: TextAlign.end,
            ),
            SizedBox(
              height: 20,
            ),
            DescriptionTxt(
              description:
                  'Indulge in the rich flavors of Ethiopia with our exquisite \nEthiopian coffee. Sourced from the birthplace of coffee itself.',
              align: TextAlign.center,
            )
          ],
        ),
      ],
    ),
  ),

  // machine picture swipable

  Container(
    width: 1000,
    height: 250,
    alignment: Alignment.topRight,
    decoration: const BoxDecoration(
      image: DecorationImage(
        // scale: 4,
        alignment: Alignment.centerLeft,
        image: AssetImage('assets/images/materials/machines_01.png'),
      ),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          height: 300,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MainTxt(
              txt: 'Electrical Equipments',
              align: TextAlign.end,
            ),
            SizedBox(
              height: 30,
            ),
            DescriptionTxt(
              description:
                  'Explore our curated collection of top-tier electrical\n'
                  'equipment and appliances.From cutting-edge gadgets to \nessential home essentials.',
              align: TextAlign.center,
            )
          ],
        ),
      ],
    ),
  ),
  Container(
    width: 1000,
    height: 250,
    alignment: Alignment.topRight,
    decoration: const BoxDecoration(
      image: DecorationImage(
        // scale: 4,
        alignment: Alignment.centerLeft,
        image: AssetImage('assets/images/materials/component_12.png'),
      ),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          height: 300,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MainTxt(
              txt: 'Elevate Your Tech Game:',
              align: TextAlign.end,
            ),
            SizedBox(
              height: 30,
            ),
            DescriptionTxt(
              description: 'From powerful servers to sleek computers and robust'
                  '\nserver racks, Noon delivers the backbone of modern\ntechnology infrastructure.',
              align: TextAlign.center,
            )
          ],
        ),
      ],
    ),
  ),
];

class MainTxt extends StatelessWidget {
  const MainTxt({
    super.key,
    required this.txt,
    required this.align,
  });
  final TextAlign align;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      txt,
      style: Theme.of(context).textTheme.displayLarge,
      textAlign: TextAlign.right,
    );
  }
}

class DescriptionTxt extends StatelessWidget {
  const DescriptionTxt({
    super.key,
    required this.description,
    required this.align,
  });
  final TextAlign align;
  final String description;
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      description,
      style: Theme.of(context).textTheme.displaySmall,
      // maxLines: 3,
      textAlign: TextAlign.right,
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          // side: BorderSide(width: 3, color: Colors.amber),
          ),
      onPressed: () {},
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SelectableText(
              'Learn More',
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.tertiary,
            )
          ],
        ),
      ),
    );
  }
}
