import 'package:dtc_harleys_app/common/settings.dart';
import 'package:flutter/material.dart';
import 'package:dtc_harleys_app/pages/dtc.code.access.oldmodels.page.dart';
import 'package:dtc_harleys_app/pages/dtc.code.know.more.page.dart';
import 'package:dtc_harleys_app/pages/dtc.code.list.page.dart';
import 'package:dtc_harleys_app/pages/dtc.code.abbreviation.list.page.dart';
import 'package:dtc_harleys_app/pages/dtc.code.access.newmodels.page.dart';

const String _labelAppTitle = 'DTC Harleys App';
const String _pathLogo = 'lib/assets/imgs/codigosdtc.png';
const String _labelPrivacy = 'Política de privacidade';
const List<String> _listAdmScreens = ["Códigos DTC", "Siglas", "Saiba mais"];
const List<String> _listAdmScreensDesc = [
  "Códigos de erro catalogados pela HD",
  "Siglas utilizadas nos erros",
  "Saiba mais sobre os Códigos DTC",
];
const List<IconData> _listAdmIcons = [
  Icons.error_outline_rounded,
  Icons.abc_outlined,
  Icons.info,
];

// ignore: must_be_immutable
class DtcCodeDashboardPage extends StatefulWidget {
  @override
  State<DtcCodeDashboardPage> createState() => _DtcCodeDashboardPageState();
}

class _DtcCodeDashboardPageState extends State<DtcCodeDashboardPage> {
  final List<Widget> _listAdmWidgets = [
    DtcCodeListPage(),
    DtcCodeAbbreviationListPage(),
    DtcCodeKnowMorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawr(),
      drawerEdgeDragWidth: 50,
      drawerScrimColor: Colors.black87,
      body: Stack(children: <Widget>[_dashBg(), _content(context)]),
    );
  }

  AppBar _appBar() => AppBar(
    elevation: 1.0,
    leading: Builder(
      builder:
          (context) => Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu_rounded),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ],
          ),
    ),
    title: Text(
      _labelAppTitle,
      style: TextStyle(color: Colors.white, fontSize: 25.0),
    ),
    centerTitle: true,
    toolbarHeight: 40.0,
    backgroundColor: Colors.deepOrange[300],
  );

  _drawr() => Drawer(
    child: ListView(
      children: <Widget>[
        Text(_labelAppTitle, textAlign: TextAlign.center),
        UserAccountsDrawerHeader(
          accountName: Text('Olá, Harleyro(a)'),
          accountEmail: Text('gapsolutions.slz@gmail.com'),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(_pathLogo),
              fit: BoxFit.fill,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Sobre o DTC Harleys App'),
          onTap: () {
            showAboutDialog(
              context: context,
              applicationVersion: APP_VERSION,
              applicationName: _labelAppTitle,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: const Text(
                    'Este aplicativo é propriedade da Gap Solutions Slz.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: const Text(
                    'Desenvolvedor: Adalberto Jr.',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: const Text(
                    'Email: gapsolutions.slz@gmail.com',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2, bottom: 20),
                  child: const Text(
                    'Copyright 2025 Brasil',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  child: Container(
                    child: Image.asset(_pathLogo),
                  ),
                ),
              ],
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text(_labelPrivacy),
          /*onTap: () async {
            if (remotePDFpath.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFScreen(path: remotePDFpath),
                ),
              );
            }
          },*/
        ),
      ],
    ),
  );

  _dashBg() => Column(
    children: <Widget>[
      Expanded(child: Container(color: Colors.deepOrange[300])),
      Expanded(flex: 2, child: Container(color: Colors.transparent)),
    ],
  );

  _content(BuildContext context) => Container(
    child: Column(
      children: <Widget>[
        SizedBox(height: 50),
        _bar(context),
        SizedBox(height: 35),
        _grid(),
      ],
    ),
  );

  _bar(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _BarButton(
        'Até 2004',
        'Forma de acesso',
        Icons.motorcycle_outlined,
        Colors.orange,
        onClick: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_gContext) => DtcCodeAccessOldModelsPage(),
            ),
          );
        },
      ),
      _BarButton(
        'A partir de 2005',
        'Forma de acesso',
        Icons.motorcycle_sharp,
        Colors.white,
        onClick: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_gContext) => DtcCodeAccessNewModelsPage(),
            ),
          );
        },
      ),
    ],
  );

  _grid() => Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: ListView.builder(
        itemCount: _listAdmScreens.length,
        itemBuilder: _listItem,
      ),
    ),
  );

  Widget _listItem(BuildContext context, int index) => Card(
    color: Colors.deepOrange[100],
    shadowColor: Colors.black,
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(_listAdmIcons[index], size: 50, color: Colors.orange),
          title: Text(
            _listAdmScreens[index],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _listAdmScreensDesc[index],
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_gContext) => _listAdmWidgets[index]),
            );
          },
        ),
      ],
    ),
  );
}

class _BarButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Function onClick; //callback

  _BarButton(
    this.title,
    this.subtitle,
    this.icon,
    this.iconColor, {
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: Colors.deepOrange[100],
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: 110,
            width: MediaQuery.of(context).size.width / 2 - 15,
            //width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(icon, color: iconColor, size: 50.0),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle, style: TextStyle(fontSize: 12.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
