import 'package:flutter/material.dart';
import 'package:neubrutal_kit_example/views/sub_views/neu_check_box_view.dart';
import 'package:neubrutal_kit_example/views/sub_views/neu_radio_view.dart';
import 'package:neubrutal_kit_example/views/sub_views/neu_switch_view.dart';

class TogglesView extends StatefulWidget {
  const TogglesView({super.key});

  @override
  State<TogglesView> createState() => _TogglesViewState();
}

class _TogglesViewState extends State<TogglesView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        ListHeader(text: "Neu Switch"),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: NeuSwitchShowcasePageWrapper(),
          ),
        ),

        ListHeader(text: "Neu Checkbox"),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: NeuCheckBoxShowcasePageWrapper(),
          ),
        ),

        ListHeader(text: "Neu Radio"),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: NeuRadioShowcasePageWrapper(),
          ),
        ),
      ],
    );
  }
}

class ListHeader extends StatelessWidget {
  final String text;

  const ListHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: CustomSliverHeaderDelegate(
        collapsedHeight: 50,
        expandedHeight: 50,
        child: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'Averia',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// This wrapper ensures each instance gets a unique key
class NeuSwitchShowcasePageWrapper extends StatelessWidget {
  const NeuSwitchShowcasePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return NeuSwitchShowcasePage();
  }
}

// This wrapper ensures each instance gets a unique key
class NeuCheckBoxShowcasePageWrapper extends StatelessWidget {
  const NeuCheckBoxShowcasePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return NeuCheckboxShowcasePage();
  }
}

// This wrapper ensures each instance gets a unique key
class NeuRadioShowcasePageWrapper extends StatelessWidget {
  const NeuRadioShowcasePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return NeuRadioShowcasePage();
  }
}

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  CustomSliverHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.child,
  });

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(CustomSliverHeaderDelegate oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight ||
        collapsedHeight != oldDelegate.collapsedHeight ||
        child != oldDelegate.child;
  }
}
