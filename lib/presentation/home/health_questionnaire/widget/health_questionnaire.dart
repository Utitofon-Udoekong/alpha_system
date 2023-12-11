import 'dart:io';
import 'package:alpha_system/presentation/constants/enums.dart';
import 'package:alpha_system/presentation/constants/methods.dart';
import 'package:alpha_system/presentation/home/cubit/questionnaire_cubit.dart';
import 'package:alpha_system/presentation/widgets/app_button.dart';
import 'package:alpha_system/presentation/widgets/app_picker.dart';
import 'package:alpha_system/presentation/widgets/app_radio_groups.dart';
import 'package:alpha_system/presentation/widgets/app_text_field.dart';
import 'package:alpha_system/presentation/widgets/hero_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthQuestionnaireTabWidget extends StatelessWidget {
  const HealthQuestionnaireTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((QuestionnaireCubit bloc) => bloc.state.isLoading);
    final gpsLocation =
        context.select((QuestionnaireCubit bloc) => bloc.state.gpsLocation);
    final photoOfFront =
        context.select((QuestionnaireCubit bloc) => bloc.state.photoOfFront);
    final photoOfSide =
        context.select((QuestionnaireCubit bloc) => bloc.state.photoOfSide);
    final photoOfReception = context
        .select((QuestionnaireCubit bloc) => bloc.state.photoOfReception);
    final photoOfSignPost =
        context.select((QuestionnaireCubit bloc) => bloc.state.photoOfSignPost);
    final typeOfCareCenter = context
        .select((QuestionnaireCubit bloc) => bloc.state.typeOfCareCenter);
    final sourceOfPower =
        context.select((QuestionnaireCubit bloc) => bloc.state.sourceOfPower);
    final numberOfCareCenters = context
        .select((QuestionnaireCubit bloc) => bloc.state.howManyCareCenters);
    final numberOfAmbulance = context
        .select((QuestionnaireCubit bloc) => bloc.state.howManyAmbulances);
    final typeOfRoad =
        context.select((QuestionnaireCubit bloc) => bloc.state.whatTypeOfRoad);
    final numberOfSurgeons = context
        .select((QuestionnaireCubit bloc) => bloc.state.numberOfSurgeons);
    final numberOfDoctors =
        context.select((QuestionnaireCubit bloc) => bloc.state.numberOfDoctors);
    final numberOfNurses =
        context.select((QuestionnaireCubit bloc) => bloc.state.numberOfNurses);
    final numberOfNursingAssistants = context.select(
        (QuestionnaireCubit bloc) => bloc.state.numberOfNursingAssistants,);
    final numberOfPharmacists = context
        .select((QuestionnaireCubit bloc) => bloc.state.numberOfPharmacists);
    final numberOfLabTechnicians = context
        .select((QuestionnaireCubit bloc) => bloc.state.numberOfLabTechnicians);
    final numberOfCleaners = context
        .select((QuestionnaireCubit bloc) => bloc.state.numberOfCleaners);
    final numberOfDispensaryAssistant = context.select(
        (QuestionnaireCubit bloc) => bloc.state.numberOfDispensaryAssistant,);
    final numberOfCommunityHealthOfficers = context.select(
        (QuestionnaireCubit bloc) =>
            bloc.state.numberOfCommunityHealthOfficers,);
    final numberOfRecordOfficers = context
        .select((QuestionnaireCubit bloc) => bloc.state.numberOfRecordOfficers);
    final measuresInplaceForDiseaseControl = context.select(
        (QuestionnaireCubit bloc) =>
            bloc.state.measuresInplaceForDiseaseControl,);
    final responseMechanismsToHealthEmergencies = context.select(
        (QuestionnaireCubit bloc) =>
            bloc.state.responseMechanismsToHealthEmergencies,);
    final presenceOfHealthEducationPrograms = context.select(
        (QuestionnaireCubit bloc) =>
            bloc.state.presenceOfHealthEducationPrograms,);
    final accessibilityOfHealthInformationToThePublic = context.select(
        (QuestionnaireCubit bloc) =>
            bloc.state.accessibilityOfHealthInformationToThePublic,);
    final governmentPoliciesInHealthSector = context.select(
        (QuestionnaireCubit bloc) => bloc.state
            .governmentPoliciesInHealthSectorAccountingForHealthCareAccessibiltiy,);
    final investmentsAimedatImprovingHealthcareServices = context.select(
        (QuestionnaireCubit bloc) =>
            bloc.state.investmentsAimedatImprovingHealthcareServices,);
    final doYouHaveAWASHProgram = context
        .select((QuestionnaireCubit bloc) => bloc.state.doYouHaveAWASHProgram);
    final doYouHaveAGoodRefuseDisposalSystemIncenerator = context.select(
        (QuestionnaireCubit bloc) =>
            bloc.state.doYouHaveAGoodRefuseDisposalSystemIncenerator,);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const HeroImage(),
          const SizedBox(height: 10),

          ///////////////////////////////////////////////////////
          //--------------------BIO DATA-----------------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'BIO DATA',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextWithAppTextField(
            title: 'Name',
            textInputAction: TextInputAction.next,
            onChanged: (name) =>
                context.read<QuestionnaireCubit>().setName(name),
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
          AppPicker(
            title: gpsLocation.isEmpty ? 'GPS Location' : gpsLocation,
            onTap: () async {
              final locationData = await getLocation();
                final gpsCoordinates =
                    'Longitude, Latitude';
                    // '${locationData.latitude}, ${locationData.longitude}';
                context
                    .read<QuestionnaireCubit>()
                    .setGpsLocation(gpsCoordinates);
              // if (locationData != null) {
              // }
            },
          ),
          AppPicker(
            title: photoOfSignPost.isEmpty
                ? 'Photo of Sign Post'
                : 'Image selected',
            onTap: () async {
              final file = await snapPhoto();
              context
                  .read<QuestionnaireCubit>()
                  .setPhotoOfSignPost(File(file.path).readAsStringSync());
            },
          ),
          AppPicker(
            title: photoOfFront.isEmpty ? 'Photo of Front' : 'Image selected',
            onTap: () async {
              final file = await snapPhoto();
              context
                  .read<QuestionnaireCubit>()
                  .setPhotoOfFront(await file.readAsString());
            },
          ),
          AppPicker(
            title: photoOfSide.isEmpty ? 'Photo of Side' : 'Image selected',
            onTap: () async {
              final file = await snapPhoto();
              context
                  .read<QuestionnaireCubit>()
                  .setPhotoOfSide(await file.readAsString());
            },
          ),
          AppPicker(
            title: photoOfReception.isEmpty
                ? 'Photo of Reception'
                : 'Image selected',
            onTap: () async {
              final file = await snapPhoto();
              context
                  .read<QuestionnaireCubit>()
                  .setPhotoOfReception(await file.readAsString());
            },
          ),
          AppDropDownField(
            title: 'Type of care center?',
            items: typeOfCareCenterEnum,
            value: typeOfCareCenter,
            onChanged: (careCenter) => context
                .read<QuestionnaireCubit>()
                .setTypeOfCareCenter(careCenter as String),
          ),
          AppDropDownField(
            title: 'Source of power?',
            items: sourceOfPowerEnum,
            value: sourceOfPower,
            onChanged: (source) => context
                .read<QuestionnaireCubit>()
                .setSourceOfPower(source as String),
          ),
          AppDropDownField(
            title: 'How many care centres are attached to this facility?',
            items: generateNumbers(1, 100),
            value: numberOfCareCenters,
            onChanged: (source) => context
                .read<QuestionnaireCubit>()
                .setHowManyCareCenters(source as int),
          ),
          AppDropDownField(
            title: 'What type of road can be used to access this facility?',
            items: typeOfRoadEnum,
            value: typeOfRoad,
            onChanged: (road) => context
                .read<QuestionnaireCubit>()
                .setWhatTypeOfRoad(road as String),
          ),
          AppDropDownField(
            title: 'Number of Ambulance',
            items: generateNumbers(0, 10),
            value: numberOfAmbulance,
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setHowManyAmbulances(value as int),
          ),

          ///////////////////////////////////////////////////////
          //----------------MEDICAL PERSONNEL------------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'MEDICAL PERSONNEL',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          AppDropDownField(
            value: numberOfSurgeons,
            title: 'Number of Surgeons',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfSurgeons(value as int),
          ),
          AppDropDownField(
            value: numberOfDoctors,
            title: 'Number of Doctors',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfDoctors(value as int),
          ),
          AppDropDownField(
            value: numberOfNurses,
            title: 'Number of Nurses',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfNurses(value as int),
          ),
          AppDropDownField(
            value: numberOfNursingAssistants,
            title: 'Number of Nursing Assistants',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfNursingAssistants(value as int),
          ),
          AppDropDownField(
            value: numberOfPharmacists,
            title: 'Number of Pharmacists',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfPharmacists(value as int),
          ),
          AppDropDownField(
            value: numberOfLabTechnicians,
            title: 'Number of Lab Technicians',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfLabTechnicians(value as int),
          ),
          AppDropDownField(
            value: numberOfCleaners,
            title: 'Number of Cleaners',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfCleaners(value as int),
          ),
          AppDropDownField(
            value: numberOfDispensaryAssistant,
            title: 'Number of Dispensary Assistant',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfDispensaryAssistant(value as int),
          ),
          AppDropDownField(
            value: numberOfCommunityHealthOfficers,
            title: 'Number of Community Health Officers',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfCommunityHealthOfficers(value as int),
          ),
          AppDropDownField(
            value: numberOfRecordOfficers,
            title: 'Number of Record Officers',
            items: generateNumbers(0, 100),
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setNumberOfRecordOfficers(value as int),
          ),

          ///////////////////////////////////////////////////////
          //----------------DISEASE CONTROL--------------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'DISEASE CONTROL',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          AppCheckboxTile(
            title:
                'Measures in place for disease control and prevention, considering both land and water transport?',
            value: measuresInplaceForDiseaseControl,
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setMeasuresInplaceForDiseaseControl(value!),
          ),
          AppCheckboxTile(
            title:
                'Response mechanisms to health emergencies and outbreaks with considerations for transport accessibility?',
            value: responseMechanismsToHealthEmergencies,
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setResponseMechanismsToHealthEmergencies(value!),
          ),

          ///////////////////////////////////////////////////////
          //-------------COMMUNITY HEALTH PROGRAMS-------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'COMMUNITY HEALTH PROGRAMS',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextWithAppTextField(
            title:
                'Availability and effectiveness of community health programs, considering communities accessible by both land and water transport',
            onChanged: (answer) => context
                .read<QuestionnaireCubit>()
                .setAvailabilityOfCommunityHealthPrograms(answer),
          ),
          TextWithAppTextField(
            title:
                'Outreach programs and initiatives for rural and underserved areas, including those reachable by water.',
            onChanged: (answer) => context
                .read<QuestionnaireCubit>()
                .setOutreachProgramsForRuralAreas(answer),
          ),

          ///////////////////////////////////////////////////////
          //-----------------HEALTH EDUCATION------------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'HEALTH EDUCATION',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          AppCheckboxTile(
            title:
                'Presence of health education programs, with considerations for communities accessible by both land and water transport?',
            value: presenceOfHealthEducationPrograms,
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setPresenceOfHealthEducationPrograms(value!),
          ),
          AppCheckboxTile(
            title:
                'Accessibility and effectiveness of health information to the public, including those in water-accessible areas?',
            value: accessibilityOfHealthInformationToThePublic,
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setAccessibilityOfHealthInformationToThePublic(value!),
          ),

          ///////////////////////////////////////////////////////
          //-------------HEALTHCARE ACCESSIBILITY--------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'HEALTHCARE ACCESSIBILITY',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextWithAppTextField(
            title:
                'Accessibility of health services to different demographics (urban, rural, etc.) considering both land and water transport',
            onChanged: (answer) => context
                .read<QuestionnaireCubit>()
                .setAccessibilityOfHealthServicesToDifferentDemographics(
                    answer,),
          ),

          ///////////////////////////////////////////////////////
          //---------------GOVERNMENT INITIATIVES--------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'GOVERNMENT INITIATIVES',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          AppCheckboxTile(
            title:
                'Government policies and initiatives in the health sector, accounting for healthcare accessibility through both land and water transport?',
            value: governmentPoliciesInHealthSector,
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setAccessibilityOfHealthInformationToThePublic(value!),
          ),
          AppCheckboxTile(
            title:
                'Investments and projects aimed at improving healthcare services, with considerations for water-accessible regions?',
            value: investmentsAimedatImprovingHealthcareServices,
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setInvestmentsAimedatImprovingHealthcareServices(value!),
          ),

          ///////////////////////////////////////////////////////
          //----------------PUBLIC HEALTH DATA-----------------//
          ///////////////////////////////////////////////////////
          const SizedBox(height: 10),
          Text(
            'PUBLIC HEALTH DATA',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextWithAppTextField(
            title:
                'Collection and management of public health data, inclusive of regions accessible by both land and water transport',
            onChanged: (answer) => context
                .read<QuestionnaireCubit>()
                .setCollectionOfPublicHealthData(answer),
          ),
          TextWithAppTextField(
            title:
                'Surveillance systems for monitoring health trends and issues, covering both land and water transport regions',
            onChanged: (answer) => context
                .read<QuestionnaireCubit>()
                .setSurveillanceSystemsForMonitoringHealthTrends(answer),
          ),
          TextWithAppTextField(
            title: 'Environmental Health management facilities / sanitation',
            onChanged: (answer) => context
                .read<QuestionnaireCubit>()
                .setEnvironmentalHealthManagementFacilities(answer),
          ),
          AppCheckboxTile(
            title: 'Do you have a WASH program?',
            value: doYouHaveAWASHProgram,
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setDoYouHaveAWASHProgram(value!),
          ),
          AppCheckboxTile(
            title: 'Do you have a good refuse disposal system Incinerator ?',
            value: doYouHaveAGoodRefuseDisposalSystemIncenerator,
            onChanged: (value) => context
                .read<QuestionnaireCubit>()
                .setDoYouHaveAGoodRefuseDisposalSystemIncenerator(value!),
          ),

          const SizedBox(height: 20),
          AppButton(
            title: 'Save Form',
            onTap: () => context.read<QuestionnaireCubit>().saveAgroForm(),
            disabled: isLoading,
          ),
        ],
      ),
    );
  }

  ///Generate a list of numbers in the range [min] to [max]
  List<int> generateNumbers(int min, int max) {
    return List<int>.generate(max + 1, (i) => i + min);
  }
}
