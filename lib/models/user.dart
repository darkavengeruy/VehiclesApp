import 'document_type.dart';

class User {
  String? firstName = '';
  String? lastName = '';
  String? rut = '';
  DocumentType documentType = DocumentType(id: 0, description: '');
  String? document = '';
  String? address = '';
  String? city = '';
  String? imageId = '';
  String? imageFullPath = '';
  int userType = 0;
  String? fullName = '';
  String? id = '';
  String? userName = '';
  String? email = '';
  String? phoneNumber = '';

  User({
    required this.firstName,
    required this.lastName,
    required this.rut,
    required this.documentType,
    required this.document,
    required this.address,
    required this.city,
    required this.imageId,
    required this.imageFullPath,
    required this.userType,
    required this.fullName,
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
  });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    rut = json['rut'];
    documentType = DocumentType.fromJson(json['documentType']);
    document = json['document'];
    address = json['address'];
    city = json['city'];
    imageId = json['imageId'];
    imageFullPath = json['imageFullPath'];
    userType = json['userType'];
    fullName = json['fullName'];     
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber']; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['rut'] = rut;   
    data['documentType'] = documentType.toJson();    
    data['document'] = document;
    data['address'] = address;
    data['city'] = city;
    data['imageId'] = imageId;
    data['imageFullPath'] = imageFullPath;
    data['userType'] = userType;
    data['fullName'] = fullName;
    data['id'] = id;
    data['userName'] = userName;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
