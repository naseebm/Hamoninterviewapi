import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';
import 'package:hamon_interviewapi/providers/subject_provider.dart';
import 'package:hamon_interviewapi/screens/subject_detail.dart';
import 'package:provider/provider.dart';

class Subjects extends StatefulWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  void initState() {
    var prov = Provider.of<SubjectProvider>(context, listen: false);
    prov.fetchSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SubjectProvider>(context);
    return Scaffold(
      body: !prov.isLoading && prov.subjectssDetails.isEmpty
          ? Center(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('refresh')))
          : prov.isLoading
              ? const 
                   LinearProgressIndicator()
                
              : ListView.builder(
                  itemCount: prov.subjectssDetails.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SubjectDetail(
                                          id: prov.subjectssDetails[index].id,
                                          title: prov.subjectssDetails[index].name,
                                        )));
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(prov.subjectssDetails[index].id.toString()),
                          ),
                          title: Text(prov.subjectssDetails[index].name),
                          subtitle: Text(prov.subjectssDetails[index].teacher),
                        ),
                      ),
                    );
                  }),
    );
  }
}
