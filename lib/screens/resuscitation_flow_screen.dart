import 'package:flutter/material.dart';
import '../models/resuscitation_session.dart';
import '../models/intervention_step.dart';

class ResuscitationFlowScreen extends StatefulWidget {
  final ResuscitationSession session;

  const ResuscitationFlowScreen({Key? key, required this.session}) : super(key: key);

  @override
  _ResuscitationFlowScreenState createState() => _ResuscitationFlowScreenState();
}

class _ResuscitationFlowScreenState extends State<ResuscitationFlowScreen> {
  int _currentStep = 0;

  void _markStepCompleted(String notes) {
    setState(() {
      widget.session.steps[_currentStep] = InterventionStep(
        id: widget.session.steps[_currentStep].id,
        timestamp: DateTime.now(),
        description: widget.session.steps[_currentStep].description,
        completed: true,
        notes: notes,
      );
      if (_currentStep < widget.session.steps.length - 1) {
        _currentStep++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.session.steps[_currentStep];

    return Scaffold(
      appBar: AppBar(
        title: Text("Neonatal Resuscitation Aid"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Step 
${_currentStep + 1}/${widget.session.steps.length}",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16),
            Card(
              color: step.completed ? Colors.green.shade100 : Colors.yellow.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  step.description,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            SizedBox(height: 24),
            step.completed
                ? Text("Completed at: ${step.timestamp}")
                : ElevatedButton.icon(
                    icon: Icon(Icons.check),
                    label: Text("Mark Step Completed"),
                    onPressed: () {
                      // Optional: open notes dialog
                      _markStepCompleted("");
                    },
                  ),
            SizedBox(height: 24),
            if (_currentStep == widget.session.steps.length - 1)
              ElevatedButton.icon(
                icon: Icon(Icons.done_all),
                label: Text("Finish Session"),
                onPressed: () {
                  // TODO: Handle finish logic (save, navigate, etc.)
                  Navigator.pop(context);
                },
              )
          ],
        ),
      ),
    );
  }
}
