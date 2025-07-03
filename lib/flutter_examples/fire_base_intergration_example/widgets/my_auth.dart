import 'package:flutter/material.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/widgets/my_widgets.dart';
import 'package:go_router/go_router.dart';

class MyAuthLogin extends StatelessWidget {
  bool isLoggedIn =
      false; // This should be replaced with actual authentication logic
  void Function() signOut;
  MyAuthLogin({super.key, required this.signOut, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8, left: 24),
          child: StyledButton(
            child: !isLoggedIn ? Text('Login',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)) : Text('Logout'),
            onPressed: () {
              !isLoggedIn ? context.push('/sign-in') : signOut();
            },
          ),
        ),
        Visibility(
          visible: isLoggedIn,
          child: StyledButton(child: Text('profile'), onPressed: (){
          context.push('/profile');
        }))
      ],
    );
  }
}
