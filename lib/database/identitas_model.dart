// class IdentitasModel {
//   int? id;
//   String? name, email, telepon, createdAt, updatedAt;

//   IdentitasModel({
//     this.id,
//     this.name,
//     this.telepon,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory IdentitasModel.fromJson(Map<String, dynamic> json) {
//     return IdentitasModel(
//       id: json['id'],
//       name: json['name'],
//       telepon: json['telepon'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//     );
//   }
// }

class IdentitasModel {
  int? id;
  String? name, email, telepon, createdAt, updatedAt;

  IdentitasModel({
    this.id,
    this.name,
    this.email,
    this.telepon,
    this.createdAt,
    this.updatedAt,
  });

  factory IdentitasModel.fromJson(Map<String, dynamic> json) {
    return IdentitasModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      telepon: json['telepon'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
