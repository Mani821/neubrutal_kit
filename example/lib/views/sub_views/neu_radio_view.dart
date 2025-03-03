import 'package:flutter/material.dart';
import 'package:neubrutal_kit/neubrutal_kit.dart';

class NeuRadioShowcasePage extends StatefulWidget {
  const NeuRadioShowcasePage({super.key});

  @override
  State<NeuRadioShowcasePage> createState() => _NeuRadioShowcasePageState();
}

class _NeuRadioShowcasePageState extends State<NeuRadioShowcasePage> {
  // State variables for different radio groups
  String _basicGroupValue = 'option1';
  String _sizesGroupValue = 'medium';
  String _colorsGroupValue = 'blue';
  String _shadowsGroupValue = 'medium';
  String _animationsGroupValue = 'default';
  String _customIndicatorsValue = 'default';
  String _realWorldAppsValue = 'shipping';
  int _numberValue = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('1. Basic NeuRadio Group'),
          _buildBasicRadioGroup(),

          _buildDivider(),

          _buildSectionTitle('2. Size Variations'),
          _buildSizeVariations(),

          _buildDivider(),

          _buildSectionTitle('3. Color Variations'),
          _buildColorVariations(),

          _buildDivider(),

          _buildSectionTitle('4. Shadow & Border Width Variations'),
          _buildShadowVariations(),

          _buildDivider(),

          _buildSectionTitle('5. Animation Variations'),
          _buildAnimationVariations(),

          _buildDivider(),

          _buildSectionTitle('6. Custom Indicators'),
          _buildCustomIndicators(),

          _buildDivider(),

          _buildSectionTitle('7. Different Data Types'),
          _buildDifferentDataTypes(),

          _buildDivider(),

          _buildSectionTitle('8. Real-world Applications'),
          _buildRealWorldApplications(),

          SizedBox(height: 50)
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
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

