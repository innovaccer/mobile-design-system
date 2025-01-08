import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';
class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl({required this.smartAuth});
  final SmartAuth smartAuth;
  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final response = await smartAuth.getSmsCode();
    if (response.succeed && response.codeFound) {
      return response.code!;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}
