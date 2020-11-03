import 'dart:async';
import 'validators.dart';

class Bloc extends Validators {
  final _passwordController = new StreamController<String>();
  final _emailController = new StreamController<String>();

  // Change Data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Add Data To Stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
