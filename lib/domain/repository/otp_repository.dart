import 'package:tunefun_front/domain/model/data_state_model.dart';

abstract class OtpRepository {
  Future<DataState> verifyOTP(String type, String otp);
  Future<DataState> resendOTP(String type);
}
