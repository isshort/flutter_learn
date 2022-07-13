import 'package:flutter/material.dart';
import 'package:slider_todo/src/utils/carousel_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView Title')),
      body: Column(children: [
        CarouselSlider.builder(
          itemCount: 6,
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.2,
              viewportFraction: 1,
              autoPlay: true),
          itemBuilder: (context, index, realIndex) => Row(
            children: const [
              _CustomCard(
                color: Colors.green,
              ),
              _CustomCard(
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Button'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color,
        child: const Placeholder(),
      ),
    );
  }
}
