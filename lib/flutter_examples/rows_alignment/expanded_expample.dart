import 'package:flutter/material.dart';

class ExpandedExpample extends StatelessWidget {
  const ExpandedExpample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
       Expanded(child: Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain)),
       
        Expanded(child: Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain)),
         Expanded(child: Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain)),
          Expanded(child: Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain)),
           Expanded(child: Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain)),

      ],
    );
  }
}
