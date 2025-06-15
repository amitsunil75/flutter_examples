// Flow class
// A widget that sizes and positions children efficiently, according to the logic in a FlowDelegate.
// Flow layouts are optimized for repositioning children using transformation matrices.

// The flow container is sized independently from the children by the FlowDelegate.getSize function of the delegate. The children are then sized independently given the constraints from the FlowDelegate.getConstraintsForChild function.

// Rather than positioning the children during layout, the children are positioned using transformation matrices during the paint phase using the matrices from the FlowDelegate.paintChildren function. The children can be repositioned efficiently by only repainting the flow, which happens without the children being laid out again (contrast this with a Stack, which does the sizing and positioning together during layout).

// The most efficient way to trigger a repaint of the flow is to supply an animation to the constructor of the FlowDelegate. The flow will listen to this animation and repaint whenever the animation ticks, avoiding both the build and layout phases of the pipeline.
import 'package:flutter/material.dart';

class FlutterFlowExample extends StatefulWidget {
  const FlutterFlowExample({super.key});

  @override
  State<FlutterFlowExample> createState() => _FlutterFlowExampleState();
}

class _FlutterFlowExampleState extends State<FlutterFlowExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = [
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];
  void _updqateMenu(IconData icon) {
    if (icon != lastTapped) {
      setState(() {
        lastTapped = icon;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );
    super.initState();
  }

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter =
        MediaQuery.of(context).size.width / menuItems.length;
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 8.0),
      child: RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updqateMenu(icon);
        _animationController.status == AnimationStatus.completed
            ? _animationController.reverse()
            : _animationController.forward();
       if(icon!=Icons.menu) {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(icon: icon),
          ),
        );
       }
        },
        child: Icon(icon,color: Colors.white,size: 45,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Flow(
          delegate: FlowMenuDelegate(animationController: _animationController),
          children: menuItems.map((IconData icon)=>flowMenuItem(icon)).toList(),
        ),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> animationController;
   FlowMenuDelegate({required this.animationController}):super(repaint:animationController);
   @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate){
    return animationController !=oldDelegate.animationController;
   }
 @override
  void paintChildren(FlowPaintingContext context){
  double dx=0.0;
  for(int i=0;i<context.childCount;i++){
    dx=context.getChildSize(i)!.width*i;
    context.paintChild(i,transform: Matrix4.translationValues(dx*animationController.value, 0, 0));
  }
 }
  
  
}



class DetailPage extends StatelessWidget {
  final IconData icon;
  const DetailPage({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: Center(
        child: Icon(icon, size: 100, color: Colors.blue),
      ),
    );
  }
}
