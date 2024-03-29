// class NotesModel {
//   final int? id;
//   final String title;
//   final int? age;
//   final String description;
//   final String email;
//
// // constructor of above model
//   NotesModel({this.id,
//     required this.title,
//     required this.email,
//     required this.description,
//     required this.age});
//
// /*if we don't want to use required null value can be assign automatically but
//   we have de declare it as above like int? id  */
//
// //Now mapping
//   NotesModel.fromMap(Map<String, dynamic> res)
//       :
//         id = res['id'],
//         title = res['title'],
//         age = res['age'],
//         description = res['description'],
//         email = res['email'];
//
// }
