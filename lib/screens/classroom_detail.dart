import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/models/subject_model.dart';
import 'package:hamon_interviewapi/providers/classrooms_provider.dart';
import 'package:hamon_interviewapi/providers/subject_provider.dart';
import 'package:hamon_interviewapi/screens/subject_assign_screen.dart';
import 'package:hamon_interviewapi/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class ClassroomDetail extends StatefulWidget {
  const ClassroomDetail({Key? key, required this.id, required this.title})
      : super(key: key);
  final int id;
  final String title;
  @override
  State<ClassroomDetail> createState() => _ClassroomDetailState();
}

class _ClassroomDetailState extends State<ClassroomDetail> {
  List<SubjectModel> subjects = [];

  @override
  void initState() {
    var prov = Provider.of<ClassroomProvider>(context, listen: false);
    prov.fetchClassroom(widget.id);
    var subjectsProv = Provider.of<SubjectProvider>(context, listen: false);
    subjectsProv.fetchSubjects();
    subjects = subjectsProv.subjectssDetails;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ClassroomProvider>(
      context,
    );
    var width = MediaQuery.of(context).size.width;
    var subjectsProv = Provider.of<SubjectProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(prov.classroomDetails!.name),
      ),
      body: !prov.isLoading && prov.classroomDetails == null
          ? Center(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('refresh')))
          : prov.isLoading || subjectsProv.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customCard('name', prov.classroomDetails!.name, width),
                      customCard(
                          'layout', prov.classroomDetails!.layout, width),
                      customCard(
                          'id', prov.classroomDetails!.id.toString(), width),
                      customCard('size', prov.classroomDetails!.size.toString(),
                          width),
                      Row(
                        children: [
                          customCard('subject',
                              prov.classroomDetails!.subject.toString(), width),
                          ElevatedButton.icon(
                              onPressed: () async {
                                var subjectId = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SubjectAssignScreen(
                                            subjects: subjectsProv
                                                .subjectssDetails)));

                                var res = await prov.assignSubject(subjectId);
                                if (res.statusCode == 200) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Successfully updated'),
                                  ));
                                  prov.fetchClassroom(widget.id);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text('Failed'),
                                    action: SnackBarAction(
                                        label: 'retry',
                                        onPressed: () {
                                          prov.assignSubject(subjectId);
                                        }),
                                  ));
                                }
                              },
                              icon: const Icon(Icons.edit),
                              label: prov.classroomDetails!.subject == null
                                  ? const Text('Assign a subject')
                                  : const Text('Edit subject'))
                        ],
                      )
                    ],
                  ),
                ),
    );
  }
}
