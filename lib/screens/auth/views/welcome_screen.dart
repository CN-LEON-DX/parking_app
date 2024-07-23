import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:flag/flag.dart';
import 'package:parking_app/components/my_elevate_button.dart';
import '../../../components/my_text_field.dart';
import 'verification_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? selectedRegionCode;
  final _formKey = GlobalKey<FormState>();
  bool isPhoneNumberValid = false;
  bool hasInteracted = false;
  final TextEditingController phoneController = TextEditingController();
  final List<Map<String, String>> regionCodes = [
    {'code': '+84', 'country': 'VN'},
    {'code': '+1', 'country': 'US'},
    {'code': '+44', 'country': 'GB'},
    {'code': '+81', 'country': 'JP'},
  ];

  @override
  void initState() {
    super.initState();
    selectedRegionCode = regionCodes[0]['code']; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Lottie.asset(
                'assets/animation.json',
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
                repeat: true,
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'Welcome',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        borderRadius: BorderRadius.circular(20),
                        decoration: InputDecoration(
                          labelText: 'Quốc gia',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black87, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.blue, width: 1.5),
                          ),
                        ),
                        value: selectedRegionCode,
                        items: regionCodes.map<DropdownMenuItem<String>>((Map<String, String> value) {
                          return DropdownMenuItem<String>(
                            value: value['code'],
                            child: Row(
                              children: [
                                Flag.fromString(
                                  value['country']!,
                                  height: 20,
                                  width: 30,
                                ),
                                SizedBox(width: 10),
                                Text(value['code']!),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRegionCode = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      MyTextField(
                        controller: phoneController,
                        hintText: 'Số điện thoại',
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Bạn chưa nhập số điện thoại';
                          } else if (!RegExp(r'^[0-9]{10,}$').hasMatch(val)) {
                            return 'Nhập số điện thoại hợp lệ';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            hasInteracted = true;
                            isPhoneNumberValid = val != null && RegExp(r'^[0-9]{10,}$').hasMatch(val);
                          });
                        },
                        isValid: isPhoneNumberValid,
                        hasInteracted: hasInteracted,
                        errorMsg: 'Nhập số điện thoại hợp lệ',
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: MyElevateButton(
                          text: 'Đăng nhập',
                          onPressed: () {
                            setState(() {
                              hasInteracted = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => VerificationScreen(
                                  region: selectedRegionCode!,
                                  phone: phoneController.text,
                                )),
                              );
                            }
                          },
                          textField: Text(
                            'Đăng nhập',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
