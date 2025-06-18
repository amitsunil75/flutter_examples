import 'package:flutter/material.dart';


class FormKeyTextFiledExample extends StatefulWidget {
  const FormKeyTextFiledExample({super.key});

  @override
  State<FormKeyTextFiledExample> createState() => _FormKeyTextFiledExampleState();
}

class _FormKeyTextFiledExampleState extends State<FormKeyTextFiledExample> {
  final TextEditingController _textEditingController = TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Key Text Field Example'),
      ),
      body:Form(
        key: _formKey,
        child: Column(
          children: [
           
            TextFormField(
              controller: _textEditingController,
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'Please enter some text';
                }else if(value.length<5){
                  return 'Please enter at least 5 characters';
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: (){
             
              if( _formKey.currentState!.validate()){ 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form is valid'))
                );

              }
            }, child: Text('Validate'))
          ],
        ),
      )
    );
  }
}