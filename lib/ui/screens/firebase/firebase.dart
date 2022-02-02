import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({Key? key}) : super(key: key);

  @override
  _FirebaseScreenState createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Sign in anonymously'),
                onPressed: () async {
                  final UserCredential user = await auth.signInAnonymously();
                  print('User: $user');
                },
              ),
              ElevatedButton(
                  child: const Text('Sign in with email'),
                  onPressed: () async {}),
            ],
          ),
        ),
      ),
    );
  }
}

// new login class
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //sign in activity
    Future<void> _signInAnonymously() async {
      try {
//FirebaseAuth=> Firebase Authentication
        final firebaseAuth = Provider.of<FirebaseAuth>(context);

        await firebaseAuth.signInAnonymously();
      } catch (e) {
        print(e);
      }
    }

    throw UnimplementedError();
  }
}

class TheUser {
  const TheUser({required this.id});
  final String id;
}

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// It is possible to create a new user by calling the 'FirebaseTheUser' private method "TheUser".

  TheUser _userFromFirebase(User? theuser) {
    return TheUser(id: theuser!.uid);
  }

  Stream<TheUser> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Stream<TheUser> signInAnonymously() {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
    // return_userFromFirebase(theuser);
  }

  Future<void> logOut() async {
    return _firebaseAuth.signOut();
  }
}
