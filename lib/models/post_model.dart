import 'dart:convert';

class Post {
  int? id;
  int? employee_salary;
  String? employee_name;
  int? employee_age;
  String? profile_image;

  Post({this.id, this.employee_salary, this.employee_name, this.employee_age,this.profile_image});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        employee_salary = json['employee_salary'],
        employee_name = json['employee_name'],
        employee_age = json['employee_age'],
        profile_image = json['profile_image'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'salary': employee_salary,
    'name': employee_name,
    'age': employee_age,
    'profile_image': profile_image,
  };
}