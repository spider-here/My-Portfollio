import 'package:zakwan_ali_portfolio/data/models/qualification.dart';
import 'package:zakwan_ali_portfolio/data/models/work_experience.dart';

class LocalData {
  static LocalData? _instance;

  LocalData._internal();

  static LocalData get instance {
    _instance ??= LocalData._internal();
    return _instance!;
  }

  static const String welcome = 'Hi, I\'m Zakwan';
  static const String headline = 'Crafting Seamless Experiences with';
  static const String headlineStyled = 'Flutter Magic.';
  static const String introduction =
      'Experienced Flutter developer with a strong background in web and '
      'mobile app development. Committed to continuous learning and dedicated'
      ' to delivering quality work.';
  static const String about =
      '''I'm a highly experienced Flutter Developer and Team Lead with over 5 years of expertise in building scalable, high-performance mobile and web applications. With an MSc in Computer Science from the University of Wah, I’ve worked with both top-tier software firms in Pakistan and international clients, delivering innovative cross-platform solutions across healthcare, IoT, education, e-commerce, and real-time communication sectors.

My core technical stack includes Flutter/Dart, Firebase, and RESTful APIs, with strong proficiency in state management using Bloc and GetX. I’ve successfully integrated a variety of third-party services such as Stripe, In-App Purchases, Flutter Checkout, Agora Video SDK, BLE, and Google Maps, building applications that require real-time communication, secure transactions, and hardware interactions. I’m also well-versed in modern development tools like Git/GitHub, Android Studio, Xcode, VS Code, Postman, and Figma, ensuring efficient and collaborative development workflows.

I actively apply Agile methodologies (Scrum) and have experience with CI/CD pipelines and project management tools like Trello and Jira, enabling smooth, transparent, and timely delivery of high-quality products. I’ve led full development cycles — from requirement gathering and UI/UX collaboration to testing, deployment, and client handovers — while mentoring junior developers and contributing to team scalability and performance.

I’m passionate about writing clean, maintainable code and building products that are not only technically solid but also deliver an exceptional user experience. My goal is to continuously innovate and solve real-world problems through technology, whether in a team environment or independently managing projects end-to-end.''';

  static const List<Qualification> qualifications = <Qualification>[];
  static const List<WorkExperience> workExperiences = <WorkExperience>[];
  static const String copyright = '© 2025 Zakwan Ali Tariq. All rights reserved.';

  static const String resumeUrl = 'https://firebasestorage.googleapis.com/v0/b/zakwan-ali.appspot.com/o/cv%2FZakwan%20Ali%20Tariq%20-%20CV.pdf?alt=media&token=f2596387-81e5-494d-b049-d6a52be00222';
}
