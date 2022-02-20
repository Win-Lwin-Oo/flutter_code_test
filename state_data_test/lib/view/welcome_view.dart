import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:state_data_test/component/account_button.dart';
import 'package:state_data_test/constant/desired_screen_size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:state_data_test/view/create_account_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  Widget welcomeTitle({required String title}) {
    return Text(title,
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
  }

  Widget welcomeSubtitle({required String subtitle}) {
    return Text(subtitle, style: const TextStyle(fontSize: 16));
  }

  Widget loginButton({required String title, FaIcon? faIcon}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            SizedBox(
              width: 30.w,
            ),
            if (faIcon != null) faIcon,
          ],
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 15)),
            textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
        designSize: const Size(DESIRE_WIDTH, DESIRE_HEIGHT),
        builder: () => Scaffold(
              backgroundColor: const Color(0xFFFFFFFF),
              body: Stack(
                children: [
                  Image.asset('assets/images/welcome.png'),
                  Positioned(
                      top: 220.h,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/clouds.png',
                        ),
                      )),
                  Positioned(
                      top: 40.h, left: 10.w, child: const Icon(Icons.close)),
                  Positioned(
                    top: 340.h,
                    left: 30.w,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        welcomeTitle(title: 'Welcome to'),
                        welcomeTitle(title: 'Ready To Travel'),
                        const SizedBox(
                          height: 20,
                        ),
                        welcomeSubtitle(
                            subtitle: 'Sign up with facebook for the most'),
                        welcomeSubtitle(
                            subtitle:
                                'fulfilling trip planning experience with us!'),
                      ],
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          loginButton(
                              title: 'Log in with Facebook',
                              faIcon: const FaIcon(
                                  FontAwesomeIcons.facebookSquare)),
                          loginButton(
                            title: 'Log in with email address',
                          ),
                          AccountButton(
                            title: 'Create a new account',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccountView()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
