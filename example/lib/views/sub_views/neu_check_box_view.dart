import 'package:flutter/material.dart';
import 'package:neubrutal_kit/neubrutal_kit.dart';


class NeuCheckboxShowcasePage extends StatefulWidget {
  const NeuCheckboxShowcasePage({super.key});

  @override
  State<NeuCheckboxShowcasePage> createState() => _NeuCheckboxShowcasePageState();
}

class _NeuCheckboxShowcasePageState extends State<NeuCheckboxShowcasePage> {
  // State variables for all the checkboxes
  final Map<String, bool> _checkboxStates = {
    'basic': false,
    'small': false,
    'medium': false,
    'large': false,
    'xlarge': false,
    'blue': false,
    'red': false,
    'green': false,
    'purple': false,
    'gold': false,
    'monochrome': false,
    'pastel': false,
    'roundedNone': false,
    'roundedSmall': false,
    'roundedMedium': false,
    'roundedLarge': false,
    'shadowThin': false,
    'shadowMedium': false,
    'shadowThick': false,
    'shadowFlat': false,
    'shadowExaggerated': false,
    'animationFast': false,
    'animationDefault': false,
    'animationSlow': false,
    'animationSubtle': false,
    'animationExtreme': false,
    'checkDefault': false,
    'checkCustomIcon1': false,
    'checkCustomIcon2': false,
    'checkCustomIcon3': false,
    'checkCustomWidget': false,
    'termsAndConditions': false,
    'newsletter': false,
    'notifications': false,
    'todoDone': true,
    'todoInProgress': false,
    'todoNotStarted': false,
  };

  void _toggleCheckbox(String key) {
    setState(() {
      _checkboxStates[key] = !(_checkboxStates[key] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('1. Basic NeuCheckbox'),
          _buildShowcaseItem(
            'Default configuration',
            NeuCheckbox(
              value: _checkboxStates['basic']!,
              onChanged: (value) => _toggleCheckbox('basic'),
            ),
          ),

          _buildDivider(),

          _buildSectionTitle('2. Size Variations'),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildLabeledCheckbox(
                'Small',
                NeuCheckbox(
                  value: _checkboxStates['small']!,
                  onChanged: (value) => _toggleCheckbox('small'),
                  size: 20.0,
                ),
              ),
              _buildLabeledCheckbox(
                'Medium (Default)',
                NeuCheckbox(
                  value: _checkboxStates['medium']!,
                  onChanged: (value) => _toggleCheckbox('medium'),
                  // Default size is 30.0
                ),
              ),
              _buildLabeledCheckbox(
                'Large',
                NeuCheckbox(
                  value: _checkboxStates['large']!,
                  onChanged: (value) => _toggleCheckbox('large'),
                  size: 40.0,
                ),
              ),
              _buildLabeledCheckbox(
                'X-Large',
                NeuCheckbox(
                  value: _checkboxStates['xlarge']!,
                  onChanged: (value) => _toggleCheckbox('xlarge'),
                  size: 50.0,
                ),
              ),
            ],
          ),

          _buildDivider(),

          _buildSectionTitle('3. Color Variations'),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildLabeledCheckbox(
                'Blue (Default)',
                NeuCheckbox(
                  value: _checkboxStates['blue']!,
                  onChanged: (value) => _toggleCheckbox('blue'),
                  activeColor: Colors.blue,
                ),
              ),
              _buildLabeledCheckbox(
                'Red',
                NeuCheckbox(
                  value: _checkboxStates['red']!,
                  onChanged: (value) => _toggleCheckbox('red'),
                  activeColor: Colors.red,
                ),
              ),
              _buildLabeledCheckbox(
                'Green',
                NeuCheckbox(
                  value: _checkboxStates['green']!,
                  onChanged: (value) => _toggleCheckbox('green'),
                  activeColor: Colors.green,
                ),
              ),
              _buildLabeledCheckbox(
                'Purple',
                NeuCheckbox(
                  value: _checkboxStates['purple']!,
                  onChanged: (value) => _toggleCheckbox('purple'),
                  activeColor: Colors.purple,
                ),
              ),
              _buildLabeledCheckbox(
                'Gold/Black',
                NeuCheckbox(
                  value: _checkboxStates['gold']!,
                  onChanged: (value) => _toggleCheckbox('gold'),
                  activeColor: const Color(0xFFFFD700),
                  checkColor: Colors.black,
                ),
              ),
              _buildLabeledCheckbox(
                'Monochrome',
                NeuCheckbox(
                  value: _checkboxStates['monochrome']!,
                  onChanged: (value) => _toggleCheckbox('monochrome'),
                  activeColor: Colors.black,
                  inactiveColor: Colors.white,
                  borderColor: Colors.black,
                  checkColor: Colors.white,
                ),
              ),
              _buildLabeledCheckbox(
                'Pastel',
                NeuCheckbox(
                  value: _checkboxStates['pastel']!,
                  onChanged: (value) => _toggleCheckbox('pastel'),
                  activeColor: const Color(0xFFAAE0F5),
                  inactiveColor: const Color(0xFFF5F5F5),
                  borderColor: const Color(0xFF6D8E99),
                  checkColor: const Color(0xFF6D8E99),
                ),
              ),
            ],
          ),

