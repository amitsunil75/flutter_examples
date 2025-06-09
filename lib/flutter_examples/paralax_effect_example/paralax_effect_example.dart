// Absolutely! Let's go through **all the widgets** used in your code and explain **what they are** and **what they do**, as clearly and simply as possible. Think of each widget like a building block in a LEGO set — each one has a job! 🧱

// ---

// ### 🔝 **Top-Level Widgets**

// #### 1. **`StatelessWidget`**

// * A widget that **never changes** once built.
// * Used when the UI doesn’t need to update.
// * Example: `ExampleParallax` and `LocationListItem`

// #### 2. **`StatefulWidget`**

// * Not used in this example, but worth mentioning.
// * Used when something **changes over time** (like animation, taps).

// ---

// ### 📦 **Layout Widgets**

// #### 3. **`SingleChildScrollView`**

// * Lets you **scroll** a single child widget (like a column).
// * Used here to make the list **scroll vertically**.

// #### 4. **`Column`**

// * Arranges widgets **top to bottom**.
// * Holds all the location cards in a vertical list.

// #### 5. **`Padding`**

// * Adds **space around** a widget.
// * Here, used around each location card to make them look neat.

// #### 6. **`AspectRatio`**

// * Forces a widget to keep a **width\:height ratio**.
// * Here, it keeps cards in a 16:9 shape like a TV screen.

// #### 7. **`ClipRRect`**

// * Clips (cuts) the corners of a widget to be **rounded**.
// * Makes image cards look **smooth** and not sharp.

// #### 8. **`Stack`**

// * Puts widgets on **top of each other** (like layers).
// * Used here to stack: image → gradient → text.

// #### 9. **`Positioned`**

// * Used inside a Stack to **place** widgets at specific spots.
// * Used here to position the text (`name` and `country`) at the bottom-left.

// ---

// ### 🎨 **Visual & Decorative Widgets**

// #### 10. **`Image.network()`**

// * Loads and shows an image from the **internet**.
// * The image is the **background** of each card.

// #### 11. **`DecoratedBox`**

// * Adds **visual decoration** like colors or gradients.
// * Here, it's used to make a **dark gradient** over the image so the text is easier to read.

// #### 12. **`LinearGradient`**

// * A smooth **blend between colors**.
// * Used from top (transparent) to bottom (blackish) over the image.

// ---

// ### 🔀 **Special Effect Widgets**

// #### 13. **`Flow`**

// * A very flexible layout that **manages its children manually**.
// * Doesn’t lay things out in standard ways.
// * Needs a **FlowDelegate** to tell it how to position children.

// ---

// ### 🧠 **Controller & Delegate**

// #### 14. **`FlowDelegate`**

// * Controls how `Flow` children are **placed and painted**.
// * `ParallaxFlowDelegate` calculates where to paint the background image.

// #### 15. **`Scrollable.of(context)`**

// * Finds the **scrollable area** the widget is in.
// * Used to get the scroll position.

// ---

// ### 🏷️ **Miscellaneous**

// #### 16. **`GlobalKey`**

// * A unique **ID** used to find and measure widgets (like the image size).
// * Here, used to track the background image.

// #### 17. **`BoxConstraints`**

// * Defines **how big** a widget can be (min/max width/height).
// * Used in layout methods like `getConstraintsForChild()`.

// #### 18. **`BuildContext`**

// * Gives access to **widget location** in the widget tree.
// * Needed to find scroll position, widget sizes, themes, etc.

// #### 19. **`Text`**

// * Displays **text** on screen.
// * Used here to show the place name and country.

// ---

// ### 💡 Bonus: Flutter Terminology

// #### 20. **`context.paintChild()`**

// * Part of custom painting.
// * Tells Flutter: “draw this child widget here!”

// #### 21. **`Transform.translate()`**

// * Moves a widget by a certain amount.
// * Used to shift the background image slightly for parallax.

// ---

// ### Summary Table

// | Widget                   | What It Does                               |
// | ------------------------ | ------------------------------------------ |
// | `SingleChildScrollView`  | Makes content scrollable                   |
// | `Column`                 | Arranges children vertically               |
// | `Padding`                | Adds space around content                  |
// | `AspectRatio`            | Keeps child in 16:9 shape                  |
// | `ClipRRect`              | Rounds corners of a widget                 |
// | `Stack`                  | Layers widgets on top of each other        |
// | `Positioned`             | Places widgets in a stack                  |
// | `Image.network`          | Loads image from internet                  |
// | `DecoratedBox`           | Adds decoration like gradients             |
// | `Flow`                   | Custom layout controlled by `FlowDelegate` |
// | `Text`                   | Displays text                              |
// | `LinearGradient`         | Creates smooth color fade                  |
// | `GlobalKey`              | Helps find widget size or state            |
// | `FlowDelegate`           | Custom controller for `Flow`               |
// | `Scrollable.of(context)` | Finds the scroll position                  |

// ---

// Would you like me to mark or draw this layout visually too, like a diagram? That might make it even easier!





import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class ExampleParallax extends StatelessWidget {
  const ExampleParallax({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final location in locations)
            LocationListItem(
              imageUrl: location.imageUrl,
              name: location.name,
              country: location.place,
            ),
        ],
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  LocationListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.country,
  });

  final String imageUrl;
  final String name;
  final String country;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.network(imageUrl, key: _backgroundImageKey, fit: BoxFit.cover),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);


  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(
      0.0,
      1.0,
    );

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect = verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    // Paint the background.
    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(0.0, childRect.top),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }

}

class Parallax extends SingleChildRenderObjectWidget {
  const Parallax({super.key, required Widget background})
    : super(child: background);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderParallax(scrollable: Scrollable.of(context));
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderParallax renderObject,
  ) {
    renderObject.scrollable = Scrollable.of(context);
  }
}

class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderParallax extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderParallax({required ScrollableState scrollable})
    : _scrollable = scrollable;

  ScrollableState _scrollable;

  ScrollableState get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    if (value != _scrollable) {
      if (attached) {
        _scrollable.position.removeListener(markNeedsLayout);
      }
      _scrollable = value;
      if (attached) {
        _scrollable.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! ParallaxParentData) {
      child.parentData = ParallaxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    // Force the background to take up all available width
    // and then scale its height based on the image's aspect ratio.
    final background = child!;
    final backgroundImageConstraints = BoxConstraints.tightFor(
      width: size.width,
    );
    background.layout(backgroundImageConstraints, parentUsesSize: true);

    // Set the background's local offset, which is zero.
    (background.parentData as ParallaxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Get the size of the scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;

    // Calculate the global position of this list item.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final backgroundOffset = localToGlobal(
      size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final scrollFraction = (backgroundOffset.dy / viewportDimension).clamp(
      0.0,
      1.0,
    );

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect = verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    // Paint the background.
    context.paintChild(
      background,
      (background.parentData as ParallaxParentData).offset +
          offset +
          Offset(0.0, childRect.top),
    );
  }
}

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const urlPrefix =
    'https://docs.flutter.dev/cookbook/img-files/effects/parallax';
const locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl: '$urlPrefix/01-mount-rushmore.jpg',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    imageUrl: '$urlPrefix/02-singapore.jpg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl: '$urlPrefix/03-machu-picchu.jpg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl: '$urlPrefix/04-vitznau.jpg',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl: '$urlPrefix/05-bali.jpg',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl: '$urlPrefix/06-mexico-city.jpg',
  ),
  Location(name: 'Cairo', place: 'Egypt', imageUrl: '$urlPrefix/07-cairo.jpg'),
];