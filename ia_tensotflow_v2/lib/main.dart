import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
  theme: ThemeData.fallback(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List? _outputs;
  List<XFile>? _imageFileList;
  double _maxHeight = 20;

  bool _loading = false;
  final ImagePicker _picker = ImagePicker();

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cual es tu reacción?'),
      ),
      body: _loading
          ? Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      )
          : Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFileList == null 
            ? Container(
              child: Image.asset(
                'assets/images/select-image.png',
                width: 240,
                height: 200,
                fit: BoxFit.fill
              )
            ) 
            : Image.file(File(_imageFileList![0].path)),
            SizedBox(
              height: _maxHeight,
            ),
            _outputs != null
                ? Text(
              "${_outputs![0]["label"]}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                background: Paint()..color = Colors.white,
              ),
            ): Container(),
            _outputs != null ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      width: 355.0,
                      lineHeight: 15.0,
                      percent: (_outputs![0]["confidence"]),
                      center: Text(
                        "${(_outputs![0]["confidence"] * 100).toStringAsFixed(0)} %",
                        style: const TextStyle(fontSize: 12.0),
                      ),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                      barRadius: const Radius.circular(16)
                    ),
                  )
                ],
              )
            ) : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: const Icon(Icons.image),
      ),
    );
  }

  pickImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _imageFile = image;
    });
    classifyImage(File(_imageFileList![0].path));
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.5,
      imageMean: 127,
      imageStd: 127,
    );

    output!.forEach((element) { 
        setState(() {
          _loading = false;
          _outputs = output;
        });
      });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}