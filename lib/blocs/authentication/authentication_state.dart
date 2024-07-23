part of 'authentication_bloc.dart';


enum AuthenticationStatus {authenticated, unauthenticated, unknown}

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user
  });
  final AuthenticationStatus status;
  final MyUser? user;
  // When initalize this Authenticate.unknown or authenticate or unauthenticate then it will return a instance of Authentication of this state with parameter.
  // : this._() means: Named constructors provide different ways to create objects of the same class with potentially different initialization logic.
  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(MyUser myUser) :
    this._(status: AuthenticationStatus.authenticated, user: myUser);

  const AuthenticationState.unauthenticated() :
    this._(status: AuthenticationStatus.unauthenticated);
  
  @override
  List<Object?> get props => [status, user];
}