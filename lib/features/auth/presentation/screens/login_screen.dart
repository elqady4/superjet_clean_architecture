import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';
import 'package:suberjet_clean_architecture/core/widgets/custom_snack_bar_widget.dart';
import 'package:suberjet_clean_architecture/core/widgets/m_button.dart';
import 'package:suberjet_clean_architecture/core/widgets/page_back_widget.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/user_cubit/user_cubit.dart';

import '../../../../core/utils/app_strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  CustomSnackBar.show(
                    context: context,
                    message: 'Hello //${state.userId}',
                    backgroundColor: AppColors.green,
                    duration: const Duration(seconds: 3),
                  );
                }
                if (state is UnAuthenticated) {
                  CustomSnackBar.show(
                    context: context,
                    message: 'Hello ${state.msg}',
                    backgroundColor: AppColors.green,
                    duration: const Duration(seconds: 3),
                  );
                }
              },
            ),
            BlocListener<UserCubit, UserState>(
              listener: (context, state) {
                if (state is UserSuccess) {
                  BlocProvider.of<AuthCubit>(context).loggedIn();
                  Navigator.pop(context);
                } else if (state is UserFailure) {
                  CustomSnackBar.show(
                    context: context,
                    message: state.msg,
                    backgroundColor: AppColors.red,
                    duration: const Duration(seconds: 3),
                  );
                }
              },
            ),
          ],
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PageBackHeaderWidget(
                      pageTitle: AppStrings.loginAccount),
                  Image.asset(
                    'assets/home/SA.png',
                    width: 150,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                validator: validate,
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    fillColor: AppColors.backColor,
                                    label: const Text(AppStrings.mEmail))),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                                validator: validate,
                                controller: passwordController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    fillColor: AppColors.backColor,
                                    label: const Text(AppStrings.mPassword),
                                    suffixIcon:
                                        const Icon(Icons.remove_red_eye))),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, Routes.registerRoute),
                          child: CenterHintMsg(
                              color: AppColors.green,
                              msg: AppStrings.registerNow)),
                      MButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<UserCubit>(context).submitSignIn(
                                  userEntity: UserEntity(
                                      email: emailController!.text,
                                      password: passwordController!.text));
                            }
                          },
                          title: AppStrings.login),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? validate(value) {
    if (value == null || value.isEmpty) {
      return AppStrings.valueCantBeEmpty;
    }
    return null;
  }
}