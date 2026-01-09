import 'package:diversesphere/features/todo/presentation/view/widgets/date_Card.dart';
import 'package:diversesphere/features/todo/presentation/view/widgets/input_card.dart';
import 'package:diversesphere/features/todo/presentation/view_model/bloc/add_task_bloc.dart';
import 'package:diversesphere/features/todo/presentation/view_model/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  Future<void> _pickDate(BuildContext context, bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      context.read<AddTaskBloc>().add(
            isStart
                ? StartDateChanged(picked)
                : EndDateChanged(picked),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ important
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        title: const Text("Add task"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<AddTaskBloc, AddTaskState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
            );
          }

          if (state.isSuccess) {
            context.read<HomeBloc>().add(LoadTodos());
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InputCard(
                        label: "Project Name",
                        onChanged: (v) => context
                            .read<AddTaskBloc>()
                            .add(TitleChanged(v)),
                      ),
                      const SizedBox(height: 16),

                      InputCard(
                        label: "Description",
                        maxLines: 3,
                        onChanged: (v) => context
                            .read<AddTaskBloc>()
                            .add(DescriptionChanged(v)),
                      ),
                      const SizedBox(height: 16),

                      DateCard(
                        label: "Start Date",
                        value: state.startDate == null
                            ? "Select date"
                            : state.startDate!.toString().split(' ').first,
                        onTap: () => _pickDate(context, true),
                      ),
                      const SizedBox(height: 12),

                      DateCard(
                        label: "End Date",
                        value: state.endDate == null
                            ? "Select date"
                            : state.endDate!.toString().split(' ').first,
                        onTap: () => _pickDate(context, false),
                      ),

                      const SizedBox(height: 40),

                      SizedBox(
                        height: 52,
                        child: ElevatedButton(
                          onPressed: state.loading
                              ? null
                              : () => context
                                  .read<AddTaskBloc>()
                                  .add( SubmitTask()),
                          child: state.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text("Add Project"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
