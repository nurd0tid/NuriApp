import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuri_app/screens/home/dashboard.dart';
import 'package:nuri_app/screens/quran/quran.dart';
import 'package:nuri_app/utils/dimensions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuranDetailPage extends StatelessWidget {
  final int id;
  const QuranDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final String apiUrl = "https://api.quran.gading.dev/surah/$id";

    Future<List<dynamic>> _fecthDataUsers() async {
      var result = await http.get(Uri.parse(apiUrl));
      return json.decode(result.body)['data']['verses'];
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (_) => QuranPage())),
            child: Icon(
              IconlyLight.arrowLeft,
              color: Color(0xFF035A2f),
            ),
          ),
          title: Text(
            "Al-Fatiha",
            style: GoogleFonts.getFont('Poppins',
                fontWeight: FontWeight.w600, fontSize: Dimensions.font16, color: Color(0xFF035A2F)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: Dimensions.height10,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/card1.png",
                  width: Dimensions.width10 * 38,
                ),
                FutureBuilder(
                    future: _fecthDataUsers(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: Dimensions.width16,
                                right: Dimensions.width16,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: Dimensions.height10 * 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          margin: EdgeInsets.only(left: Dimensions.width16),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50), color: Color(0xFF035A25)),
                                          child: Text(
                                            snapshot.data[index]['number']['inSurah'].toString(),
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: Dimensions.font20,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: Dimensions.width16),
                                          child: Icon(
                                            IconlyLight.play,
                                            color: Color(0xFF035A2F),
                                            size: Dimensions.iconSize16 * 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: Dimensions.width10 * 40,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 1.0, color: Color(0xFFBBC4CE)),
                                      ),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: Dimensions.width16,
                                        right: Dimensions.width16,
                                        top: Dimensions.height10,
                                        bottom: Dimensions.height10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot.data[index]['text']['arab'],
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: Dimensions.font24,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height30,
                                        ),
                                        Text(
                                          snapshot.data[index]['translation']['id'],
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: Dimensions.font14,
                                            color: Colors.grey.shade700,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
