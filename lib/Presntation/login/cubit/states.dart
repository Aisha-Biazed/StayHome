abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {}


class CreateLoadingState extends LoginStates {}

class CreateSuccessState extends LoginStates {}

class CreateErrorState extends LoginStates {}