  Widget _buildDivider() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: NeuDivider()
    );
  }

  Widget _buildBasicRadioGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Default configuration with labels:', style: TextStyle(fontFamily: 'Averia'),),
        const SizedBox(height: 12),
        Row(
          children: [
            NeuRadio<String>(
              value: 'option1',
              groupValue: _basicGroupValue,
              onChanged: (value) => setState(() => _basicGroupValue = value),
            ),
            const SizedBox(width: 8),
            const Text('Option 1', style: TextStyle(fontFamily: 'Averia'),),
            const SizedBox(width: 24),
            NeuRadio<String>(
              value: 'option2',
              groupValue: _basicGroupValue,
              onChanged: (value) => setState(() => _basicGroupValue = value),
            ),
            const SizedBox(width: 8),
            const Text('Option 2', style: TextStyle(fontFamily: 'Averia'),),
            const SizedBox(width: 24),
            NeuRadio<String>(
              value: 'option3',
              groupValue: _basicGroupValue,
              onChanged: (value) => setState(() => _basicGroupValue = value),
            ),
            const SizedBox(width: 8),
            const Text('Option 3', style: TextStyle(fontFamily: 'Averia'),),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeVariations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Different sizes:', style: TextStyle(fontFamily: 'Averia'),),
        const SizedBox(height: 12),
        Row(
          children: [
            Column(
              children: [
                NeuRadio<String>(
                  value: 'small',
                  groupValue: _sizesGroupValue,
                  onChanged: (value) => setState(() => _sizesGroupValue = value),
                  size: 20.0,
                ),
                const SizedBox(height: 4),
                const Text('Small', style:TextStyle(fontSize: 12, fontFamily: 'Averia')),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                NeuRadio<String>(
                  value: 'medium',
                  groupValue: _sizesGroupValue,
                  onChanged: (value) => setState(() => _sizesGroupValue = value),
                  size: 30.0, // Default size
                ),
                const SizedBox(height: 4),
                const Text('Medium', style: TextStyle(fontSize: 12, fontFamily: 'Averia')),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                NeuRadio<String>(
                  value: 'large',
                  groupValue: _sizesGroupValue,
                  onChanged: (value) => setState(() => _sizesGroupValue = value),
                  size: 40.0,
                ),
                const SizedBox(height: 4),
                const Text('Large', style: TextStyle(fontSize: 12, fontFamily: 'Averia')),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              children: [
                NeuRadio<String>(
                  value: 'xlarge',
                  groupValue: _sizesGroupValue,
                  onChanged: (value) => setState(() => _sizesGroupValue = value),
                  size: 50.0,
                ),
                const SizedBox(height: 4),
                const Text('X-Large', style: TextStyle(fontSize: 12, fontFamily: 'Averia')),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorVariations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Different color combinations:', style: TextStyle(fontFamily: 'Averia'),),
        const SizedBox(height: 12),
        Wrap(
          spacing: 24,
          runSpacing: 16,
          children: [
            _buildColorOption(
              'blue',
              'Blue',
              Colors.blue,
              Colors.white,
              Colors.black,
              Colors.white,
            ),
            _buildColorOption(
              'red',
              'Red',
              Colors.red,
              Colors.white,
              Colors.black,
              Colors.white,
            ),
            _buildColorOption(
              'green',
              'Green',
              Colors.green,
              Colors.white,
              Colors.black,
              Colors.white,
            ),
            _buildColorOption(
              'purple',
              'Purple',
              Colors.purple,
              Colors.white,
              Colors.black,
              Colors.white,
            ),
            _buildColorOption(
              'gold',
              'Gold/Black',
              const Color(0xFFFFD700),
              Colors.white,
              Colors.black,
              Colors.black,
            ),
            _buildColorOption(
              'monochrome',
              'Monochrome',
              Colors.black,
              Colors.white,
              Colors.black,
              Colors.white,
            ),
            _buildColorOption(
              'pastel',
              'Pastel',
              const Color(0xFFAAE0F5),
              const Color(0xFFF5F5F5),
              const Color(0xFF6D8E99),
              const Color(0xFF6D8E99),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorOption(
      String value,
      String label,
      Color activeColor,
      Color inactiveColor,
      Color borderColor,
      Color indicatorColor,
      ) {
    return Column(
      children: [
        NeuRadio<String>(
          value: value,
          groupValue: _colorsGroupValue,
          onChanged: (value) => setState(() => _colorsGroupValue = value),
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          borderColor: borderColor,
          indicatorColor: indicatorColor,
          // Add shadow color matching border color for consistent look
          shadowColor: borderColor,
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, fontFamily: 'Averia')),
      ],
    );
  }

  Widget _buildShadowVariations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Different shadow and border styles:', style: TextStyle(fontFamily: 'Averia'),),
        const SizedBox(height: 12),
        Wrap(
          spacing: 24,
          runSpacing: 16,
          children: [
            _buildShadowOption(
              'thin',
              'Thin',
              const Offset(2.0, 2.0),
              0.0,
              1.0,
            ),
            _buildShadowOption(
              'medium',
              'Medium',
              const Offset(5.0, 5.0), // Default
              0.0,
              2.0, // Default border width
            ),
            _buildShadowOption(
              'thick',
              'Thick',
              const Offset(8.0, 8.0),
              0.0,
              3.0,
            ),
            _buildShadowOption(
              'flat',
              'Flat',
              Offset.zero,
              0.0,
              2.0,
            ),
            _buildShadowOption(
              'blurred',
              'Blurred',
              const Offset(5.0, 5.0),
              3.0,
              2.0,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShadowOption(
      String value,
      String label,
      Offset shadowOffset,
      double shadowBlurRadius,
      double borderWidth,
      ) {
    return Column(
      children: [
        NeuRadio<String>(
          value: value,
          groupValue: _shadowsGroupValue,
          onChanged: (value) => setState(() => _shadowsGroupValue = value),
          activeColor: Colors.blue,
          shadowOffset: shadowOffset,
          shadowBlurRadius: shadowBlurRadius,
          borderWidth: borderWidth,
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, fontFamily: 'Averia')),
      ],
    );
  }

  Widget _buildAnimationVariations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Different animation speeds and offsets:', style: TextStyle(fontFamily: 'Averia'),),
        const SizedBox(height: 12),
        Wrap(
          spacing: 24,
          runSpacing: 16,
          children: [
            _buildAnimationOption(
              'default',
              'Default',
              140, // Default duration
              2.0, // Default X offset
              1.4, // Default Y offset
            ),
            _buildAnimationOption(
              'fast',
              'Fast',
              70, // Faster
              2.0,
              1.4,
            ),
            _buildAnimationOption(
              'slow',
              'Slow',
              400, // Slower
              2.0,
              1.4,
            ),
            _buildAnimationOption(
              'subtle',
              'Subtle',
              140,
              1.0, // Less X offset
              0.7, // Less Y offset
            ),
            _buildAnimationOption(
              'extreme',
              'Extreme',
              140,
              4.0, // More X offset
              3.0, // More Y offset
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAnimationOption(
      String value,
      String label,
      int animationDurationMs,
      double selectedOffsetX,
      double selectedOffsetY,
      ) {
    return Column(
      children: [
        NeuRadio<String>(
          value: value,
          groupValue: _animationsGroupValue,
          onChanged: (value) => setState(() => _animationsGroupValue = value),
          animationDurationMs: animationDurationMs,
          selectedOffsetX: selectedOffsetX,
          selectedOffsetY: selectedOffsetY,
          activeColor: Colors.blue,
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, fontFamily: 'Averia')),
      ],
    );
  }

  Widget _buildCustomIndicators() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Custom indicator widgets:', style: TextStyle(fontFamily: 'Averia')),
        const SizedBox(height: 12),
        Wrap(
          spacing: 24,
          runSpacing: 16,
          children: [
            Column(
              children: [
                NeuRadio<String>(
                  value: 'default',
                  groupValue: _customIndicatorsValue,
                  onChanged: (value) => setState(() => _customIndicatorsValue = value),
                  activeColor: Colors.blue,
                  // Uses default circle indicator
                ),
                const SizedBox(height: 4),
                const Text('Default', style:TextStyle(fontSize: 12, fontFamily: 'Averia')),
              ],
            ),
            Column(
              children: [
                NeuRadio<String>(
                  value: 'check',
                  groupValue: _customIndicatorsValue,
                  onChanged: (value) => setState(() => _customIndicatorsValue = value),
                  activeColor: Colors.blue,
                  customIndicatorWidget: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Check', style: TextStyle(fontSize: 12, fontFamily: 'Averia')),
              ],
            ),
            Column(
              children: [
                NeuRadio<String>(
                  value: 'star',
                  groupValue: _customIndicatorsValue,
                  onChanged: (value) => setState(() => _customIndicatorsValue = value),
                  activeColor: Colors.blue,
                  customIndicatorWidget: const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Star', style: TextStyle(fontSize: 12, fontFamily: 'Averia')),
              ],
            ),
            Column(
              children: [
                NeuRadio<String>(
                  value: 'heart',
                  groupValue: _customIndicatorsValue,
                  onChanged: (value) => setState(() => _customIndicatorsValue = value),
                  activeColor: Colors.red,
                  customIndicatorWidget: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Heart', style: TextStyle(fontSize: 12, fontFamily: 'Averia')),
              ],
            ),
            Column(
              children: [
                NeuRadio<String>(
                  value: 'text',
                  groupValue: _customIndicatorsValue,
                  onChanged: (value) => setState(() => _customIndicatorsValue = value),
                  activeColor: Colors.green,
                  size: 36.0,
                  customIndicatorWidget: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Text', style: TextStyle(fontSize: 12, fontFamily: 'Averia')),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDifferentDataTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Using different data types (int):', style: TextStyle(
          fontFamily: 'Averia',
        )),
        const SizedBox(height: 12),
        Row(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                children: [
                  NeuRadio<int>(
                    value: index + 1,
                    groupValue: _numberValue,
                    onChanged: (value) => setState(() => _numberValue = value),
                    activeColor: Colors.indigo,
                    size: 28.0,
                  ),
                  const SizedBox(height: 4),
                  Text('${index + 1}', style: const TextStyle(fontSize: 12, fontFamily: 'Averia')),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildRealWorldApplications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Shipping method selection:', style: TextStyle(
          fontFamily: 'Averia',
        )),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              _buildShippingOption(
                'standard',
                'Standard Shipping',
                '3-5 business days',
                '\$4.99',
                Icons.local_shipping,
              ),
              const SizedBox(height: 12),
              _buildShippingOption(
                'express',
                'Express Shipping',
                '2-3 business days',
                '\$9.99',
                Icons.delivery_dining,
              ),
              const SizedBox(height: 12),
              _buildShippingOption(
                'overnight',
                'Overnight Shipping',
                'Next business day',
                '\$19.99',
                Icons.flight_takeoff,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShippingOption(
      String value,
      String title,
      String description,
      String price,
      IconData icon,
      ) {
    final isSelected = _realWorldAppsValue == value;

    return InkWell(
      onTap: () => setState(() => _realWorldAppsValue = value),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            NeuRadio<String>(
              value: value,
              groupValue: _realWorldAppsValue,
              onChanged: (value) => setState(() => _realWorldAppsValue = value),
              activeColor: Colors.blue,
              indicatorColor: Colors.white,
              size: 24.0,
              // Make shadow smaller for this use case
              shadowOffset: const Offset(3.0, 3.0),
              borderWidth: 1.5,
            ),
            const SizedBox(width: 12),
            Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.blue : Colors.black,
                      fontFamily: 'Averia',
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: isSelected ? Colors.blue.shade700 : Colors.grey.shade600,
                      fontSize: 12,
                      fontFamily: 'Averia',
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Averia',
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}