import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ------------------ Model ------------------
class Loan {
  final String id;
  final String customerName;
  final double amount;
  final bool approved;

  Loan({required this.id, required this.customerName, required this.amount, this.approved = false});
}

// ------------------ Repository ------------------
class LoanRepository {
  final List<Loan> _loans = [
    Loan(id: '1', customerName: 'John Doe', amount: 50000),
    Loan(id: '2', customerName: 'Jane Smith', amount: 30000),
    Loan(id: '3', customerName: 'Bob Johnson', amount: 15000),
  ];

  Future<List<Loan>> getPendingLoans() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _loans;
  }

  Future<void> approveLoan(String id) async {
    await Future.delayed(Duration(milliseconds: 200));
    _loans.removeWhere((loan) => loan.id == id);
  }

  Future<void> rejectLoan(String id) async {
    await Future.delayed(Duration(milliseconds: 200));
    _loans.removeWhere((loan) => loan.id == id);
  }
}

// ------------------ BLoC ------------------
abstract class LoanEvent {}

class FetchLoanRequests extends LoanEvent {}

class ApproveLoan extends LoanEvent {
  final String loanId;
  ApproveLoan(this.loanId);
}

class RejectLoan extends LoanEvent {
  final String loanId;
  RejectLoan(this.loanId);
}

abstract class LoanState {}

class LoanInitial extends LoanState {}

class LoanLoading extends LoanState {}

class LoanLoaded extends LoanState {
  final List<Loan> loans;
  LoanLoaded(this.loans);
}

class LoanError extends LoanState {
  final String message;
  LoanError(this.message);
}

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  final LoanRepository repository;

  LoanBloc(this.repository) : super(LoanInitial()) {
    on<FetchLoanRequests>(_onFetchLoans);
    on<ApproveLoan>(_onApproveLoan);
    on<RejectLoan>(_onRejectLoan);
  }

  Future<void> _onFetchLoans(FetchLoanRequests event, Emitter<LoanState> emit) async {
    emit(LoanLoading());
    try {
      final loans = await repository.getPendingLoans();
      emit(LoanLoaded(loans));
    } catch (e) {
      emit(LoanError('Failed to load loans'));
    }
  }

  Future<void> _onApproveLoan(ApproveLoan event, Emitter<LoanState> emit) async {
    await repository.approveLoan(event.loanId);
    add(FetchLoanRequests());
  }

  Future<void> _onRejectLoan(RejectLoan event, Emitter<LoanState> emit) async {
    await repository.rejectLoan(event.loanId);
    add(FetchLoanRequests());
  }
}

// ------------------ UI ------------------
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BlocProvider(
//         create: (_) => LoanBloc(LoanRepository())..add(FetchLoanRequests()),
//         child: LoanDashboard(),
//       ),
//     );
//   }
// }

class LoanDashboard extends StatelessWidget {
  const LoanDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loan Approval Dashboard')),
      body: BlocBuilder<LoanBloc, LoanState>(
        builder: (context, state) {
          if (state is LoanLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoanLoaded) {
            return ListView.builder(
              itemCount: state.loans.length,
              itemBuilder: (context, index) {
                final loan = state.loans[index];
                return ListTile(
                  title: Text(loan.customerName),
                  subtitle: Text('Amount: ₹${loan.amount}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.check, color: Colors.green),
                        onPressed: () =>
                            context.read<LoanBloc>().add(ApproveLoan(loan.id)),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.red),
                        onPressed: () =>
                            context.read<LoanBloc>().add(RejectLoan(loan.id)),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is LoanError) {
            return Center(child: Text(state.message));
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
