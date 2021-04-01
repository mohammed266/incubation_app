import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/views/search/search_controller.dart';
import 'package:incubation_app/views/search/search_model.dart';

class SearchScreen extends StatelessWidget {
  SearchController _controller = SearchController();
  SearchModel _model = SearchModel();

  void search(String value)async{
    _model = await _controller.getSearch(search: value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xFF273370),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: EasyLocalization.of(context).locale ==
                              Locale('en', 'US')
                          ? MediaQuery.of(context).size.width / 4.5
                          : MediaQuery.of(context).size.width / 3.5,
                    ),
                    Text(
                      'بحث',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFECEFFF)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: search,
                          decoration: InputDecoration(
                            hintText: 'اكتب بحثك هنا',
                            hintStyle: TextStyle(
                                color: Color(0xFF273370), fontSize: 12),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.search,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ),
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   'ما الذى تبحث عنه ؟',
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Color(0xFF273370),
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Column(
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Container(
                      //           height: 40,
                      //           width: MediaQuery.of(context).size.width * 0.35,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Color(0xFFAAAAAA)),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: Center(
                      //               child: Text(
                      //             'تواصل معنا',
                      //             style: TextStyle(
                      //                 fontSize: 10, color: Color(0xFFAAAAAA)),
                      //           )),
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Container(
                      //           height: 40,
                      //           width: MediaQuery.of(context).size.width * 0.35,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Color(0xFFAAAAAA)),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: Center(
                      //               child: Text(
                      //             'السياسة والانظمة',
                      //             style: TextStyle(
                      //                 fontSize: 10, color: Color(0xFFAAAAAA)),
                      //           )),
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: 10,
                      //     ),
                      //     Row(
                      //       children: [
                      //         Container(
                      //           height: 40,
                      //           width: MediaQuery.of(context).size.width * 0.4,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Color(0xFFAAAAAA)),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: Center(
                      //               child: Text(
                      //             'اقسام المركز',
                      //             style: TextStyle(
                      //                 fontSize: 12, color: Color(0xFFAAAAAA)),
                      //           )),
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Container(
                      //           height: 40,
                      //           width: MediaQuery.of(context).size.width * 0.3,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Color(0xFFAAAAAA)),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               'خدمات المركز',
                      //               style: TextStyle(
                      //                   fontSize: 10, color: Color(0xFFAAAAAA)),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: 10,
                      //     ),
                      //     Row(
                      //       children: [
                      //         Container(
                      //           height: 40,
                      //           width: MediaQuery.of(context).size.width * 0.3,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Color(0xFFAAAAAA)),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               'من نحن',
                      //               style: TextStyle(
                      //                   fontSize: 10, color: Color(0xFFAAAAAA)),
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Container(
                      //           height: 40,
                      //           width: MediaQuery.of(context).size.width * 0.4,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Color(0xFFAAAAAA)),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               'حصص الفنون و الأنشطة',
                      //               style: TextStyle(
                      //                   fontSize: 10, color: Color(0xFFAAAAAA)),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*class DataSearch extends SearchDelegate {
  SearchController _searchController = SearchController();
  // List<dynamic> list = [];
  // DataSearch({this.list});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {}),
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: _searchController.listOfSearch.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          leading: Icon(Icons.stream,color: Colors.red,),
          title: Text(_searchController.listOfSearch[index].title),
        );
      },
    );
  }
} */

// class Speech extends StatefulWidget {
//   @override
//   _SpeechState createState() => _SpeechState();
// }
// class _SpeechState extends State<Speech> {
//   SearchController _searchController = SearchController();
//   TextEditingController _textEditingController = TextEditingController();
//   bool _hasSpeech = false;
//   double level = 0.0;
//   String lastWords = '';
//   String lastError = '';
//   String lastStatus = '';
//   String _currentLocaleId = '';
//   int resultListened = 0;
//   // List<LocaleName> _localeNames = [];
//   // final SpeechToText speech = SpeechToText();
//
//   @override
//   void initState() {
//     // initSpeechState();
//     super.initState();
//   }
//
//   // Future<void> initSpeechState() async {
//   //   var hasSpeech = await speech.initialize(
//   //       onError: errorListener, onStatus: statusListener, debugLogging: true);
//   //   if (hasSpeech) {
//   //     _localeNames = await speech.locales();
//   //     _currentLocaleId = 'ar_SA';
//   //   }
//   //
//   //   if (!mounted) return;
//   //
//   //   setState(() {
//   //     _hasSpeech = hasSpeech;
//   //   });
//   // }
//
//   bool loading = false;
//   // SearchModel _searchModel = SearchModel();
//   // List<Products> products = [];
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Search'),
//           centerTitle: true,
//         ),
//         body: Builder(
//           builder: (context) =>  loading
//               ? Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.red,
//             ),
//           )
//               : Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               // padding: EdgeInsets.all(20),
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextField(
//                   controller: _textEditingController,
//                   decoration: InputDecoration(
//                       suffixIcon: GestureDetector(
//                         child: IconButton(
//                           icon: Icon(
//                             Icons.mic,
//                             color: Colors.red,
//                           ),
//                           onPressed: () {},
//                         ),
//
//                         //   on: () => startListening(),
//                         //  onSecondaryTap: () => stopListening(),
//                         onLongPress: () => startListening(),
//                         onLongPressEnd: (_) => stopListening(),
//                       ),
//                       contentPadding: EdgeInsets.symmetric(horizontal: 15),
//                       fillColor: Colors.grey[200],
//                       //    hintStyle: TextStyle(color: Colors.black),
//                       filled: true,
//                       border:
//                       OutlineInputBorder(borderSide: BorderSide.none)),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   child: CustomButtom(
//                       color: Colors.red,
//                       fontcolor: Colors.white,
//                       fontsize: 20,
//                       ontap: () async {
//                         products.clear();
//                         setState(() {
//                           loading = true;
//                         });
//                         final _searchModel = await SearchController()
//                             .postSearch(search: _textEditingController.text);
//                         products = _searchProductsModel.products;
//                         setState(() {
//                           loading = false;
//                         });
//                       },
//                       text: translator.translate("Search")),
//                 ),
//                 if (products.isNotEmpty)
//                   Expanded(
//                       child: GridView.builder(
//
//                           gridDelegate:
//                           SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisSpacing: 10,
//                             crossAxisCount: 2,
//                             childAspectRatio: ((size.width / 7) / (size.height / 8)),
//                           ),
//                           itemCount: products.length,
//                           itemBuilder: (_, index) =>
//                               SearchCard(
//                                   text: products[index].name,
//                                   image: products[index].thumb,
//                                   price: products[index].price,
//                                   productId: products[index].productId,
//                                   productname: products[index].name,
//                                   addFavourite: () async {
//                                     String message = await FavouriteController()
//                                         .addRemoveFavourite(
//                                         products[index].productId,
//                                         '/account/add_user_favorites');
//                                     showSnackBar(context, message);
//                                   }))),
//
//               ],
//             ),
//           ),
//         ));
//   }
//
//   void startListening() {
//     lastWords = '';
//     lastError = '';
//     speech.listen(
//         onResult: resultListener,
//         listenFor: Duration(seconds: 3),
//         pauseFor: Duration(seconds: 3),
//         partialResults: false,
//         localeId: _currentLocaleId,
//         onSoundLevelChange: soundLevelListener,
//         cancelOnError: true,
//         listenMode: ListenMode.confirmation);
//     setState(() {});
//   }
//
//   void stopListening() {
//     speech.stop();
//     setState(() {
//       level = 0.0;
//     });
//   }
//
//   void cancelListening() {
//     speech.cancel();
//     setState(() {
//       level = 0.0;
//     });
//   }
//
//   void resultListener(SpeechRecognitionResult result) {
//     ++resultListened;
//     setState(() {
//       lastWords = '${result.recognizedWords}';
//       _textEditingController.text = lastWords;
//     });
//   }
//
//   void soundLevelListener(double level) {
//     minSoundLevel = min(minSoundLevel, level);
//     maxSoundLevel = max(maxSoundLevel, level);
//     // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
//     setState(() {
//       this.level = level;
//     });
//   }
//
//   void errorListener(SpeechRecognitionError error) {
//     // print("Received error status: $error, listening: ${speech.isListening}");
//     setState(() {
//       lastError = '${error.errorMsg} - ${error.permanent}';
//     });
//   }
//
//   void statusListener(String status) {
//     // print(
//     // 'Received listener status: $status, listening: ${speech.isListening}');
//     setState(() {
//       lastStatus = '$status';
//     });
//   }
//
//   void _switchLang(selectedVal) {
//     setState(() {
//       _currentLocaleId = selectedVal;
//     });
//     print(selectedVal);
//   }
// }
