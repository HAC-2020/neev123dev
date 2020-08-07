import 'package:neev123dev/repository/corona_bloc.dart';
import 'package:neev123dev/util/package_Info.dart';
import 'package:neev123dev/widget/config/widget_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).backgroundColor.withOpacity(0.5),
        child: ListView(
          padding: const EdgeInsets.only(top: 0.0),
          children: <Widget>[
            _UserAccountsDrawerHeaderWidget(),
            _buildAppInfoListTile(context),
          ],
        ),
      ),
    );
  }

  Row _buildDrawerRow(String text, IconData iconData, BuildContext context) {
    return Row(children: <Widget>[
      Icon(
        iconData,
        size: 24,
      ),
      const SizedBox(
        width: 20,
      ),
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }

  ListTile _buildAppInfoListTile(BuildContext context) {
    return ListTile(
      title: _buildDrawerRow('App info', FontAwesomeIcons.infoCircle, context),
      onTap: () {
        Navigator.pushNamed(context, appInfoRoute);
      },
    );
  }


  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true);
    }
  }
}

class _UserAccountsDrawerHeaderWidget extends StatelessWidget {
  const _UserAccountsDrawerHeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        '$appName',
        textAlign: TextAlign.right,
        style: GoogleFonts.concertOne(fontSize: 17),
      ),
      accountEmail: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          child: Text(
            '${CoronaBloc().globalInfoDto$?.updatedDate ?? ""}',
            textAlign: TextAlign.right,
            style: GoogleFonts.concertOne(fontSize: 17),
          )),
      currentAccountPicture: const Image(
        image: AssetImage(
          imageAppIcon,
        ),
      ),
    );
  }
}