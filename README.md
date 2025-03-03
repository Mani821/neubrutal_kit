# NeuBrutal Kit

[![Pub](https://img.shields.io/pub/v/neubrutal_kit.svg)](https://pub.dev/packages/neubrutal_kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A modern Flutter package providing neubrutalism-styled UI components for creating distinctive, playful interfaces with bold shadows and vivid colors. This package offers a collection of customizable widgets that follow the blocky, bold, and colorful style of the neubrutalism design trend.

![NeuBrutal Kit Header](screenshots/header.png)

## Features

NeuBrutal Kit contains the following components:

- **NeuButton**: Bold, chunky buttons with customizable colors and shadow effects
- **NeuIconButton**: Icon buttons with the neubrutalism style
- **NeuDivider**: Custom dividers with neubrutalism styling
- **NeuContainer**: Container with neubrutalism styling for creating card-like elements
- **NeuSwitch**: Toggle switches with bold, chunky styling
- **NeuTile**: Tile components for lists
- **NeuRadio**: Radio buttons with neubrutalism styling
- **NeuCheckBox**: Checkboxes with bold borders and colors
- **NeuTextfield**: Text input fields with the signature thick borders
- **NeuSnackBar**: Bold, attention-grabbing snackbar notifications
- **NeuSlider**: Sliders with chunky knobs and tracks
- **NeuRangeSlider**: Range selectors with neubrutalism styling
- **NeuSegmentControl**: Segmented controls for multiple option selection
- **NeuLoading**: Loading indicators with the neubrutalism aesthetic

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  neubrutal_kit: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:neubrutal_kit/neubrutal_kit.dart';
```

### NeuButton

```dart
NeuButton(
  onPressed: () {
    print('Button pressed!');
  },
  child: Text('Click Me'),
  backgroundColor: Colors.yellow,
  borderColor: Colors.black,
  shadowColor: Colors.black,
  borderWidth: 3,
  shadowOffset: 4,
)
```

![NeuButton Example](screenshots/neu_button.png)

### NeuContainer

```dart
NeuContainer(
  backgroundColor: Colors.pink.shade100,
  borderColor: Colors.black,
  borderWidth: 3,
  shadowOffset: 6,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('This is a NeuContainer'),
  ),
)
```

![NeuContainer Example](screenshots/neu_container.png)

### NeuTextfield

```dart
NeuTextfield(
  hintText: 'Enter text here',
  backgroundColor: Colors.white,
  borderColor: Colors.black,
  shadowColor: Colors.black,
  borderWidth: 3,
  shadowOffset: 4,
)
```

![NeuTextfield Example](screenshots/neu_textfield.png)

### NeuSwitch

```dart
NeuSwitch(
  value: _switchValue,
  onChanged: (value) {
    setState(() {
      _switchValue = value;
    });
  },
  activeColor: Colors.green,
  inactiveColor: Colors.grey,
  borderColor: Colors.black,
  shadowColor: Colors.black,
)
```

![NeuSwitch Example](screenshots/neu_switch.png)

### NeuCheckBox

```dart
NeuCheckBox(
  value: _isChecked,
  onChanged: (value) {
    setState(() {
      _isChecked = value;
    });
  },
  activeColor: Colors.blue,
  borderColor: Colors.black,
  shadowColor: Colors.black,
)
```

![NeuCheckBox Example](screenshots/neu_checkbox.png)

## Customization

All widgets support extensive customization. Here are the common properties available across most components:

- `backgroundColor`: The main color of the component
- `borderColor`: The color of the border (typically black in neubrutalism)
- `borderWidth`: Thickness of the border
- `shadowColor`: Color of the offset shadow (typically black)
- `shadowOffset`: Distance the shadow is offset (creates the 3D effect)
- `borderRadius`: Roundness of corners (typically small in neubrutalism)

## Animations

This package leverages the [flutter_animate](https://pub.dev/packages/flutter_animate) package to add smooth animations to components. Many components include optional animation properties to enhance the user experience.

## Example App

Check out the [example](example) directory for a complete sample application showcasing all the components.

```dart
import 'package:flutter/material.dart';
import 'package:neubrutal_kit/neubrutal_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeuBrutal Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('NeuBrutal Kit Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeuButton(
                onPressed: () {},
                child: const Text('NeuButton'),
                backgroundColor: Colors.yellow,
              ),
              const SizedBox(height: 16),
              NeuContainer(
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('NeuContainer'),
                ),
                backgroundColor: Colors.pink.shade100,
              ),
              // More examples...
            ],
          ),
        ),
      ),
    );
  }
}
```

## Screenshots

![Gallery View](screenshots/gallery.png)

## Contributing

Contributions are welcome! If you'd like to contribute, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.