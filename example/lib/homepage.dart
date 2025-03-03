import 'package:flutter/material.dart';
import 'package:neubrutal_kit/neubrutal_kit.dart';
import 'package:neubrutal_kit_example/views/buttons_view.dart';
import 'package:neubrutal_kit_example/views/other_components_view.dart';
import 'package:neubrutal_kit_example/views/sliders_view.dart';
import 'package:neubrutal_kit_example/views/toggles_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NeuBrutal App'),
        titleTextStyle: TextStyle(
          fontFamily: 'Averia',
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: NeuDivider(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: NeuSegmentControl(
              segments: ['Buttons', 'Sliders', 'Toggles', 'Others'],
              selectedColor: Colors.black,
              borderRadius: 6,
              selectedTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Averia',
              ),
              unselectedTextStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'Averia',
              ),
              animationCurve: Curves.easeInOutQuint,
              onSegmentSelected: (index) {},
              pageController: pageController,
            ),
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                ButtonDemoView(),
                NeuSlidersDemo(),
                TogglesView(),
                OtherComponentsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InteractiveDemoWidget extends StatefulWidget {
  const InteractiveDemoWidget({super.key});

  @override
  InteractiveDemoWidgetState createState() => InteractiveDemoWidgetState();
}

class InteractiveDemoWidgetState extends State<InteractiveDemoWidget> {
  Color _demoColor = Colors.blue.shade100;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NeuContainer(
          padding: const EdgeInsets.all(16),
          backgroundColor: _demoColor,
          shadowColor: Colors.black,
          shadowOffset: Offset(2, 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Counter: ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Averia',
                ),
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 160),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  key: ValueKey<int>(_counter),
                  '$_counter',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFeatures: [FontFeature.tabularFigures()],
                    fontFamily: 'Averia',
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Row of interactive buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeuButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              backgroundColor: Colors.green.shade100,
              child: const Text('Increment'),
            ),
            const SizedBox(width: 12),
            NeuButton(
              onPressed: () {
                setState(() {
                  _counter--;
                });
              },
              backgroundColor: Colors.red.shade100,
              child: const Text('Decrement'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Color changing buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeuIconButton(
              onPressed: () {
                setState(() {
                  _demoColor = Colors.amber.shade100;
                });
              },
              backgroundColor: Colors.amber.shade100,
              child: const Icon(Icons.format_color_fill),
            ),
            const SizedBox(width: 12),
            NeuIconButton(
              onPressed: () {
                setState(() {
                  _demoColor = Colors.green.shade100;
                });
              },
              backgroundColor: Colors.green.shade100,
              child: const Icon(Icons.format_color_fill),
            ),
            const SizedBox(width: 12),
            NeuIconButton(
              onPressed: () {
                setState(() {
                  _demoColor = Colors.pink.shade100;
                });
              },
              backgroundColor: Colors.pink.shade100,
              child: const Icon(Icons.format_color_fill),
            ),
            const SizedBox(width: 12),
            NeuIconButton(
              onPressed: () {
                setState(() {
                  _demoColor = Colors.blue.shade100;
                });
              },
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.format_color_fill),
            ),
          ],
        ),
        const SizedBox(height: 16),
        NeuButton(
          onPressed: () {
            setState(() {
              _counter = 0;
              _demoColor = Colors.blue.shade100;
            });
          },
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
