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
        title: Text(widget.title),
        //
      ),
      body: !prov.isLoading && prov.classroomDetails == null
          ? Center(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('refresh')))
          : prov.isLoading || subjectsProv.isLoading
              ? const  LinearProgressIndicator()
                
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          classroomCard('Name', prov.classroomDetails!.name, width),
                          classroomCard(
                              'Layout', prov.classroomDetails!.layout, width),
                          classroomCard(
                              'Id', prov.classroomDetails!.id.toString(), width),
                          classroomCard('Size', prov.classroomDetails!.size.toString(),
                              width),
                          Row(
                            children: [
                              classroomCard(
                                  'subject',
                                prov.classroomDetails!.subject==null?'Not Assigned':
                                
                                  subjectsProv.subjectssDetails
                                      .firstWhere((element) => element.id == prov.classroomDetails!.subject)
                                      .name,
                
                              
                
                                  width),
                              SizedBox(
                                
                                child: TextButton.icon(
                                    onPressed: () async {
                                      var subjectId = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SubjectAssignScreen(
                                                  subjects: subjectsProv
                                                      .subjectssDetails)));
                                       if(subjectId!=null){
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
                                      }}
                                    },
                                    icon: const Icon(Icons.edit),
                                    label: prov.classroomDetails!.subject == null
                                        ? const SizedBox(
                                            child: Text(
                                            'Assign',
                                          ))
                                        : const SizedBox(
                                            child: Text('Edit'))),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                ),
              ),
    );
  }
}
