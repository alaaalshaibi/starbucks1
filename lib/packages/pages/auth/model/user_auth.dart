class ModelUserAuth {
  String email;
  String password;

  ModelUserAuth({
    this.email = '',
    this.password = '',
  });

  setEmail(String? email) => this.email = email ?? '';
  setPass(String? password) => this.password = password ?? '';

  @override
  String toString() => 'ModelUserAuth(email: $email, password: $password)';
}
