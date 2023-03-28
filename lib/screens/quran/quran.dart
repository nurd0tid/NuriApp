import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuri_app/screens/home/dashboard.dart';
import 'package:nuri_app/utils/dimensions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  final String apiUrl = "https://api.quran.gading.dev/surah";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (_) => DashboardPage())),
            child: Icon(
              IconlyLight.arrowLeft,
              color: Color(0xFF035A2f),
            ),
          ),
          title: Text(
            "Baca Qur'an",
            style: GoogleFonts.getFont('Poppins',
                fontWeight: FontWeight.w600, fontSize: Dimensions.font16, color: Color(0xFF035A2F)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: Dimensions.width16,
              right: Dimensions.width16,
              top: Dimensions.height20,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox
                  Stack(
                    children: [
                      SizedBox(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: Dimensions.height10,
                            bottom: Dimensions.height20,
                          ),
                          width: Dimensions.width10 * 38,
                          height: Dimensions.height10 * 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                            gradient: const LinearGradient(end: Alignment.bottomRight, colors: [
                              Color.fromARGB(255, 9, 110, 21),
                              Color(0xFF035A2F),
                            ]),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/image/quran_book.png",
                            width: Dimensions.width10 * 15,
                            height: Dimensions.height10 * 16,
                          ),
                          Container(
                            width: Dimensions.width10 * 22,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Maka Bersabarlah kamu. Sungguh, janji Allah itu benar',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontSize: Dimensions.font14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.height30,
                                ),
                                Text(
                                  '[QS. Ar-Rum: 60]',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontSize: Dimensions.font12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  // List Quran
                  FutureBuilder(
                    future: _fecthDataUsers(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                print(snapshot.data[index]['number']);
                              },
                              onHover: (value) {},
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 1.0, color: Color(0xFFBBC4CE)),
                                  ),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/image/iconNumber.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(Dimensions.width15),
                                          child: Text(
                                            '${index + 1}',
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              fontSize: Dimensions.font14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF035A2F),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            snapshot.data[index]['name']['transliteration']['id'],
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              fontSize: Dimensions.font16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                snapshot.data[index]['revelation']['id'],
                                                style: GoogleFonts.getFont('Poppins',
                                                    fontSize: Dimensions.font12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF8789A3)),
                                              ),
                                              Text(
                                                " - ",
                                                style: GoogleFonts.getFont('Poppins',
                                                    fontSize: Dimensions.font12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF8789A3)),
                                              ),
                                              Text(
                                                snapshot.data[index]['numberOfVerses'].toString(),
                                                style: GoogleFonts.getFont('Poppins',
                                                    fontSize: Dimensions.font12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF8789A3)),
                                              ),
                                              Text(
                                                " Ayat",
                                                style: GoogleFonts.getFont('Poppins',
                                                    fontSize: Dimensions.font12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF8789A3)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        snapshot.data[index]['name']['short'],
                                        style: GoogleFonts.getFont('Poppins',
                                            fontSize: Dimensions.font16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF035A2F)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: Dimensions.height50 * 3,
                            ),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
