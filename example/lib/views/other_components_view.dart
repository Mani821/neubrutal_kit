import 'package:flutter/material.dart';
import 'package:neubrutal_kit/neubrutal_kit.dart';

class OtherComponentsView extends StatefulWidget {
  const OtherComponentsView({super.key});

  @override
  State<OtherComponentsView> createState() => _OtherComponentsViewState();
}

class _OtherComponentsViewState extends State<OtherComponentsView> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 14,
        children: [
          _buildListTileShowcase(),
          _buildLoadingShowcase(),
          _buildSnackBarShowcase(context),
          _buildTextFieldShowcase(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        ],
      ),
    );
  }

  Widget _buildListTileShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Basic List Tile'),
        NeuListTile(title: const Text('Basic List Tile'), onTap: () {}),
        const SizedBox(height: 16),

        _buildSectionTitle('List Tile with Leading & Trailing'),
        NeuListTile(
          title: const Text('Settings', style: TextStyle(fontFamily: 'Averia')),
          subtitle: const Text(
            'App preferences and configurations',
            style: TextStyle(fontFamily: 'Averia'),
          ),
          leading: const Icon(Icons.settings),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        const SizedBox(height: 16),

        _buildSectionTitle('Custom Styled List Tile'),
        NeuListTile(
          title: const Text(
            'Custom Style',
            style: TextStyle(fontFamily: 'Averia'),
          ),
          subtitle: const Text(
            'With custom colors and borders',
            style: TextStyle(fontFamily: 'Averia'),
          ),
          leading: const Icon(Icons.color_lens, color: Colors.purple),
          backgroundColor: Colors.purple.shade50,
          borderColor: Colors.purple,
          onTap: () {},
        ),
        const SizedBox(height: 16),

        _buildSectionTitle('Selected List Tile'),
        NeuListTile(
          title: const Text(
            'Selected Item',
            style: TextStyle(fontFamily: 'Averia'),
          ),
          selected: true,
          selectedBackgroundColor: Colors.blue.shade100,
          leading: const Icon(Icons.check_circle, color: Colors.blue),
          onTap: () {},
        ),
      ],
    );
  }

  // NeuLoading showcase
  Widget _buildLoadingShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Loading Indicator'),
        const SizedBox(height: 16),
        const Center(child: NeuLoading()),
        const SizedBox(height: 32),
      ],
    );
  }

  // NeuSnackBar showcase
  Widget _buildSnackBarShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('SnackBar Examples'),
        const SizedBox(height: 16),

        // Basic SnackBar
        NeuButton(
          onPressed: () {
            NeuSnackBar.show(
              context: context,
              message: 'This is a basic snackbar',
            );
          },
          child: Text('Show Basic SnackBar'),
        ),
        const SizedBox(height: 16),

        // SnackBar with Action
        NeuButton(
          onPressed: () {
            NeuSnackBar.show(
              context: context,
              message: 'Item saved successfully!',
              action: () {
                // Do something when action pressed
              },
              actionLabel: 'UNDO',
            );
          },
          child: Text('SnackBar with Action'),
        ),
        const SizedBox(height: 16),

        // Custom SnackBar
        NeuButton(
          onPressed: () {
            NeuSnackBar.show(
              context: context,
              message: 'Custom styled snackbar',
              config: const NeuSnackBarConfig(
                backgroundColor: Colors.amber,
                textColor: Colors.black,
                borderColor: Colors.deepOrange,
                borderRadius: 12.0,
              ),
              action: () {},
              actionLabel: 'NICE!',
            );
          },
          child: Text('Custom Styled SnackBar'),
        ),
      ],
    );
  }

  // NeuTextField showcase
  Widget _buildTextFieldShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Basic Text Field'),
        NeuTextField(controller: _textController, hint: 'Enter your name'),
        const SizedBox(height: 24),

        _buildSectionTitle('Text Field with Validation'),
        NeuTextField(
          controller: TextEditingController(),
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email';
            }
            if (!value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('Password Field'),
        NeuTextField(
          controller: TextEditingController(),
          hint: 'Enter your password',
          obscureText: true,
          isPasswordField: true,
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('Custom Styled Text Field'),
        NeuTextField(
          controller: TextEditingController(),
          hint: 'Custom styling',
          borderColor: Colors.purple,
          shadowColor: Colors.purple.withValues(alpha: 0.5),
          backgroundColor: Colors.purple.shade50,
          borderWidth: 3.0,
          borderRadius: BorderRadius.circular(16),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
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
}
