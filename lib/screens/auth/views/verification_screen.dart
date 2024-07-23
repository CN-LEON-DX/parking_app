import 'package:flutter/material.dart';
import 'package:parking_app/components/my_elevate_button.dart';

import '../../../components/my_text_field.dart';

class VerificationScreen extends StatefulWidget {
  // Lấy thông tin bên WelcomeScreen
  final String region;
  final String phone;

  VerificationScreen({super.key, required this.region, required this.phone});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool isOTPValid = false;

  bool hasInteracted = false;

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Xác thực tài khoản', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mã OTP xác thực tài khoản:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 16),
              Center(child: Image.asset('assets/chatting.png', height: 120, fit: BoxFit.contain,)),
              SizedBox(height: 16),
              Text(
                'Nhập 4 mã số được gửi đến số điện thoại của bạn SMS ${widget.region} ${widget.phone}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              
              Center(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: MyTextField(
                        controller: otpController,
                        hintText: 'Mã OTP',
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Bạn chưa nhập mã xác thực';
                            // chỉ được có 4 số hoặc 6 số
                          } else if (!RegExp(r'^[0-9]{4}$|^[0-9]{6}$').hasMatch(val)) {
                            return 'Nhập mã xác thực hợp lệ';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            hasInteracted = true;
                            isOTPValid = val != null && RegExp(r'^[0-9]{4}$|^[0-9]{6}$').hasMatch(val);
                          });
                        },
                        isValid: isOTPValid,
                        hasInteracted: hasInteracted,
                        errorMsg: 'Nhập mã otp hợp lệ',
                      ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: MyElevateButton(
                    text: 'Đăng nhập',
                    onPressed: () {
                      if (isOTPValid) {
                        // dùng bloc để xử lý và đưa ra màn hình home
                        // hơn nữa phải lấy mã từ firebase về để so sánh với mã nhập vào
                        context.read<AuthenticationBloc>().add(VerifyOTP(otpController.text));
                      }
                      
                    },
                    textField: Text(
                      'Xác nhận',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}