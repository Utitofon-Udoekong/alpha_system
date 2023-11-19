import 'package:alpha_system/presentation/constants/enums.dart';
import 'package:alpha_system/presentation/home/cubit/questionnaire_cubit.dart';
import 'package:alpha_system/presentation/widgets/app_button.dart';
import 'package:alpha_system/presentation/widgets/app_radio_groups.dart';
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
    final selectedAge =
        context.select((QuestionnaireCubit bloc) => bloc.state.age);
    final selectedEducationalLevel =
        context.select((QuestionnaireCubit bloc) => bloc.state.educationalLevel);
    final methodOfFarming =
        context.select((QuestionnaireCubit bloc) => bloc.state.methodOfFarming);
    final preferredFertilizers = context
        .select((QuestionnaireCubit bloc) => bloc.state.preferredFertilizers);
    final typeOfFarming =
        context.select((QuestionnaireCubit bloc) => bloc.state.typeofFarming);
    final typesOfMachineryNeeded = context
        .select((QuestionnaireCubit bloc) => bloc.state.typesOfMachineryNeeded);
    final useAgroChemicals = context
        .select((QuestionnaireCubit bloc) => bloc.state.useAgroChemicals);
    final useFertilizer =
        context.select((QuestionnaireCubit bloc) => bloc.state.useFertilizer);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),

          ///////////////////////////////////////////////////////
          //--------------------BIO DATA-----------------------//
          ///////////////////////////////////////////////////////
          Text(
            'BIO DATA',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextWithAppTextField(
            title: 'Name',
            textInputAction: TextInputAction.next,
            onChanged: (name) =>
                context.read<QuestionnaireCubit>().setName(name),
          ),
          AppDropDownField(
            title: 'Gender',
            items: genderEnum,
            value: selectedGender,
            onChanged: (gender) =>
                context.read<QuestionnaireCubit>().setGender(gender as String),
          ),
          AppDropDownField(
            title: 'Age',
            items: ageEnum,
            value: selectedAge,
            onChanged: (age) =>
                context.read<QuestionnaireCubit>().setAge(age as String),
          ),
          AppDropDownField(
            title: 'Educational Level',
            items: educationalLevelEnum,
            value: selectedEducationalLevel,
            onChanged: (educationalLevel) => context
                .read<QuestionnaireCubit>()
                .setEducationalLevel(educationalLevel as String),
          ),
          TextWithAppTextField(
            title: 'LGA',
            textInputAction: TextInputAction.next,
            onChanged: (lga) => context.read<QuestionnaireCubit>().setLGA(lga),
          ),
          TextWithAppTextField(
            title: 'Ward',
            textInputAction: TextInputAction.next,
            onChanged: (ward) =>
                context.read<QuestionnaireCubit>().setWard(ward),
          ),
          TextWithAppTextField(
            title: 'Village',
            textInputAction: TextInputAction.next,
            onChanged: (village) =>
                context.read<QuestionnaireCubit>().setVillage(village),
          ),
          TextWithAppTextField(
            title: 'Phone',
            textInputAction: TextInputAction.next,
            onChanged: (phone) =>
                context.read<QuestionnaireCubit>().setPhone(phone),
          ),

          ///////////////////////////////////////////////////////
          //-----------------FARMER PROFILE--------------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'FARMER PROFILE',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          TextWithAppTextField(
            title: 'How many years have you been engaged in farming',
            textInputAction: TextInputAction.next,
            onChanged: (years) => context
                .read<QuestionnaireCubit>()
                .setYearsOfFarming(int.parse(years)),
          ),
          AppDropDownField(
            title: 'Type of farming',
            items: typeOfFarmingEnum,
            value: typeOfFarming,
            onChanged: (typeOfFarming) => context
                .read<QuestionnaireCubit>()
                .setTypeofFarming(typeOfFarming as String),
          ),
          TextWithAppTextField(
            title: 'What is the size of your farm (in hectares)?',
            textInputAction: TextInputAction.next,
            onChanged: (size) => context
                .read<QuestionnaireCubit>()
                .setSizeOfFarm(double.parse(size)),
          ),
          TextWithAppTextField(
            title: 'Crops Grown (List the primary crops you cultivate)',
            hintText:
                'Seperate the crops with a comma (e.g maize, carrot, mango)',
            textInputAction: TextInputAction.next,
            onChanged: (crops) =>
                context.read<QuestionnaireCubit>().setCropsGrown(crops),
          ),
          TextWithAppTextField(
            title: 'Livestock Raised (List the primary livestock you rear)',
            hintText:
                'Seperate the livestock with a comma (e.g goat, cow, rabbit)',
            textInputAction: TextInputAction.next,
            onChanged: (livestocks) => context
                .read<QuestionnaireCubit>()
                .setLivestockRaised(livestocks),
          ),

          ///////////////////////////////////////////////////////
          //-------------AGRICULTURAL PRACTICES----------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'AGRICULTURAL PRACTICES',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          AppDropDownField(
            title: 'What is your method of farming?',
            items: methodOfFarmingEnum,
            value: methodOfFarming,
            onChanged: (methodOfFarming) => context
                .read<QuestionnaireCubit>()
                .setMethodOfFarming(methodOfFarming as String),
          ),
          Column(
            children: [
              Text(
                'What types of machinery and equipment do you need on your farm? (Select all that apply)',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: typesOfMachineryNeededEnum.map((title) {
                  return AppCheckboxTile(
                    title: title,
                    value: typesOfMachineryNeeded.contains(title),
                    onChanged: (bool? value) => context
                        .read<QuestionnaireCubit>()
                        .setTypesOfMachineryNeeded(title),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
          AppDropDownField(
            title:
                'Do you use agro-chemicals (pesticides/herbicides) on your farm?',
            items: const [true, false],
            value: useAgroChemicals,
            onChanged: (useAgroChemicals) => context
                .read<QuestionnaireCubit>()
                .setUseAgroChemicals(useAgroChemicals as bool),
          ),
          AppDropDownField(
            title: 'Do you use fertilizers on your farm?',
            items: const [true, false],
            value: useFertilizer,
            onChanged: (useFertilizer) => context
                .read<QuestionnaireCubit>()
                .setUseFertilizer(useFertilizer as bool),
          ),
          Column(
            children: [
              Text(
                'If you need to use fertilizers, which types do you prefer? (Select all that apply)',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: preferredFertilizersEnum.map((title) {
                  return AppCheckboxTile(
                    title: title,
                    value: preferredFertilizers.contains(title),
                    onChanged: (bool? value) => context
                        .read<QuestionnaireCubit>()
                        .setPreferredFertilizers(title),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),

          ///////////////////////////////////////////////////////
          //-------------ADDITIONAL INFORMATION----------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'ADDITIONAL INFORMATION',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextWithAppTextField(
            title: 'National Identification Number (NIN)',
            textInputAction: TextInputAction.next,
            onChanged: (nin) => context.read<QuestionnaireCubit>().setNIN(nin),
          ),
          TextWithAppTextField(
            title: 'Residential Address',
            textInputAction: TextInputAction.next,
            onChanged: (address) => context
                .read<QuestionnaireCubit>()
                .setResidentialAddress(address),
          ),
          TextWithAppTextField(
            title: 'Farm Address',
            textInputAction: TextInputAction.next,
            onChanged: (farmAddress) =>
                context.read<QuestionnaireCubit>().setFarmAddress(farmAddress),
          ),
          TextWithAppTextField(
            title: 'Bank',
            textInputAction: TextInputAction.next,
            onChanged: (bank) =>
                context.read<QuestionnaireCubit>().setBankName(bank),
          ),
          TextWithAppTextField(
            title: 'Account Number',
            textInputAction: TextInputAction.next,
            onChanged: (acc) =>
                context.read<QuestionnaireCubit>().setAccountNumber(acc),
          ),
          TextWithAppTextField(
            title: 'Bank Verification Number (BVN)',
            textInputAction: TextInputAction.next,
            onChanged: (bvn) => context.read<QuestionnaireCubit>().setBVN(bvn),
          ),
          TextWithAppTextField(
            title: "Farmers' Group or Cooperative (if applicable)",
            textInputAction: TextInputAction.next,
            onChanged: (fg) =>
                context.read<QuestionnaireCubit>().setFarmersGroup(fg),
          ),

          const SizedBox(height: 10),
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
