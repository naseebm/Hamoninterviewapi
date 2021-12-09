class StudentModel {
  final int age;
  final String email;
  final int id;
  final String name;

  StudentModel(this.age, this.email, this.id, this.name);

  StudentModel.fromMap(Map<String, dynamic> map)
      : age = map['age'],
        email = map['email'],
        id = map['id'],
        name = map['name'];
}
