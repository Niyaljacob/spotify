import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/model/auth/create_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq ? params}) {
    return sl <AuthRepository>().signup(params!);
  }

}