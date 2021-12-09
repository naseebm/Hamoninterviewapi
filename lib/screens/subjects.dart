import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';
import 'package:hamon_interviewapi/providers/subject_provider.dart';
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
      body:!prov.isLoading && prov.subjectssDetails.isEmpty
          ? Center(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('refresh')))
          :  prov.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: prov.subjectssDetails.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  leading: Text(prov.subjectssDetails[index].id.toString()),
                  title: Text(prov.subjectssDetails[index].name),
                  subtitle: Text(prov.subjectssDetails[index].teacher),
                );
              }),
    );
  }
}
