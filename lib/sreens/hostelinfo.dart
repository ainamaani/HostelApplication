// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// // void main() {
// //   runApp(MaterialApp(
// //     debugShowCheckedModeBanner: false,
// //   ));
// // }

// class HostelInfo extends StatefulWidget {
//   const HostelInfo({Key key}) : super(key: key);

//   @override
//   State<HostelInfo> createState() => _HostelInfoState();
// }

// class _HostelInfoState extends State<HostelInfo> {
//   final Stream<QuerySnapshot> hostelinfo = FirebaseFirestore.instance
//       .collection('hostels')
//       //.doc('Olympia')
//       .snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder(
//     stream:  final Stream<QuerySnapshot> hostelinfo = FirebaseFirestore.instance
//  ,
//     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

//       // If we got an error
//       if (snapshot.hasError) {
//         return Center(
//           child: Text(
//             '${snapshot.error} occurred',
//             style: TextStyle(fontSize: 18),
//           ),
//         );

//         // if we got our data
//       } if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: Text("Loading"));}

//         return ListView(
//              children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                Map<String, dynamic> data =
//                    document.data()! as Map<String, dynamic>;
//                return ListTile(
//                  title: Text(data['songId']),
//                  //subtitle: Text(data['songurl']),
//                  trailing: Text(data['likes'].toString()),
//                );
//              }).toList(),);

//   }

//     ),);
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HostelInfo extends StatefulWidget {
  @override
  _HostelInfoState createState() => _HostelInfoState();
}

class _HostelInfoState extends State<HostelInfo> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('hostels').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          body: ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['hostelname']),
                subtitle: Text(data['servicesoffered']),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
