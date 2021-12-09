class ClassroomModel {
  final int id;
  final String layout;
  final String name;
  final int size;

  ClassroomModel(this.id, this.layout, this.name, this.size);

  ClassroomModel.fromMap(Map<String, dynamic>map):
  name =map['name'],
  layout=map['layout'],
  id=map['id'],
  size=map['size'];
}