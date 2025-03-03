import 'package:flutter/material.dart';
import 'package:neubrutal_kit/neubrutal_kit.dart';

class NeuSwitchShowcasePage extends StatefulWidget {
  const NeuSwitchShowcasePage({super.key});

  @override
  State<NeuSwitchShowcasePage> createState() => _NeuSwitchShowcasePageState();
}

class _NeuSwitchShowcasePageState extends State<NeuSwitchShowcasePage> {
  // State variables for all the switches
  final Map<String, bool> _switchValues = {
    'defaultSwitch': false,
    'sizeSwitch1': false,
    'sizeSwitch2': false,
    'sizeSwitch3': false,
    'colorSwitch1': false,
    'colorSwitch2': false,
    'colorSwitch3': false,
    'borderSwitch1': false,
    'borderSwitch2': false,
    'borderSwitch3': false,
    'animationSwitch1': false,
    'animationSwitch2': false,
    'animationSwitch3': false,
    'disabledSwitch': false,
  };

  void _updateSwitchValue(String key, bool value) {
    setState(() {
      _switchValues[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('1. Default NeuSwitch'),
          _buildShowcaseItem(
            'Default configuration',
            NeuSwitch(
              value: _switchValues['defaultSwitch']!,
              onChanged: (value) => _updateSwitchValue('defaultSwitch', value),
            ),
          ),

          _buildDivider(),

          _buildSectionTitle('2. Size Variations'),
          _buildShowcaseItem(
            'Small size',
            NeuSwitch(
              value: _switchValues['sizeSwitch1']!,
              onChanged: (value) => _updateSwitchValue('sizeSwitch1', value),
              width: 50.0,
              height: 28.0,
              thumbWidth: 24.0,
            ),
          ),
          _buildShowcaseItem(
            'Medium size (default)',
            NeuSwitch(
              value: _switchValues['sizeSwitch2']!,
              onChanged: (value) => _updateSwitchValue('sizeSwitch2', value),
            ),
          ),
          _buildShowcaseItem(
            'Large size',
            NeuSwitch(
              value: _switchValues['sizeSwitch3']!,
              onChanged: (value) => _updateSwitchValue('sizeSwitch3', value),
              width: 80.0,
              height: 42.0,
              thumbWidth: 38.0,
            ),
          ),

          _buildDivider(
            alignment: Alignment.centerRight,
          ),

          _buildSectionTitle('3. Color Variations'),
          _buildShowcaseItem(
            'Red active thumb',
            NeuSwitch(
              value: _switchValues['colorSwitch1']!,
              onChanged: (value) => _updateSwitchValue('colorSwitch1', value),
              activeThumbColor: Colors.red,
            ),
          ),
          _buildShowcaseItem(
            'Green with custom border',
            NeuSwitch(
              value: _switchValues['colorSwitch2']!,
              onChanged: (value) => _updateSwitchValue('colorSwitch2', value),
              activeThumbColor: Colors.green,
              activeBorderColor: Colors.green.shade900,
              inactiveBorderColor: Colors.grey.shade700,
            ),
          ),
          _buildShowcaseItem(
            'Purple with background',
            NeuSwitch(
              value: _switchValues['colorSwitch3']!,
              onChanged: (value) => _updateSwitchValue('colorSwitch3', value),
              activeThumbColor: Colors.purple,
              backgroundColor: Colors.purple.withValues(alpha: 0.1),
            ),
          ),

          _buildDivider(),

          _buildSectionTitle('4. Border Radius Variations'),
          _buildShowcaseItem(
            'Square borders',
            NeuSwitch(
              value: _switchValues['borderSwitch1']!,
              onChanged: (value) => _updateSwitchValue('borderSwitch1', value),
              borderRadius: 0.0,
              thumbBorderRadius: 0.0,
            ),
          ),
          _buildShowcaseItem(
            'Medium radius (default)',
            NeuSwitch(
              value: _switchValues['borderSwitch2']!,
              onChanged: (value) => _updateSwitchValue('borderSwitch2', value),
            ),
          ),
          _buildShowcaseItem(
            'Circular thumb',
            NeuSwitch(
              value: _switchValues['borderSwitch3']!,
              onChanged: (value) => _updateSwitchValue('borderSwitch3', value),
              borderRadius: 20.0,
              thumbBorderRadius: 15.0,
            ),
          ),

          _buildDivider(
            alignment: Alignment.centerRight,
          ),

          _buildSectionTitle('5. Animation Variations'),
          _buildShowcaseItem(
            'Fast animation',
            NeuSwitch(
              value: _switchValues['animationSwitch1']!,
              onChanged:
                  (value) => _updateSwitchValue('animationSwitch1', value),
              toggleDuration: const Duration(milliseconds: 50),
              slideDuration: const Duration(milliseconds: 100),
            ),
          ),
          _buildShowcaseItem(
            'Bounce curve',
            NeuSwitch(
              value: _switchValues['animationSwitch2']!,
              onChanged:
                  (value) => _updateSwitchValue('animationSwitch2', value),
              slideCurve: Curves.bounceOut,
              slideDuration: const Duration(milliseconds: 600),
            ),
          ),
          _buildShowcaseItem(
            'Elastic curve',
            NeuSwitch(
              value: _switchValues['animationSwitch3']!,
              onChanged:
                  (value) => _updateSwitchValue('animationSwitch3', value),
              slideCurve: Curves.elasticOut,
              slideDuration: const Duration(milliseconds: 800),
            ),
          ),

          _buildDivider(),

          _buildSectionTitle('6. Border Width Variations'),
          _buildShowcaseItem(
            'Thin borders',
            NeuSwitch(
              value: _switchValues['borderSwitch1']!,
              onChanged: (value) => _updateSwitchValue('borderSwitch1', value),
              primaryBorderWidth: 2.0,
              secondaryBorderWidth: 1.0,
              thumbBorderWidth: 1.0,
            ),
          ),
          _buildShowcaseItem(
            'Medium borders (default)',
            NeuSwitch(
              value: _switchValues['borderSwitch2']!,
              onChanged: (value) => _updateSwitchValue('borderSwitch2', value),
            ),
          ),
          _buildShowcaseItem(
            'Thick borders',
            NeuSwitch(
              value: _switchValues['borderSwitch3']!,
              onChanged: (value) => _updateSwitchValue('borderSwitch3', value),
              primaryBorderWidth: 8.0,
              secondaryBorderWidth: 2.5,
              thumbBorderWidth: 2.0,
            ),
          ),

          _buildDivider(),

          _buildSectionTitle('7. Special States'),
          _buildShowcaseItem(
            'Disabled state',
            NeuSwitch(
              value: _switchValues['disabledSwitch']!,
              onChanged: (value) => _updateSwitchValue('disabledSwitch', value),
              disabled: true,
            ),
          ),
          _buildShowcaseItem(
            'Custom disabled opacity',
            NeuSwitch(
              value: _switchValues['disabledSwitch']!,
              onChanged: (value) => _updateSwitchValue('disabledSwitch', value),
              disabled: true,
              disabledOpacity: 0.3,
            ),
          ),

          _buildDivider(),

          _buildSectionTitle('8. Creative Examples'),
          _buildShowcaseItem(
            'Day/Night toggle',
            Row(
              children: [
                const Icon(Icons.wb_sunny, color: Colors.orange),
                const SizedBox(width: 8),
                NeuSwitch(
                  value: _switchValues['colorSwitch1']!,
                  onChanged:
                      (value) => _updateSwitchValue('colorSwitch1', value),
                  inactiveThumbColor: Colors.orange,
                  activeThumbColor: Colors.indigo,
                  width: 70.0,
                  borderRadius: 20.0,
                  thumbBorderRadius: 20.0,
                ),
                const SizedBox(width: 8),
                const Icon(Icons.nightlight_round, color: Colors.indigo),
              ],
            ),
          ),
          _buildShowcaseItem(
            'Premium toggle',
            NeuSwitch(
              value: _switchValues['colorSwitch2']!,
              onChanged: (value) => _updateSwitchValue('colorSwitch2', value),
              activeThumbColor: const Color(0xFFFFD700), // Gold
              inactiveThumbColor: Colors.white,
              activeBorderColor: const Color(0xFF8B4513), // Bronze
              inactiveBorderColor: Colors.black,
              width: 65.0,
              height: 34.0,
              thumbWidth: 32.0,
              borderRadius: 8.0,
              thumbBorderRadius: 6.0,
            ),
          ),
          _buildShowcaseItem(
            'Playful toggle',
            NeuSwitch(
              value: _switchValues['colorSwitch3']!,
              onChanged: (value) => _updateSwitchValue('colorSwitch3', value),
              activeThumbColor: Colors.pink,
              inactiveThumbColor: Colors.cyan,
              backgroundColor: Colors.grey.withValues(alpha: 0.1),
              slideCurve: Curves.bounceOut,
              slideDuration: const Duration(milliseconds: 600),
              borderRadius: 16.0,
              thumbBorderRadius: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Averia',
        ),
      ),
    );
  }

  Widget _buildShowcaseItem(String label, Widget switchWidget) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontFamily: 'Averia'),
            ),
          ),
          Expanded(flex: 1, child: Center(child: switchWidget)),
        ],
      ),
    );
  }

  Widget _buildDivider({Alignment alignment = Alignment.centerLeft,}
      ) {
    return NeuDivider(
      animationAlignment: alignment,
    );
  }
}
