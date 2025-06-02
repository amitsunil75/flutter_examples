import 'package:flutter/material.dart';

class RowImage extends StatelessWidget {
  const RowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset('assets/images/pica.jpg', height: 260,width: 190, fit: BoxFit.contain),
      //Spacer(flex: 1,),
       Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain),
        Image.asset('assets/images/pica.jpg', height: 160,width: 190, fit: BoxFit.contain)
    ]);
  }
}
