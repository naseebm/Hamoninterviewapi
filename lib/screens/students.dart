import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';
import 'package:hamon_interviewapi/screens/student_detail.dart';
import 'package:provider/provider.dart';

class Students extends StatefulWidget {
  const Students({Key? key}) : super(key: key);

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  @override
  void initState() {
    var prov = Provider.of<StudentsProvider>(context, listen: false);
    prov.fetchStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<StudentsProvider>(context);

    return Scaffold(
      body: !prov.isLoading && prov.studentsDetails.isEmpty
          ? Center(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('refresh')))
          : prov.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: prov.studentsDetails.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StudentDetail(
                                    id: prov.studentsDetails[index].id,
                                    title:prov.studentsDetails[index].name )));
                      },
                      leading: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(prov.studentsDetails[index].id.toString()),
                      ),
                      title: Text(prov.studentsDetails[index].name),
                      subtitle: Text(prov.studentsDetails[index].email),
                    );
                  }),
    );
  }
}
