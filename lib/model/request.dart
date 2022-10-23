class UserRequestModel {
  final String name;
  final String email;
  final String nationalid;
  final String complainoffice;
  final String complaintitle;
  final String complaindesc;

  UserRequestModel({
    required this.name,
    required this.email,
    required this.nationalid,
    required this.complainoffice,
    required this.complaintitle,
    required this.complaindesc,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "national_id": nationalid,
      "complain_office": complainoffice,
      "complain_title": complaintitle,
      "complain_desc": complaindesc,
    };
  }
}
