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
