import 'package:spotify/data/model/auth/create_user_req.dart';

abstract class AuthRepository{
  Future<void>signup(CreateUserReq createUserReq);

  Future<void>signin();
}