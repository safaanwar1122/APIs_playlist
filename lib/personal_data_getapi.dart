import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/PersonalDataModel.dart';

class GetPersonalDataAPI extends StatefulWidget {
  const GetPersonalDataAPI({Key? key}) : super(key: key);

  @override
  State<GetPersonalDataAPI> createState() => _GetPersonalDataAPIState();
}

class _GetPersonalDataAPIState extends State<GetPersonalDataAPI> {
  // Future<List> userData=[];
  Future<PersonalDataModel> getpersonalData() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      // for (Map i in data) {
      //   PersonalDataModel info = PersonalDataModel(
      //       page: i['page'],
      //       value: i['value'],
      //       url: i['url'],
      //       perPage: i['perPage'],
      //       total: i['total'],
      //       totalPages: i['totalPages'],
      //       data: i['data'],
      //       support: i['support']);
      // }
      return PersonalDataModel.fromJson(data);
    } else {
      return PersonalDataModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get API data '),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getpersonalData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(

                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data!.data![index].avatar.toString()),

                            ),
                            subtitle: Text(snapshot.data!.data![index].email.toString()),
                            title: Text(snapshot.data!.data![index].id.toString()),

                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}

//Text( snapshot.data!.data![index].email.toString()),
//snapshot.data!.data![index].productName.toString()),
// class ReuseableRow extends StatelessWidget {
//   int? page, perPage, total, totalPages;
//   String? value, avatar, support;
//
//   ReuseableRow(
//       {Key? key,
//       required this.page,
//       required this.value,
//    required this.avatar,
//       this.perPage,
//       this.support,
//       this.total,
//     this.totalPages})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(page.toString()),
//           Text(value!),
//           Text(avatar!),
//         ],
//       ),
//     );
//   }
// }
