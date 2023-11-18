import 'package:alpha_system/domain/models/agro/agro_questionnaire_model.dart';
import 'package:alpha_system/presentation/home/cubit/questionnaire_cubit.dart';
import 'package:alpha_system/presentation/widgets/app_button.dart';
import 'package:alpha_system/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Inventory tab widget
class AgroQuestionnaireTabWidget extends StatelessWidget {
  ///constructor
  const AgroQuestionnaireTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((QuestionnaireCubit bloc) => bloc.state.isLoading);
    final selectedGender =
        context.select((QuestionnaireCubit bloc) => bloc.state.gender);
    final selectedMaritalStatus =
        context.select((QuestionnaireCubit bloc) => bloc.state.maritalStatus);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          AppTextField(
            title: 'Surname',
            textInputAction: TextInputAction.next,
            onChanged: (surname) =>
                context.read<QuestionnaireCubit>().setSurname(surname),
          ),
          const SizedBox(height: 20),
          AppTextField(
            title: 'Othernames',
            textInputAction: TextInputAction.next,
            onChanged: (othernames) =>
                context.read<QuestionnaireCubit>().setOtherNames(othernames),
          ),
          const SizedBox(height: 20),
          AppTextField(
            title: 'Age',
            textInputAction: TextInputAction.next,
            onChanged: (age) =>
                context.read<QuestionnaireCubit>().setAge(int.parse(age)),
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
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'Male',
                    child: Text('Male'),
                  ),
                  DropdownMenuItem(
                    value: 'Female',
                    child: Text('Female'),
                  ),
                ],
                value: selectedGender,
                onChanged: (gender) => context
                    .read<QuestionnaireCubit>()
                    .setGender(gender as String),
              ),
              AppDropDownField(
                title: 'Marital Status',
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'Married',
                    child: Text('Married'),
                  ),
                  DropdownMenuItem(
                    value: 'Single',
                    child: Text('Single'),
                  ),
                ],
                value: selectedMaritalStatus,
                onChanged: (status) => context
                    .read<QuestionnaireCubit>()
                    .setMaritalStatus(status as String),
              ),
              AppTextField(
                title: 'No of Spouse(s)',
                textInputAction: TextInputAction.next,
                onChanged: (spouses) => context
                    .read<QuestionnaireCubit>()
                    .setNoOfSpouses(int.parse(spouses)),
              ),
              AppTextField(
                title: 'No. of Children',
                textInputAction: TextInputAction.next,
                onChanged: (children) => context
                    .read<QuestionnaireCubit>()
                    .setNoOfChildren(int.parse(children)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          AppTextField(
            title: 'Next of Kin',
            textInputAction: TextInputAction.next,
            onChanged: (kin) =>
                context.read<QuestionnaireCubit>().setNextOfKin(kin),
          ),
          const SizedBox(height: 20),
          AppTextField(
            title: 'Contact Number',
            textInputAction: TextInputAction.next,
            onChanged: (phone) =>
                context.read<QuestionnaireCubit>().setContactNumber(phone),
          ),
          const SizedBox(height: 20),
          AppTextField(
            title: 'Alt. Contact Number(optional)',
            textInputAction: TextInputAction.next,
            onChanged: (altPhone) => context
                .read<QuestionnaireCubit>()
                .setAltContactNumber(altPhone),
          ),
          const SizedBox(height: 20),
          AppTextField(
            title: 'Phone no. of Next of Kin',
            textInputAction: TextInputAction.done,
            onChanged: (kinPhone) => context
                .read<QuestionnaireCubit>()
                .setPhoneNumberOfNextOfKin(kinPhone),
          ),
          const SizedBox(height: 30),
          AppButton(
            title: 'Save Form',
            onTap: () => context.read<QuestionnaireCubit>().saveAgroForm(),
            disabled: isLoading,
          ),
        ],
      ),
    );
  }
}
