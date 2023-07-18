part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class VisibilityOnOffEvent extends AuthEvent {
  final bool? obscureText;
  const VisibilityOnOffEvent(this.obscureText);
}

class VisibilityOnOff1Event extends AuthEvent {
  final bool? obscureText1;
  const VisibilityOnOff1Event(this.obscureText1);
}

class VisibilityOnOff2Event extends AuthEvent {
  final bool? obscureText2;
  const VisibilityOnOff2Event(this.obscureText2);
}

class GetJobLevel extends AuthEvent {
  const GetJobLevel();
}

class EmailVerification extends AuthEvent {
  final String? name;
  final String? email;
  const EmailVerification({this.name, this.email});
}

class SendOTP extends AuthEvent {
  final String? name;
  final String? email;
  final String? otp;
  const SendOTP({this.name, this.email, this.otp});
}

class RegisterAccount extends AuthEvent {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final int? joblevel;
  const RegisterAccount(
      {this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.joblevel});
}

class EmailVerificationFromForget extends AuthEvent {
  final String? email;
  const EmailVerificationFromForget({this.email});
}

class SendOTPFromForget extends AuthEvent {
  final String? email;
  final String? otp;
  const SendOTPFromForget({this.email, this.otp});
}

class ResetPassword extends AuthEvent {
  final String? email;
  final String? password;
  final String? confirmPassword;
  const ResetPassword({this.email, this.password, this.confirmPassword});
}

class Login extends AuthEvent {
  final String? email;
  final String? password;
  const Login({this.email, this.password});
}

class OTPTimeOut extends AuthEvent {
  final bool? isTimeOut;
  const OTPTimeOut({this.isTimeOut});
}

class CheckLogin extends AuthEvent {
  final bool? isLogin;
  const CheckLogin({this.isLogin});
}
