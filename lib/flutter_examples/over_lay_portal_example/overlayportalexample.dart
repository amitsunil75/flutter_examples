import 'package:flutter/material.dart';

class Overlayportalexample extends StatefulWidget {
  const Overlayportalexample({super.key});

  @override
  State<Overlayportalexample> createState() => _OverlayportalexampleState();
}

class _OverlayportalexampleState extends State<Overlayportalexample> {
  @override
  Widget build(BuildContext context) {
    var controller = OverlayPortalController();

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              // style: ButtonStyle(
              //   textStyle:WidgetStateTextStyle. ,
              // ),
              onPressed:controller.toggle,
              child: OverlayPortal(
                controller: controller,
                overlayChildBuilder: (context) {
                  return Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    color: Colors.red,),
                    child: Text('Overlay Portal'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
