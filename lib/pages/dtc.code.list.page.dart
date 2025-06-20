import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:dtc_harleys_app/common/labels.and.hints.dart';
import 'package:dtc_harleys_app/common/messages.dart';
import 'package:dtc_harleys_app/components/centered.message.dart';
import 'package:dtc_harleys_app/components/my.text.form.field.dart';
import 'package:dtc_harleys_app/components/progress.dart';
import 'package:dtc_harleys_app/controllers/dtc.code.list.controller.dart';
import 'package:dtc_harleys_app/models/dtc.code.dart';
import 'package:dtc_harleys_app/components/my.appbar.dart';
import 'package:dtc_harleys_app/components/my.bottom.appbar.dart';

const String _title = 'Códigos DTC';

class DtcCodeListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DtcCodeListPageState();
  }
}

class DtcCodeListPageState extends State<DtcCodeListPage> {
  final DtcCodeListController _controller = DtcCodeListController();

  @override
  void initState() {
    _controller.getFuture().then((value) {
      if (value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    }).catchError((e) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar:
              _controller.isHidedButton ? null : MyBottomAppBar(),
          body: FutureBuilder<List<DtcCode>>(
            future: _controller.future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                case ConnectionState.active:
                  break;
                default:
                  if (snapshot.hasError) {
                    return CenteredMessage(
                      title: ERROR,
                      message: snapshot.error.toString(),
                    );
                  } else {
                    if ((snapshot.data?.length)! > 0) {
                      _controller.init();
                      _controller.codes.addAll(snapshot.data!);
                      return _widgets();
                    } else
                      return CenteredMessage(
                        title: WARNING,
                        message: NOTEXIST,
                      );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                title: ERROR,
                message: UNKNOWN,
              );
            },
          ),
        ),
      );

  _widgets() => Column(
        children: [
          SizedBox(height: 10),
          MyTextFormField(
            textEditingController: _controller.codeCtrl,
            label: labelDtcCode,
            hint: hintDtcCode,
            icon: Icons.search,
            inputType: TextInputType.text,
            onChanged: _controller.setFilter,
          ),
          Expanded(
            child: Observer(
              builder: (_) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: _controller.listFiltered.length,
                itemBuilder: (_, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[100],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      title: Text(
                        _controller.listFiltered[i].code,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _controller.listFiltered[i].description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(color: Colors.black,)
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                                  _getGroup(_controller.listFiltered[i].code),
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black,)
                            ),
                          ),
                        ],
                      ),
                      leading: CircleAvatar(
                        child: Icon(Icons.error_outline_rounded),
                        backgroundColor: Colors.red,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
          ),
        ],
      );

  String _getGroup(String code) {
    if (code.startsWith('P'))
      return 'Problema monitorado pela ECM';
    else if (code.startsWith('C'))
      return 'Problema com ABS';
    else if (code.startsWith('B'))
      return 'Problema definido por Rádio, Instrumentos e BCM';
    else
      return 'Problema de comunicação com os módulos';
  }
}