          _buildDivider(),

          _buildSectionTitle('4. Border Radius Variations'),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildLabeledCheckbox(
                'Square',
                NeuCheckbox(
                  value: _checkboxStates['roundedNone']!,
                  onChanged: (value) => _toggleCheckbox('roundedNone'),
                  borderRadius: 0.0,
                ),
              ),
              _buildLabeledCheckbox(
                'Slightly Rounded',
                NeuCheckbox(
                  value: _checkboxStates['roundedSmall']!,
                  onChanged: (value) => _toggleCheckbox('roundedSmall'),
                  borderRadius: 3.0,
                ),
              ),
              _buildLabeledCheckbox(
                'Medium Rounded (Default)',
                NeuCheckbox(
                  value: _checkboxStates['roundedMedium']!,
                  onChanged: (value) => _toggleCheckbox('roundedMedium'),
                  // Default borderRadius is 6.0
                ),
              ),
              _buildLabeledCheckbox(
                'Highly Rounded',
                NeuCheckbox(
                  value: _checkboxStates['roundedLarge']!,
                  onChanged: (value) => _toggleCheckbox('roundedLarge'),
                  borderRadius: 12.0,
                ),
              ),
            ],
          ),

          _buildDivider(),

          _buildSectionTitle('5. Shadow & Border Width Variations'),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildLabeledCheckbox(
                'Thin Shadow',
                NeuCheckbox(
                  value: _checkboxStates['shadowThin']!,
                  onChanged: (value) => _toggleCheckbox('shadowThin'),
                  shadowWidth: 2.0,
                  topLeftBorderWidth: 1.0,
                ),
              ),
              _buildLabeledCheckbox(
                'Medium Shadow (Default)',
                NeuCheckbox(
                  value: _checkboxStates['shadowMedium']!,
                  onChanged: (value) => _toggleCheckbox('shadowMedium'),
                  // Default shadowWidth is 5.0
                  // Default topLeftBorderWidth is 1.5
                ),
              ),
              _buildLabeledCheckbox(
                'Thick Shadow',
                NeuCheckbox(
                  value: _checkboxStates['shadowThick']!,
                  onChanged: (value) => _toggleCheckbox('shadowThick'),
                  shadowWidth: 8.0,
                  topLeftBorderWidth: 2.5,
                ),
              ),
              _buildLabeledCheckbox(
                'Exaggerated Shadow',
                NeuCheckbox(
                  value: _checkboxStates['shadowExaggerated']!,
                  onChanged: (value) => _toggleCheckbox('shadowExaggerated'),
                  shadowWidth: 10.0,
                  topLeftBorderWidth: 1.0,
                ),
              ),
            ],
          ),

          _buildDivider(),

          _buildSectionTitle('6. Animation Variations'),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildLabeledCheckbox(
                'Fast Animation',
                NeuCheckbox(
                  value: _checkboxStates['animationFast']!,
                  onChanged: (value) => _toggleCheckbox('animationFast'),
                  animationDurationMs: 70,
                ),
              ),
              _buildLabeledCheckbox(
                'Default Animation',
                NeuCheckbox(
                  value: _checkboxStates['animationDefault']!,
                  onChanged: (value) => _toggleCheckbox('animationDefault'),
                  // Default animationDurationMs is 140
                ),
              ),
              _buildLabeledCheckbox(
                'Slow Animation',
                NeuCheckbox(
                  value: _checkboxStates['animationSlow']!,
                  onChanged: (value) => _toggleCheckbox('animationSlow'),
                  animationDurationMs: 400,
                ),
              ),
              _buildLabeledCheckbox(
                'Subtle Movement',
                NeuCheckbox(
                  value: _checkboxStates['animationSubtle']!,
                  onChanged: (value) => _toggleCheckbox('animationSubtle'),
                  checkedOffsetX: 1.0,
                  checkedOffsetY: 0.7,
                ),
              ),
              _buildLabeledCheckbox(
                'Extreme Movement',
                NeuCheckbox(
                  value: _checkboxStates['animationExtreme']!,
                  onChanged: (value) => _toggleCheckbox('animationExtreme'),
                  checkedOffsetX: 4.0,
                  checkedOffsetY: 3.0,
                ),
              ),
            ],
          ),

          _buildDivider(),

          _buildSectionTitle('7. Custom Check Indicators'),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildLabeledCheckbox(
                'Default Check',
                NeuCheckbox(
                  value: _checkboxStates['checkDefault']!,
                  onChanged: (value) => _toggleCheckbox('checkDefault'),
                  // Default uses Icons.check
                ),
              ),
              _buildLabeledCheckbox(
                'Filled',
                NeuCheckbox(
                  value: _checkboxStates['checkCustomIcon1']!,
                  onChanged: (value) => _toggleCheckbox('checkCustomIcon1'),
                  customCheckWidget: const Icon(
                    Icons.check_box,
                    color: Colors.white,
                  ),
                ),
              ),
              _buildLabeledCheckbox(
                'Star',
                NeuCheckbox(
                  value: _checkboxStates['checkCustomIcon2']!,
                  onChanged: (value) => _toggleCheckbox('checkCustomIcon2'),
                  customCheckWidget: const Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                ),
              ),
              _buildLabeledCheckbox(
                'Done',
                NeuCheckbox(
                  value: _checkboxStates['checkCustomIcon3']!,
                  onChanged: (value) => _toggleCheckbox('checkCustomIcon3'),
                  activeColor: Colors.green,
                  customCheckWidget: const Icon(
                    Icons.done_all,
                    color: Colors.white,
                  ),
                ),
              ),
              _buildLabeledCheckbox(
                'Text Widget',
                NeuCheckbox(
                  value: _checkboxStates['checkCustomWidget']!,
                  onChanged: (value) => _toggleCheckbox('checkCustomWidget'),
                  size: 36.0,
                  activeColor: Colors.purple,
                  customCheckWidget: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),

          _buildDivider(),

          _buildSectionTitle('8. Real-world Examples'),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFormCheckbox(
                  'termsAndConditions',
                  'I agree to the Terms and Conditions',
                  'You must agree to continue',
                ),
                const SizedBox(height: 12),
                _buildFormCheckbox(
                  'newsletter',
                  'Subscribe to our newsletter',
                  'Get updates on new products and offers',
                ),
                const SizedBox(height: 12),
                _buildFormCheckbox(
                  'notifications',
                  'Enable push notifications',
                  'We\'ll notify you about important updates',
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Task List',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _buildTodoItem(
                  'todoDone',
                  'Create UI design',
                  true,
                  Colors.green,
                ),
                const SizedBox(height: 12),
                _buildTodoItem(
                  'todoInProgress',
                  'Implement components',
                  false,
                  Colors.orange,
                ),
                const SizedBox(height: 12),
                _buildTodoItem(
                  'todoNotStarted',
                  'Write documentation',
                  false,
                  Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
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

  Widget _buildShowcaseItem(String label, Widget checkboxWidget) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          checkboxWidget,
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 16,fontFamily: 'Averia'),
          ),
        ],
      ),
    );
  }

  Widget _buildLabeledCheckbox(String label, Widget checkbox) {
    return Column(
      children: [
        checkbox,
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12,fontFamily: 'Averia'),
          textAlign: TextAlign.center,

        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: NeuDivider(),
    );
  }

  Widget _buildFormCheckbox(String key, String label, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: NeuCheckbox(
            value: _checkboxStates[key]!,
            onChanged: (value) => _toggleCheckbox(key),
            size: 22.0,
            activeColor: key == 'termsAndConditions' ? Colors.blue : Colors.purple,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTodoItem(String key, String task, bool completed, Color activeColor) {
    return Row(
      children: [
        NeuCheckbox(
          value: _checkboxStates[key]!,
          onChanged: (value) => _toggleCheckbox(key),
          size: 24.0,
          activeColor: activeColor,
          customCheckWidget: Icon(
            Icons.done,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            task,
            style: TextStyle(
              decoration: completed ? TextDecoration.lineThrough : null,
              color: completed ? Colors.grey : Colors.black,
            ),
          ),
        ),
        Icon(
          Icons.more_vert,
          color: Colors.grey,
          size: 18,
        ),
      ],
    );
  }
}