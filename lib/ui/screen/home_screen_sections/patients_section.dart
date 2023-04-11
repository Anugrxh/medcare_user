import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcare_user/blocs/patients/manage_patients/manage_patients_bloc.dart';
import 'package:medcare_user/ui/widgets/custom_action_button.dart';
import 'package:medcare_user/ui/widgets/patient/patient_card.dart';

import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/patient/add_patient_dialog.dart';

class PatientsSection extends StatefulWidget {
  const PatientsSection({super.key});

  @override
  State<PatientsSection> createState() => _PatientsSectionState();
}

class _PatientsSectionState extends State<PatientsSection> {
  final ManagePatientsBloc managePatientsBloc = ManagePatientsBloc();
  @override
  void initState() {
    super.initState();
    managePatientsBloc.add(GetAllPatientsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: BlocProvider<ManagePatientsBloc>.value(
        value: managePatientsBloc,
        child: BlocConsumer<ManagePatientsBloc, ManagePatientsState>(
          listener: (context, state) {
            if (state is ManagePatientsFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failure',
                  message: state.message,
                  primaryButtonLabel: 'Ok',
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Family Members',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                    ),
                    CustomActionButton(
                      iconData: Icons.add_circle_outline,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) =>
                              BlocProvider<ManagePatientsBloc>.value(
                            value: managePatientsBloc,
                            child: const AddEditPatientDialog(),
                          ),
                        );
                      },
                      label: 'Add Member',
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                state is ManagePatientsLoadingState
                    ? const SizedBox(
                        height: 1,
                        child: LinearProgressIndicator(),
                      )
                    : const Divider(
                        height: 1,
                      ),
                Expanded(
                  child: state is ManagePatientsSuccessState
                      ? state.patients.isNotEmpty
                          ? ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              itemBuilder: (context, index) => PatientCard(
                                patientDetails: state.patients[index],
                                managePatientBloc: managePatientsBloc,
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              itemCount: state.patients.length,
                            )
                          : const Center(child: Text('No Patients Found!'))
                      : state is ManagePatientsFailureState
                          ? Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomActionButton(
                                    iconData: Icons.replay_outlined,
                                    onPressed: () {
                                      managePatientsBloc
                                          .add(GetAllPatientsEvent());
                                    },
                                    label: 'Retry',
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
