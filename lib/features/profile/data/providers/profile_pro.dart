import 'package:clothly/core/constants/typedef.dart';
import 'package:clothly/features/auth/data/models/user_model.dart';
import 'package:clothly/features/profile/data/repositories/profile_repo.dart';

class ProfilePro {
      final ProfileRepo profileRepo;

  ProfilePro({required this.profileRepo});
  Future <UserModel?> update({required parameters params})async{
    try{
     parameters data = await profileRepo.updateProfile(params);

    if(data != {}){
      print("data $data");
      return UserModel.fromJson(data);
    }
    }catch(e){
      print("error profile pro ${e.toString()}");
    }
    return null;
  }
}
