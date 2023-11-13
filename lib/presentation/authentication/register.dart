import 'package:alpha_system/domain/models/user_model.dart';
import 'package:alpha_system/presentation/authentication/cubit/auth_cubit.dart';
import 'package:alpha_system/presentation/widgets/app_button.dart';
import 'package:alpha_system/presentation/widgets/app_snackbar.dart';
import 'package:alpha_system/presentation/widgets/app_text_field.dart';
import 'package:alpha_system/presentation/widgets/hero_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// SIGNUP PAGE
class RegistrationPage extends StatelessWidget {
  /// Constructor
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((AuthCubit bloc) => bloc.state.isLoading);
    final selectedGender =
        context.select((AuthCubit bloc) => bloc.state.gender);
    final selectedMaritalStatus =
        context.select((AuthCubit bloc) => bloc.state.maritalStatus);
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.failure != current.failure && current.failure.isNotEmpty,
          listener: (context, state) {
            AppSnackbar.show(context, state.failure, true);
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (p, c) => c.success == 'Registration successful',
          listener: (context, state) {
            context.go('/home');
            context.read<AuthCubit>().reset();
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const HeroImage(),
                  Text(
                    'Register',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    title: 'Surname',
                    textInputAction: TextInputAction.next,
                    onChanged: (surname) =>
                        context.read<AuthCubit>().setSurname(surname),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: 'Othernames',
                    textInputAction: TextInputAction.next,
                    onChanged: (othernames) =>
                        context.read<AuthCubit>().setOtherNames(othernames),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: 'Age',
                    textInputAction: TextInputAction.next,
                    onChanged: (age) =>
                        context.read<AuthCubit>().setAge(int.parse(age)),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    padding: EdgeInsets.zero,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3,
                    children: [
                      AppDropDownField(
                        title: 'Gender',
                        items: <DropdownMenuItem<Gender>>[
                          DropdownMenuItem(
                            value: Gender.male,
                            child: Text(Gender.male.name),
                          ),
                          DropdownMenuItem(
                            value: Gender.female,
                            child: Text(Gender.female.name),
                          ),
                        ],
                        value: selectedGender,
                        onChanged: (gender) => context
                            .read<AuthCubit>()
                            .setGender(gender as Gender),
                      ),
                      AppDropDownField(
                        title: 'Marital Status',
                        items: <DropdownMenuItem<MaritalStatus>>[
                          DropdownMenuItem(
                            value: MaritalStatus.Married,
                            child: Text(MaritalStatus.Married.name),
                          ),
                          DropdownMenuItem(
                            value: MaritalStatus.Single,
                            child: Text(MaritalStatus.Single.name),
                          ),
                        ],
                        value: selectedMaritalStatus,
                        onChanged: (status) => context
                            .read<AuthCubit>()
                            .setMaritalStatus(status as MaritalStatus),
                      ),
                      AppTextField(
                        title: 'No of Spouse(s)',
                        textInputAction: TextInputAction.next,
                        onChanged: (spouses) => context
                            .read<AuthCubit>()
                            .setNoOfSpouses(int.parse(spouses)),
                      ),
                      AppTextField(
                        title: 'No. of Children',
                        textInputAction: TextInputAction.next,
                        onChanged: (children) => context
                            .read<AuthCubit>()
                            .setNoOfChildren(int.parse(children)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: 'Next of Kin',
                    textInputAction: TextInputAction.next,
                    onChanged: (kin) =>
                        context.read<AuthCubit>().setNextOfKin(kin),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: 'Contact Number',
                    textInputAction: TextInputAction.next,
                    onChanged: (phone) =>
                        context.read<AuthCubit>().setContactNumber(phone),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: 'Alt. Contact Number(optional)',
                    textInputAction: TextInputAction.next,
                    onChanged: (altPhone) =>
                        context.read<AuthCubit>().setAltContactNumber(altPhone),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: 'Phone no. of Next of Kin',
                    textInputAction: TextInputAction.done,
                    onChanged: (kinPhone) => context
                        .read<AuthCubit>()
                        .setPhoneNumberOfNextOfKin(kinPhone),
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    title: 'REGISTER',
                    onTap: () => context.read<AuthCubit>().signup(),
                    disabled: isLoading,
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () => context.push('/login'),
                    child: Text(
                      'Already have an account? Sign in',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
