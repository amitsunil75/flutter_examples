import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/flutter_examples/fire_base_intergration_example/services/application_state.dart';
import 'package:flutter_tutorials/flutter_examples/fllutter_bloc_example/bloc_from_api/bloc/user_bloc.dart' show UserBloc, FetchUsers;
import 'package:flutter_tutorials/flutter_examples/fllutter_bloc_example/bloc_from_api/models/user_repository.dart';
import 'package:flutter_tutorials/flutter_examples/fllutter_bloc_example/user_screen.dart';
import 'package:flutter_tutorials/flutter_examples/flutter_pdf_design/flutter_resume_design.dart';
import 'package:flutter_tutorials/flutter_examples/focus_widget_example_flutter/bank_example_from_json.dart';
import 'package:provider/provider.dart';

import 'flutter_examples/fllutter_bloc_example/flutter_bloc_state_managemant.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return // SwitchApp();
    MaterialApp(
      title: 'Flutter tutorial',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.bounceOut,
      home:ResumePreviewPage()
      // home: RepositoryProvider(
      //   create: (_) => UserRepository(),
      //   child: BlocProvider(
      //     create: (context) =>
      //         UserBloc(repository: context.read<UserRepository>())..add(FetchUsers()),
      //     child: const UserScreen(),
      //   ),
      // ),
    
      //   home: BlocProvider(
      //   create: (_) => LoanBloc(LoanRepository())..add(FetchLoanRequests()),
      //   child: LoanDashboard(),
      // ),
      //home: const BankJsonApp(),
    );
  }
}
