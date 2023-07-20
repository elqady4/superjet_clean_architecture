import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/core/style/app_colors.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/core/widgets/center_msg.dart';
import 'package:suberjet_clean_architecture/core/widgets/m_button.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/user_data_cubit/user_data_cubit.dart';
import '../../../../core/widgets/custom_snack_bar_widget.dart';
import '../../../../core/widgets/page_back_widget.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? phoneController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              PageBackHeaderWidget(
                  pageTitle: AppLocalizations.of(context)!
                      .translate('personalInformation')!),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<UserDataCubit, UserDataState>(
                listener: (context, state) {
                  if (state is UserDataLoaded) {
                    CustomSnackBar.show(
                      context: context,
                      message: 'All Updated ${state.userEntity.name}',
                      backgroundColor: AppColors.green,
                      duration: const Duration(seconds: 3),
                    );
                  } else if (state is UserDataFailure) {
                    CustomSnackBar.show(
                      context: context,
                      message: state.msg!,
                      backgroundColor: AppColors.red,
                      duration: const Duration(seconds: 3),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UserDataLoaded) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                  validator: validate,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: state.userEntity.name,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    fillColor: AppColors.backColor,
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                  validator: validate,
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    hintText: state.userEntity.phone,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    fillColor: AppColors.backColor,
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                  validator: validate,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: state.userEntity.email,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    fillColor: AppColors.backColor,
                                  )),
                              MButton(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      // UserEntity userEntity = UserEntity(
                                      //   name: nameController!.text,
                                      //   phone: phoneController!.text,
                                      //   email: emailController!.text,
                                      //   password: passwordController!.text,
                                      // );
                                      // BlocProvider.of<UserCubit>(context)
                                      //     .submitSingUp(userEntity: userEntity);
                                    }
                                  },
                                  title: AppLocalizations.of(context)!
                                      .translate('update')!)
                            ],
                          )),
                    );
                  } else if (state is UserDataLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return CenterHintMsg(
                        msg: AppLocalizations.of(context)!
                            .translate('unexpectedError')!);
                  }
                },
              ),
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
