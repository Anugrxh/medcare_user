import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcare_user/blocs/patients/patients_and_appointments/patients_and_appointments_bloc.dart';

import '../../widgets/custom_action_button.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/token_card.dart';
import '../login_screen.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({
    super.key,
  });

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
  final PatientsAndAppointmentsBloc patientsAndAppointmentsBloc =
      PatientsAndAppointmentsBloc();

  @override
  void initState() {
    super.initState();
    patientsAndAppointmentsBloc.add(PatientsAndAppointmentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          BlocProvider<PatientsAndAppointmentsBloc>.value(
            value: patientsAndAppointmentsBloc,
            child: BlocConsumer<PatientsAndAppointmentsBloc,
                PatientsAndAppointmentsState>(
              listener: (context, state) {
                if (state is PatientsAndAppointmentsFailureState) {
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
                return ListView(
                  padding: const EdgeInsets.only(
                    top: 250,
                    left: 20,
                    right: 20,
                  ),
                  children: [
                    Text(
                      'Todays Tokens',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    state is PatientsAndAppointmentsLoadingState
                        ? const SizedBox(
                            height: 1,
                            child: LinearProgressIndicator(),
                          )
                        : const Divider(
                            height: 1,
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    state is PatientsAndAppointmentsSuccessState
                        ? state.appointments.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                itemBuilder: (context, index) => TokenCard(
                                  patientAppointmentDetails:
                                      state.appointments[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 10,
                                ),
                                itemCount: state.appointments.length,
                              )
                            : const Center(child: Text('No Patients Found!'))
                        : state is PatientsAndAppointmentsFailureState
                            ? Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomActionButton(
                                      iconData: Icons.replay_outlined,
                                      onPressed: () {
                                        patientsAndAppointmentsBloc.add(
                                            PatientsAndAppointmentsEvent());
                                      },
                                      label: 'Retry',
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                  ],
                );
              },
            ),
          ),
          CustomPaint(
            size: const Size(double.infinity, 250),
            painter: ArcPainter(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 10,
              top: 50,
            ),
            child: SizedBox(
              width: double.infinity,
              child: CustomCard(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 20,
                        bottom: 15,
                        right: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Conveniantly\nMeet Your Doctor',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 20,
                                  color: Color.fromARGB(100, 0, 0, 0),
                                )
                              ],
                              color: Color(0XFF797EF6),
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'We Care for you\nWith the help of top class Doctors',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 20,
                                  color: Color.fromARGB(100, 0, 0, 0),
                                )
                              ],
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/image/heart.png",
                    width: 100,
                    fit: BoxFit.cover,
                  )
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
