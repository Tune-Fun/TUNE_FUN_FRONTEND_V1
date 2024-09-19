import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';
import 'package:tunefun_front/presentation/views/auth/choice_login_type_view.dart';
import 'package:tunefun_front/presentation/views/auth/signup_main_view.dart';
import 'package:tunefun_front/theme/pallete.dart';

class InduceAuthScreen extends StatelessWidget {
  const InduceAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImageConstants.induceAuthIcon,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChoiceLoginTypeScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 50, bottom: 30),
              child: GradientContainer(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  borderRadius: BorderRadius.circular(100),
                  type: "fill",
                  child: const Center(
                      child: Text(
                    "로그인",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.white),
                  ))),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpMainScreen()));
            },
            child: const Text(
              "회원가입",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
