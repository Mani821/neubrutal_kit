import 'package:flutter/material.dart';
import 'package:neubrutal_kit/neubrutal_kit.dart';

class NeuSlidersDemo extends StatefulWidget {
  const NeuSlidersDemo({super.key});

  @override
  NeuSlidersDemoState createState() => NeuSlidersDemoState();
}

class NeuSlidersDemoState extends State<NeuSlidersDemo> {
  // State for single slider
  double _sliderValue = 0.5;

  // State for range slider
  RangeValues _rangeValues = const RangeValues(0.3, 0.7);

  // Color options for customization
  final List<Color> _trackColors = [
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.pink,
  ];

  // Current color indices
  int _activeTrackColorIndex = 0;
  int _inactiveTrackColorIndex = 3;
  int _thumbColor = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Single Slider Section
          _buildSectionHeader('NeuSlider'),
          const SizedBox(height: 16),
          NeuContainer(
            backgroundColor: Colors.blue.shade50,
            borderRadius: 10,
            child: Row(
              children: [
                Text(
                  "Value: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Averia",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 160),
                  transitionBuilder: (child, animation) {
                    final scaleCurve = Tween<double>(begin: 0.8, end: 1.0)
                        .chain(CurveTween(curve: Curves.easeInOut))
                        .animate(animation);

                    return ScaleTransition(scale: scaleCurve, child: child);
                  },

                  child: Text(
                    key: ValueKey(_sliderValue),

                    "${(_sliderValue * 100).toInt()}%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Averia',
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          NeuSlider(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
            activeTrackColor: _trackColors[_activeTrackColorIndex],
            inactiveTrackColor: _trackColors[_inactiveTrackColorIndex]
                .withValues(alpha: 0.3),
            borderColor: Colors.black,
            borderWidth: 2.0,
            thumbRadius: 12.0,
            trackHeight: 8.0,
            thumbColor:
                _thumbColor == -1 ? Colors.white : _trackColors[_thumbColor],
            borderRadius: 10.0,
            shadowOffset: const Offset(2, 2),
          ),
          const SizedBox(height: 30),

          // Range Slider Section
          _buildSectionHeader('NeuRangeSlider'),
          const SizedBox(height: 16),

          NeuContainer(
            backgroundColor: Colors.blue.shade50,
            borderRadius: 10,
            child: Row(
              children: [
                Text(
                  "Range: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Averia",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 160),
                  transitionBuilder: (child, animation) {
                    final scaleCurve = Tween<double>(begin: 0.8, end: 1.0)
                        .chain(CurveTween(curve: Curves.easeInOut))
                        .animate(animation);

                    return ScaleTransition(scale: scaleCurve, child: child);
                  },

                  child: Text(
                    key: ValueKey(_rangeValues.start),

                    "${(_rangeValues.start * 100).toInt()}% - ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Averia',
                      fontSize: 18,
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 160),
                  transitionBuilder: (child, animation) {
                    final scaleCurve = Tween<double>(begin: 0.8, end: 1.0)
                        .chain(CurveTween(curve: Curves.easeInOut))
                        .animate(animation);

                    return ScaleTransition(scale: scaleCurve, child: child);
                  },

                  child: Text(
                    key: ValueKey(_rangeValues.end),

                    "${(_rangeValues.end * 100).toInt()}%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Averia',
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          NeuRangeSlider(
            values: _rangeValues,
            onChanged: (values) {
              setState(() {
                _rangeValues = values;
              });
            },

            activeTrackColor: _trackColors[_activeTrackColorIndex],
            inactiveTrackColor: _trackColors[_inactiveTrackColorIndex]
                .withValues(alpha: 0.3),
            borderColor: Colors.black,
            borderWidth: 2.0,
            thumbRadius: 12.0,
            trackHeight: 8.0,
            thumbColor:
                _thumbColor == -1 ? Colors.white : _trackColors[_thumbColor],
            borderRadius: 10.0,
            shadowOffset: const Offset(2, 2),
          ),
          const SizedBox(height: 40),

          // Customization Section
          _buildSectionHeader('Customize'),

          NeuContainer(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeading('Active track color'),
                        _buildColorSelection(
                          _trackColors,
                          _activeTrackColorIndex,
                          (index) {
                            setState(() {
                              _activeTrackColorIndex = index;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeading('In-active track color'),
                        _buildColorSelection(
                          _trackColors,
                          _inactiveTrackColorIndex,
                          (index) {
                            setState(() {
                              _inactiveTrackColorIndex = index;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                NeuDivider(),
                _buildHeading('Thumb color'),
                _buildColorSelection(_trackColors, _thumbColor, (index) {
                  setState(() {
                    _thumbColor = index;
                  });
                }),
              ],
            ),
          ),

          // Color customization
          const SizedBox(height: 40),
          Center(
            child: NeuButton(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              child: Text("Reset All"),
              onPressed: () {
                setState(() {
                  _sliderValue = 0.5;
                  _rangeValues = const RangeValues(0.3, 0.7);
                  _activeTrackColorIndex = 0;
                  _inactiveTrackColorIndex = 3;
                  _thumbColor = -1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Averia',
      ),
    );
  }

  Widget _buildHeading(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Averia',
        ),
      ),
    );
  }

  Widget _buildInfoCard(String text, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildColorSelection(
    List<Color> colors,
    int selectedIndex,
    Function(int) onSelect,
  ) {
    return Row(
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: NeuCheckbox(
            inactiveColor: colors[index],
            activeColor: colors[index],
            value: selectedIndex == index,
            onChanged: (_) => onSelect(index),
          ),
        ),
      ),
    );
  }
}
