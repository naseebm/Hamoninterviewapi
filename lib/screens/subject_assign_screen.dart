import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/models/subject_model.dart';

class SubjectAssignScreen extends StatefulWidget {
  const SubjectAssignScreen({Key? key, required this.subjects}) : super(key: key);
 final List<SubjectModel>  subjects;

  @override
  State<SubjectAssignScreen> createState() => _SubjectAssignScreenState();
}

class _SubjectAssignScreenState extends State<SubjectAssignScreen> {
  int? _checkedSubject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:const Text('Subjects')),
    body: Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: widget.subjects
                .map((e) => CheckboxListTile(
                      title: Text(e.name),
                      value: _checkedSubject==e.id,
                      onChanged: (val) {
                        setState(() {
                          if(val==true){
                            _checkedSubject = e.id;
                          }else{
                            _checkedSubject=null;
                          }
                          
                        });
                      },
                    ))
                .toList(),
          ),
        ),
        Expanded(child: Center(child:ElevatedButton(onPressed: (){
          Navigator.pop(context,_checkedSubject );
        }, child:const Text('Assign subject'))),)
      ],
    ));
  }
}