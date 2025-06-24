import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:google_fonts/google_fonts.dart';
class ResumePreviewPage extends StatelessWidget {
  const ResumePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume Generator')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final pdf = await generateResumePdf();
            await Printing.layoutPdf(onLayout: (format) => pdf.save());
          },
          child: const Text('Generate Resume PDF'),
        ),
      ),
    );
  }

//   Future<pw.Document> generateResumePdf() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(20),
//         build: (pw.Context context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('Your Name', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Project Manager', style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('LinkedIn: linkedin.com/in/yourname'),
//               pw.Text('Email: info@bookyourcv.com | Phone: +91 0000000000'),
//               pw.SizedBox(height: 20),

//               // Blue Section
//               pw.Container(
//                 color: PdfColors.blue800,
//                 padding: const pw.EdgeInsets.all(10),
//                 width: double.infinity,
//                 child: pw.Column(
//                   children: [
//                     pw.Text('TECHNO - MANAGERIAL ROLES', style: pw.TextStyle(color: PdfColors.white, fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 2),
//                     pw.Text('Project Management   |   Service Delivery   |   IT Operations',
//                       style: pw.TextStyle(color: PdfColors.white, fontSize: 10))
//                   ],
//                 ),
//               ),
//               pw.SizedBox(height: 20),

//               pw.Text('A BRIEF SNAPSHOT', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
//               pw.Bullet(text: 'Diligent Project Manager with a proven record of success in managing tech projects.'),
//               pw.Bullet(text: 'Experienced in Infosys leading project deliveries with business goals in mind.'),
//               pw.Bullet(text: 'Skilled in program management, stakeholder alignment, and performance delivery.'),

//               pw.SizedBox(height: 20),
//               pw.Text('SIGNATURE SKILLS', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
//               pw.Row(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Expanded(child: pw.Column(children: [
//                     pw.Bullet(text: 'PMO Management'),
//                     pw.Bullet(text: 'Service Delivery'),
//                     pw.Bullet(text: 'Governance')
//                   ])),
//                   pw.Expanded(child: pw.Column(children: [
//                     pw.Bullet(text: 'Requirements Analysis'),
//                     pw.Bullet(text: 'Costing & Budgeting'),
//                     pw.Bullet(text: 'Scheduling')
//                   ])),
//                   pw.Expanded(child: pw.Column(children: [
//                     pw.Bullet(text: 'Team Mentoring'),
//                     pw.Bullet(text: 'CoE Leadership'),
//                     pw.Bullet(text: 'Cross-Functional Teams')
//                   ]))
//                 ]
//               ),

//               pw.SizedBox(height: 20),
//               pw.Text('CAREER CONTOUR', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
//               pw.SizedBox(height: 5),
//               pw.Text('Oct 2018 - Present: XYZ TECHNOLOGIES, Project Manager', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.Bullet(text: 'Led business-critical initiatives across technical & business domains.'),
//               pw.Bullet(text: 'Managed Agile sprints and aligned project goals with stakeholders.'),

//               pw.SizedBox(height: 20),
//               pw.Text('SCHOLASTICS PORTFOLIO', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
//               pw.Text('Graduate Diploma in Business Administration – Finance – 2008'),

//               pw.Spacer(),
//               pw.Container(
//                 color: PdfColors.blue800,
//                 width: double.infinity,
//                 padding: const pw.EdgeInsets.all(10),
//                 child: pw.Text(
//                   'Address: Sector-20, Panchkula, Haryana - 134116\nWork Authorization: Permanent Residency for Australia',
//                   style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
//                   textAlign: pw.TextAlign.center,
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );

//     return pdf;
//   }
// }



Future<pw.Document> generateResumePdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(20),
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header Section
            pw.Text('AMIT SUNIL',
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
                ),
            pw.Text('FLUTTER DEVELOPER',
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.normal)),
            pw.SizedBox(height: 10),
            pw.Text('LinkedIn: www.linkedin.com/in/amit-sunil-305533361'),
            pw.Text('GitHub: github.com/amitsunil75'),
            pw.Text('Email: amitsunil75@gmail.com | Phone: +91 8075384136'),
            pw.Text('Location: Kannur, Kerala'),
            pw.SizedBox(height: 20),

            // Blue Highlight
            pw.Container(
              color: PdfColors.blue800,
              padding: const pw.EdgeInsets.all(10),
              width: double.infinity,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('PROFESSIONAL SUMMARY',
                      style: pw.TextStyle(
                          color: PdfColors.white,
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 5),
                  pw.Text(
                    'Detail-oriented and results-driven Flutter Developer with over 3 years of experience designing, developing, and deploying high-quality cross-platform mobile applications.',
                    style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
                  ),
                  pw.Text(
                    'Skilled in clean code architecture, state management, third-party integrations, and Agile development practices.',
                    style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 20),

            // Education
            pw.Text('EDUCATION',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.Text(
                'Aug 2016 - March 2020: Bachelor of Computer Science and Engineering, Anna University'),
            pw.Text('Final CGPA: 6.90 / 10'),
            pw.SizedBox(height: 20),

            // Professional Experience
            pw.Text('PROFESSIONAL EXPERIENCE',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.Text('June 2023 - Present: Amitron Systems, Kannur, Kerala',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Bullet(
                text:
                    'Built and maintained multiple cross-platform mobile apps using Flutter and Firebase'),
            pw.Bullet(
                text:
                    'Collaborated with designers and backend teams to integrate APIs and design responsive UIs'),
            pw.Bullet(
                text:
                    'Participated in agile development cycles and code reviews'),
            pw.Bullet(
                text:
                    'Deployed apps to Play Store and monitored performance with analytics tools'),

            pw.SizedBox(height: 10),
            pw.Text('Sep 2022 - Mar 2023: SRV Infotech, Kannur, Kerala',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Bullet(
                text:
                    'Assisted in developing and testing Flutter applications'),
            pw.Bullet(
                text:
                    'Worked on UI optimization and bug fixing for production apps'),
            pw.Bullet(
                text:
                    'Gained hands-on experience with Git, Firebase, and RESTful APIs'),

            pw.SizedBox(height: 20),

            // Technical Skills
            pw.Text('TECHNICAL SKILLS',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.Text('Languages & Frameworks: Dart, Flutter, Kotlin'),
            pw.Text('State Management: Provider, Riverpod'),
            pw.Text('Backend & APIs: Firebase, RESTful APIs'),
            pw.Text('Databases: Firebase Firestore, SQLite'),
            pw.Text('Tools: Android Studio, VS Code, Git, GitHub, Postman'),
            pw.Text('Design: Figma, Responsive Design, Dark/Light Mode'),
            pw.Text('Others: Push Notifications, Google Maps, Payment Gateway, Play Store Deployment'),
            pw.SizedBox(height: 20),

            // Languages
            pw.Text('LANGUAGES',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.Text('English – Fluent'),
            pw.Text('Hindi – Fluent'),
            pw.Text('Malayalam – Native'),

            pw.Spacer(),
            // Footer
            pw.Container(
              color: PdfColors.blue800,
              padding: const pw.EdgeInsets.all(10),
              width: double.infinity,
              child: pw.Text(
                'Portfolio PDF generated using Flutter | www.github.com/amitsunil75',
                style: pw.TextStyle(color: PdfColors.white, fontSize: 10),
                textAlign: pw.TextAlign.center,
              ),
            ),
          ],
        );
      },
    ),
  );

  return pdf;
}
}