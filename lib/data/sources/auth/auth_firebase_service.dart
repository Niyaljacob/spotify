import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/model/auth/create_user_req.dart';
import 'package:spotify/data/model/auth/signin_user_req.dart';

abstract class AuthFirebaseService{
  Future<Either>sigup(CreateUserReq createUserReq);
  Future<Either>signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email, 
        password: signinUserReq.password
        );

        return const Right('Signin was Successfull');

    }on FirebaseAuthException catch(e){
      String message = '';

      if(e.code == 'invalid-email'){
        message = 'Not User found for that email';
      }else if(e.code=='invalid-credential'){
        message = 'Wrong password provided for that user';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sigup(CreateUserReq createUserReq)async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email, 
        password: createUserReq.password
        );

        return const Right('Signup was Successfull');

    }on FirebaseAuthException catch(e){
      String message = '';

      if(e.code == 'weak-password'){
        message = 'The password is too weak';
      }else if(e.code=='email-already-in-use'){
        message = 'An account already exists with that email';
      }
      return Left(message);
    }
  }
  
}