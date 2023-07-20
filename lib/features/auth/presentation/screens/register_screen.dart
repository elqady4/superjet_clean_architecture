import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/core/widgets/m_button.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/user_cubit/user_cubit.dart';

import '../../../../core/widgets/custom_snack_bar_widget.dart';
import '../../../../core/widgets/page_back_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? phoneController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocListener<UserCubit, UserState>(
            listener: (context, state) {
              if (state is UserSuccess) {
                CustomSnackBar.show(
                  context: context,
                  message: 'Hello ${state.userEntity.name!}',
                  backgroundColor: AppColors.green,
                  duration: const Duration(seconds: 3),
                );
                BlocProvider.of<AuthCubit>(context).loggedIn(context);
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
            child: Column(
              children: [
                PageBackHeaderWidget(
                    pageTitle:
                        AppLocalizations.of(context)!.translate('newAccount')!),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              validator: validate,
                              controller: nameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  fillColor: AppColors.backColor,
                                  label: Text(AppLocalizations.of(context)!
                                      .translate('mName')!))),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                              validator: validate,
                              controller: phoneController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  fillColor: AppColors.backColor,
                                  label: Text(AppLocalizations.of(context)!
                                      .translate('mPhone')!))),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                              validator: validate,
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  fillColor: AppColors.backColor,
                                  label: Text(AppLocalizations.of(context)!
                                      .translate('mEmail')!))),
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
                                  label: Text(AppLocalizations.of(context)!
                                      .translate('mPassword')!),
                                  suffixIcon:
                                      const Icon(Icons.remove_red_eye))),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                              validator: validate,
                              controller: repasswordController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  fillColor: AppColors.backColor,
                                  label: Text(AppLocalizations.of(context)!
                                      .translate('mRePassword')!),
                                  suffixIcon:
                                      const Icon(Icons.remove_red_eye))),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 8,
                ),
                MButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (passwordController!.text ==
                            repasswordController!.text) {
                          UserEntity userEntity = UserEntity(
                            name: nameController!.text,
                            phone: phoneController!.text,
                            email: emailController!.text,
                            password: passwordController!.text,
                          );
                          BlocProvider.of<UserCubit>(context)
                              .submitSingUp(userEntity: userEntity);
                        } else {}
                      }
                    },
                    title: AppLocalizations.of(context)!.translate('register')!)
              ],
            ),
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
