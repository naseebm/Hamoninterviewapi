class SubjectModel {
  final int credits;
  final int id;
  final String name;
  final String teacher;

  SubjectModel(this.credits, this.id, this.name, this.teacher);

  SubjectModel.fromMap(Map<String , dynamic>map):
  name= map['name'],
  credits=map['credits'],
  id=map['id'],
  teacher= map['teacher'];
}