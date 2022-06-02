import 'package:flutter/material.dart';

class CustomeWidgetLearn extends StatelessWidget with _ColorsUtility {
  CustomeWidgetLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomFoodButton(title: 'Food')),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomFoodButton(title: 'Food'),
          ),
        ],
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color white = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(9);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16);
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // minimumSize: const Size(20, 50),
        primary: redColor,
        shape: const StadiumBorder(),
      ),
      onPressed: () {},
      child: Padding(
        padding: normalPadding,
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
