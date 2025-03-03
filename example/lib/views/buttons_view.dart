import 'package:flutter/material.dart';
import 'package:neubrutal_kit/neubrutal_kit.dart';

import '../showcase.dart';

class ButtonDemoView extends StatefulWidget {
  const ButtonDemoView({super.key});

  @override
  State<ButtonDemoView> createState() => _ButtonDemoViewState();
}

class _ButtonDemoViewState extends State<ButtonDemoView> {
  // Sample button colors
  final List<Color> _buttonColors = [
    Colors.white,
    Colors.amber.shade200,
    Colors.lightBlue.shade100,
    Colors.green.shade100,
    Colors.pink.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Regular buttons section
          const Padding(
            padding: EdgeInsets.only(left: 2.0, bottom: 10.0),
            child: Text(
              'NeuButton',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Averia',
              ),
            ),
          ),

          // Standard button
          NeuContainer(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Standard Button',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Averia',
                        ),
                      ),
                      const SizedBox(height: 14),
                      NeuButton(
                        onPressed: () {},
                        child: const Text('Default Button'),
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'Color Variations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Averia',
                        ),
                      ),
                    ],
                  ),
                ),
                // Button color variations in a row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final color in _buttonColors)
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: NeuButton(
                            backgroundColor: color,
                            borderColor: Colors.black,
                            onPressed: () {},
                            child: Text(
                              'Button ${_buttonColors.indexOf(color) + 1}',
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Styling Variations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Averia',
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Button styling variations
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          NeuButton(
                            borderRadius: 20,
                            onPressed: () {},
                            child: const Text('Rounded'),
                          ),
                          NeuButton(
                            borderRadius: 0,
                            onPressed: () {},
                            child: const Text('Square'),
                          ),
                          NeuButton(
                            shadowWidth: 10,
                            onPressed: () {},
                            child: const Text('Deep Shadow'),
                          ),
                          NeuButton(
                            borderColor: Colors.red,
                            onPressed: () {},
                            child: const Text('Red Border'),
                          ),
                          NeuButton(
                            onPressed: null, // Disabled
                            child: const Text('Disabled'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      const Text(
                        'With Icons',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Averia',
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Buttons with icons
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          NeuButton(
                            onPressed: () {},
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add, size: 18),
                                SizedBox(width: 8),
                                Text('Add Item'),
                              ],
                            ),
                          ),
                          NeuButton(
                            backgroundColor: Colors.blue.shade100,
                            onPressed: () {},
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Send'),
                                SizedBox(width: 8),
                                Icon(Icons.send, size: 18),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Icon buttons section
          const Padding(
            padding: EdgeInsets.only(left: 2.0, bottom: 10.0),
            child: Text(
              'NeuIconButton',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Averia',
              ),
            ),
          ),

          NeuContainer(
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            shadowBlur: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Standard Icon Buttons',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Averia',
                  ),
                ),
                const SizedBox(height: 16),
                // Row of standard icon buttons
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    NeuIconButton(
                      onPressed: () {},
                      child: const Icon(Icons.favorite),
                    ),
                    NeuIconButton(
                      onPressed: () {},
                      child: const Icon(Icons.star),
                    ),
                    NeuIconButton(
                      onPressed: () {},
                      child: const Icon(Icons.settings),
                    ),
                    NeuIconButton(
                      onPressed: () {},
                      child: const Icon(Icons.delete),
                    ),
                    NeuIconButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Color Variations',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Averia',
                  ),
                ),
                const SizedBox(height: 16),
                // Icon button color variations
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    for (final color in _buttonColors)
                      NeuIconButton(
                        backgroundColor: color,
                        onPressed: () {},
                        child: Icon(Icons.favorite, color: Colors.red.shade900),
                      ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Sizing and Style Variations',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Averia',
                  ),
                ),
                const SizedBox(height: 16),
                // Icon button size and style variations
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    NeuIconButton(
                      padding: 8,
                      onPressed: () {},
                      child: const Icon(Icons.add, size: 16),
                    ),
                    NeuIconButton(
                      padding: 20,
                      onPressed: () {},
                      child: const Icon(Icons.add, size: 24),
                    ),
                    NeuIconButton(
                      borderRadius: 20,
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                    NeuIconButton(
                      borderRadius: 0,
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                    NeuIconButton(
                      shadowWidth: 10,
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Custom Icons',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Averia',
                  ),
                ),
                const SizedBox(height: 16),
                // Icon buttons with custom styling
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    NeuIconButton(
                      backgroundColor: Colors.amber.shade100,
                      borderColor: Colors.amber.shade900,
                      onPressed: () {},
                      child: Icon(
                        Icons.notifications,
                        color: Colors.amber.shade900,
                      ),
                    ),
                    NeuIconButton(
                      backgroundColor: Colors.red.shade50,
                      borderColor: Colors.red.shade900,
                      onPressed: () {},
                      child: Icon(Icons.delete, color: Colors.red.shade900),
                    ),
                    NeuIconButton(
                      backgroundColor: Colors.green.shade100,
                      borderColor: Colors.green.shade900,
                      onPressed: () {},
                      child: Icon(Icons.check, color: Colors.green.shade900),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Interactive demo section
          const Padding(
            padding: EdgeInsets.only(left: 2.0, bottom: 10.0),
            child: Text(
              'Button Interactions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Averia',
              ),
            ),
          ),

          NeuContainer(
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            child: Column(
              children: [
                const Text(
                  'Try me! These buttons actually do something.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Averia',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                InteractiveDemoWidget(),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        ],
      ),
    );
  }
}