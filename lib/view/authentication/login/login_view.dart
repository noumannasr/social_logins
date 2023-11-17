import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_logins_flutter/res/app_text.dart';
import 'package:social_logins_flutter/res/colors.dart';
import 'package:social_logins_flutter/res/text_styles.dart';
import 'package:social_logins_flutter/view/authentication/login/login_vm.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginVm(context),
      child: Consumer<LoginVm>(
        builder: (context, vm, child) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: deviceWidth,
                  child: Container(
                    // alignment: Alignment.center,
                    width: deviceWidth*0.8,
                    child: Center(
                      //
                      child: Text( 'Sign in to ' + AppText.appName+ '!', style: TextStyle(
                          fontSize:25,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.025,
                ),
                Card(
                  elevation: 2,
                  child: GestureDetector(
                    onTap: () => vm.signInWithFacebookButton(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 50,
                        width: deviceWidth*0.9,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            border: Border.all(color: AppColors.lightGreyColor, width: 1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: deviceWidth*0.15,
                              child: Center(
                                child: Image.asset('assets/images/facebook.png', fit: BoxFit.scaleDown,

                                  height: 25,
                                ),
                              ),
                            ),
                            Container(
                                width: deviceWidth*0.65,
                                child: Center(child: Text('Continue with Facebook', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),)))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                vm.isLoading ? Center(child: CircularProgressIndicator()) :
                Card(
                  elevation: 2,
                  child: GestureDetector(
                    onTap: () => vm.signInWithGoogleButton(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 50,
                        width: deviceWidth*0.9,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            border: Border.all(color: AppColors.lightGreyColor, width: 1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: deviceWidth*0.15,
                              child: Center(
                                child: Image.asset('assets/images/google.png', fit: BoxFit.scaleDown,

                                  height: 25,
                                ),
                              ),
                            ),
                            Container(
                                width: deviceWidth*0.65,
                                child: Center(child: Text('Continue with Google', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),)))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Card(
                  elevation: 0,
                  child: GestureDetector(
                    onTap: (){
                     // Navigator.pushNamed(context, RoutesName.register_view);

                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 50,
                        width: deviceWidth*0.9,
                        decoration: BoxDecoration(
                            color: AppColors.blueColor2,
                            border: Border.all(color: AppColors.lightGreyColor, width: 1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: deviceWidth*0.15,
                              child: Center(
                                child: Image.asset('assets/images/mail.png', fit: BoxFit.scaleDown, color: AppColors.whiteColor,

                                  height: 25,
                                ),
                              ),
                            ),
                            Container(
                                width: deviceWidth*0.7,

                                child: Center(child: Text('Continue with Email', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: SizedBox(
                    width: deviceWidth,
                    child: Container(
                      // alignment: Alignment.center,
                      width: deviceWidth*0.8,
                      child: Center(
                        //
                        child: Text( 'Will do it later', style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: deviceHeight * 0.02,
                ),


              ],
            ),
          );
        },
      ),
    );
  }
}
