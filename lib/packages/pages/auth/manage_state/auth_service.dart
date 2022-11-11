part of '../../../../services/import/app_import.dart';

class AuthService extends ChangeNotifier {
  // * userData save email & pass
  ModelUserAuth userData = ModelUserAuth();

  set setUserEmail(String? email) => userData.email = email ?? '';
  set setUserPass(String? password) => userData.password = password ?? '';

  // * user pass
  ModelUserPass userPass = ModelUserPass();
  String currentPass = '';

  void changeUserPass() {
    if (userPass.isObscure) {
      userPass.icon = PathIcons.eyeSlashIcon;
      userPass.isObscure = false;
    } else {
      userPass.icon = PathIcons.eyeIcon;
      userPass.isObscure = true;
    }
    notifyListeners();
  }

  reset() {
    userData = ModelUserAuth();
    userPass = ModelUserPass();
    notifyListeners();
  }

  // * Firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isLoading = false;
  String errorMessage = '';

  set setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set setMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  // * Register
  Future<User?> get register async {
    try {
      setLoading = true;
      UserCredential _authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );
      late User _user;
      if (_authResult.user?.uid.isNotEmpty ?? false) {
        _user = _authResult.user!;
        setLoading = false;
      }
      return _user;
    } on SocketException {
      setLoading = false;
      setMessage = KeyLang.noInternet.tr();
      return null;
    } on FirebaseAuthException catch (error) {
      setLoading = false;
      setMessage = error.message ?? '';
      return null;
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
      return null;
    }
  }

// * login
  Future<User?> get login async {
    try {
      setLoading = true;
      UserCredential _authResult =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );
      late User _user;
      if (_authResult.user?.uid.isNotEmpty ?? false) {
        _user = _authResult.user!;
        setLoading = false;
      }
      return _user;
    } on SocketException {
      setLoading = false;
      setMessage = KeyLang.noInternet.tr();
      return null;
    } on FirebaseAuthException catch (error) {
      setLoading = false;
      setMessage = error.message ?? '';
      return null;
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
      return null;
    }
  }

//  * reset pass
  Future<bool> get resetPass async {
    try {
      setLoading = true;
      await _firebaseAuth.sendPasswordResetEmail(email: userData.email);
      setLoading = false;
      return true;
    } on SocketException {
      setLoading = false;
      setMessage = KeyLang.noInternet.tr();
      return false;
    } on FirebaseAuthException catch (error) {
      setLoading = false;
      setMessage = error.message ?? '';
      return false;
    } catch (e) {
      setLoading = false;
      setMessage = e.toString();
      return false;
    }
  }

// * signOut
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

// * get Data User
  User get currentUser => _firebaseAuth.currentUser!;

// * get User State
  Stream<User?> get userStream => _firebaseAuth.authStateChanges();
}
