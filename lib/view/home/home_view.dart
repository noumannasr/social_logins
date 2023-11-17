import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_logins_flutter/model/user_model.dart';
import 'package:social_logins_flutter/res/app_text.dart';
import 'package:social_logins_flutter/res/colors.dart';
import 'package:social_logins_flutter/view/home/home_vm.dart';

class HomeView extends StatelessWidget {
  final UserModel userModel;
  const HomeView({super.key, required this.userModel,});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
  create: (BuildContext context) => HomeVm(context),
  child: Consumer<HomeVm>(
  builder: (context, vm, child) {
  return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // HeaderItem(
          //   icon: AppImages.imgLogin,
          //   islamic: AppImages.islamic1,
          // ),
          SizedBox(
            width: deviceWidth,
            child: Container(
              // alignment: Alignment.center,
              width: deviceWidth*0.8,
              child: Center(
                //
                child: Text( 'Home ' + AppText.appName+ '!', style: TextStyle(
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
              onTap: (){

              },
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
                          child: Image.network(userModel.photo, fit: BoxFit.scaleDown,

                            height: 25,
                          ),
                        ),
                      ),
                      Container(
                          width: deviceWidth*0.65,
                          child: Center(child: Text(userModel.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),)))
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
              onTap: () => vm.signOut(),
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
                          child: Icon(Icons.logout, size: 25,color: Colors.white,)
                        ),
                      ),
                      Container(
                          width: deviceWidth*0.7,

                          child: Center(child: Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)))
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.04,
          ),



        ],
      ),
    );
  },
),
);
  }
}
