import 'dart:convert';

class CourseModel {
  final String id;
  final String catId;
  final String uid;
  final String userType;
  final String? visibleUserType;
  final String courseName;
  final String courseTitle;
  final String subtitle;
  final String desc;
  final String image;
  final String providerName;
  final String providerImage;
  final String? instituteName;
  final double price;
  final double cutPrice;
  final int totalRatings;
  final double ratings;
  final int courseDurationByMonths;
  final int totalEnroll;
  final int totalCapacity;
  final String phone;
  final String email;
  final String enrollStartDate;
  final String enrollEndDate;
  final List<CourseSyllabus> syllabus;
  final WeekendShedule shedule;
  final bool isPopular;
  final bool isVerified;
  final bool isBest;
  final bool isFeatured;
  final String createdAt;
  final String updatedAt;
  final bool status;

  CourseModel({
    required this.id,
    required this.catId,
    required this.uid,
    required this.userType,
    this.visibleUserType,
    required this.courseName,
    required this.courseTitle,
    required this.subtitle,
    required this.desc,
    required this.image,
    required this.providerName,
    required this.providerImage,
    this.instituteName,
    required this.price,
    required this.cutPrice,
    required this.totalRatings,
    required this.ratings,
    required this.courseDurationByMonths,
    required this.totalEnroll,
    required this.totalCapacity,
    required this.phone,
    required this.email,
    required this.enrollStartDate,
    required this.enrollEndDate,
    required this.syllabus,
    required this.shedule,
    required this.isPopular,
    required this.isBest,
    required this.isVerified,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory CourseModel.fromJson(Map<String, dynamic> res) {
    return CourseModel(
      id: res['id'],
      catId: res['catId'],
      uid: res['uid'],
      userType: res['userType'],
      courseName: res['courseName'],
      courseTitle: res['courseTitle'],
      subtitle: res['subtitle'],
      desc: res['desc'],
      image: res['image'],
      providerName: res['providerName'],
      providerImage: res['providerImage'],
      price: res['price'],
      cutPrice: res['cutPrice'],
      totalRatings: res['totalRatings'],
      ratings: res['ratings'],
      courseDurationByMonths: res['courseDurationByMonths'],
      totalEnroll: res['totalEnroll'],
      totalCapacity: res['totalCapacity'],
      phone: res['phone'],
      email: res['email'],
      enrollStartDate: res['enrollStartDate'],
      enrollEndDate: res['enrollEndDate'],
      syllabus: res['syllabus'],
      shedule: res['shedule'],
      isPopular: res['isPopular'],
      isBest: res['isBest'],
      isVerified: res['isVerified'],
      isFeatured: res['isFeatured'],
      createdAt: res['createdAt'],
      updatedAt: res['updatedAt'],
      status: res['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'catId': catId,
        'uid': uid,
        'userType': userType,
        'courseName': courseName,
        'courseTitle': courseTitle,
        'subtitle': subtitle,
        'desc': desc,
        'image': image,
        'providerName': providerName,
        'providerImage': providerImage,
        'price': price,
        'cutPrice': cutPrice,
        'totalRatings': totalRatings,
        'ratings': ratings,
        'courseDurationByMonths': courseDurationByMonths,
        'totalEnroll': totalEnroll,
        'totalCapacity': totalCapacity,
        'phone': phone,
        'email': email,
        'enrollStartDate': enrollStartDate,
        'enrollEndDate': enrollEndDate,
        'syllabus': syllabus,
        'shedule': shedule,
        'isPopular': isPopular,
        'isBest': isBest,
        'isVerified': isVerified,
        'isFeatured': isFeatured,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'status': status,
      };

  static List<CourseModel> getCourseListFromJson(String str) =>
      List<CourseModel>.from(
          json.decode(str).map((x) => CourseModel.fromJson(x)));

  static String getCourseListToJson(List<CourseModel> data) =>
      json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

  static List<CourseModel> generatedCourse = [
    CourseModel(
      id: '1',
      catId: '1',
      uid: '100',
      userType: 'student',
      courseName: 'Web Development',
      courseTitle: 'The Complete 2023 Web Development Bootcamp',
      subtitle:
          'Become a Full-Stack Web Developer with just ONE course. HTML, CSS, Javascript, Node, React, MongoDB, Web3 and DApps',
      desc:
          'Welcome to the Complete Web Development Bootcamp, the only course you need to learn to code and become a full-stack web developer. With 150,000+ ratings and a 4.8 average, my Web Development course is one of the HIGHEST RATED courses in the history of Institute App!',
      image:
          'https://learning.oilab.in/public/img/python-course-in-jodhpur.png',
      providerName: 'Dr. Angela Yu',
      providerImage:
          'https://media.istockphoto.com/id/1188460614/vector/portrait-of-a-young-beautiful-asian-fashion-woman-vector-flat-illustration-asian-cute-girl.jpg?s=170667a&w=0&k=20&c=CYVJsVeQyXsq8h1NmbVm6-3xuAn0rcs5MJZd-owzDpA=',
      price: 649.00,
      cutPrice: 3499.00,
      totalRatings: 167852,
      ratings: 4.7,
      courseDurationByMonths: 3,
      totalEnroll: 12,
      totalCapacity: 60,
      phone: '+91-9876543210',
      email: 'example@gmail.com',
      enrollStartDate: 'March 24, 2023',
      enrollEndDate: 'June 20, 2023',
      syllabus: [
        CourseSyllabus(
          sections: 'Fundamentals of Python',
          content: [
            'Introduction to Python',
            'Running Python Programs',
            'Writing Python Code',
          ],
        ),
        CourseSyllabus(
          sections: 'Working with Data',
          content: [
            'Data Types and Variables',
            'Using Numeric Variables',
            'Using String Variables',
          ],
        ),
        CourseSyllabus(
          sections: 'Input and Output',
          content: [
            'Printing with Parameters',
            'Getting Input from a User',
            'String Formatting',
          ],
        ),
        CourseSyllabus(
          sections: 'Making Decisions',
          content: [
            'Logical Expressions',
            'The "if" Statement',
            'Logical Operators',
            'More Complex Expressions',
          ],
        ),
      ],
      shedule:
          WeekendShedule(date: '', startTime: '8:00 AM', endTime: '10:00 AM'),
      isBest: false,
      isFeatured: false,
      isPopular: false,
      isVerified: false,
      createdAt: 'Jan 25, 2023',
      updatedAt: 'Jan 25, 2023',
      status: true,
    ),
  ];
}

class CourseSyllabus {
  final String sections;
  final List<String> content;

  CourseSyllabus({required this.sections, required this.content});
}

class WeekendShedule {
  final String? date;
  final String startTime;
  final String endTime;
  final String? holiday;

  WeekendShedule(
      {this.date,
      required this.startTime,
      required this.endTime,
      this.holiday});
}
