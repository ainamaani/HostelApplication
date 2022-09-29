import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proj/models/user.dart';
import 'package:proj/sreens/authenticate.dart';
import 'package:proj/sreens/hostelsdetails.dart';
import 'package:proj/sreens/login.dart';
import 'package:proj/sreens/register.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr>(context);

    //return either home or autheticate
    if (user == null) {
      return Authenticate();
    } else {
      return HostelDetails();
    }
  }
}
