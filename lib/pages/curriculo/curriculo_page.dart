import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seujobapp/pages/curriculo/components/form_info_academicas.dart';
import 'package:seujobapp/pages/curriculo/components/form_info_pessoais.dart';
import 'package:seujobapp/pages/curriculo/components/form_info_profissionais.dart';

import '../../utils/app_routes.dart';

class CurriculoPage extends StatefulWidget {
  const CurriculoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CurriculoPageState();
}

class _CurriculoPageState extends State<CurriculoPage> {
  final picker = ImagePicker();
  final cropper = ImageCropper();
  late File _selectedImage;
  bool _inProcess = false;
  var img;
  var selectedPage = 0;

  var options = ["Informações pessoais", "Informações acadêmicas", "Informações profissionais"];

  List<Widget> widgets = [FormInfoPessoais(), FormInfoAcademicas(), Container()];

  getImage(ImageSource src) async {
    setState(() {
      _inProcess = true;
    });
    final pickedFile = await picker.pickImage(source: src);

    if (pickedFile != null) {
      File? cropped = await cropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Camera',
        ),
        iosUiSettings: const IOSUiSettings(
          title: 'Camera',
        ),
      );
      setState(() {
        _selectedImage = cropped!;
        img = cropped;
        _inProcess = false;
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Foto atualizada com sucesso!");
      });
    } else {
      setState(() {
        _inProcess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.HOME);
          },
        ),
        title: Row(
          children: [
            Expanded(
                child: Container(
                  child: Text("Meu Perfil")
                )
            ),
            IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.save)
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Divider(height: 10,),
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.blueGrey,
                padding: EdgeInsets.all(15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.50,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: (img==null) ? Image.network('https://e7.pngegg.com/pngimages/81/570/png-clipart-profile-logo-computer-icons-user-user-blue-heroes-thumbnail.png') : Image.file(img),
                )
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                onPressed: () => {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext _) {
                        return Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 2, color: Colors.grey))
                                ),
                                width: double.infinity,
                                child: Text("Escolha uma opção:", style: TextStyle(fontSize: 20),),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    getImage(ImageSource.camera);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    width: double.infinity,
                                    child: const Text("Tirar foto"),
                                  )
                              ),
                              Divider(),
                              GestureDetector(
                                  onTap: () {
                                    getImage(ImageSource.gallery);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    width: double.infinity,
                                    child: const Text("Escolher foto da galeria"),
                                  )
                              ),
                              Divider(),
                            ],
                          ),
                        );
                      })
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Editar foto"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Icon(Icons.edit),
                    )
                  ]
                ),
              ),
            ),
            Divider(),
            Expanded(
                child: Container(
                  width: double.infinity,
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        title: TabBar(
                          isScrollable: true,
                          tabs: [
                            Tab(text: "Informações pessoais",),
                            Tab(text: "Informações acadêmicas"),
                            Tab(text: "Informações profissionais"),
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          FormInfoPessoais(),
                          FormInfoAcademicas(),
                          FormInfoProfissionais(),
                        ],
                      ),
                    ),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
