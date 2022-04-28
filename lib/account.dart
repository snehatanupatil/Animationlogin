import 'package:animationlogin/verif.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:lottie/lottie.dart';
import 'form.dart';
import 'setting.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  bool showPassword = false;
  File? imageFile;
  PlatformFile? file;
  DateTime selectedDate = DateTime.now();
  late final List<DownloadController> _downloadControllers;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController locController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = "Hello";
    passwordController.text = "******";
    mailController.text = "kkkk@hjnjnk.com";
    locController.text = "Banglore";
    _downloadControllers = List<DownloadController>.generate(
      list.length,
      (index) => SimulatedDownloadController(onOpenDownload: () {
        _openDownload(list[index]);
      }),
    );
  }

  List list = ["assets/images/sample.pdf"];

  void _openDownload(var index) {
    OpenFile.open(index);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: width < 500
            ? Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 50, 30),
                    child: Container(
                        alignment: Alignment.center,
                        child: Stack(children: [
                          imageFile == null
                              ? const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 70.0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 67.0,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 70.0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Hero(
                                      tag: '',
                                      child: Image.file(
                                        imageFile!,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    radius: 67.0,
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 90, 0, 0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                onPressed: () {
                                  _getFromGallery();
                                },
                                icon: Icon(Icons.camera_alt_outlined),
                                color: Colors.black,
                              ),
                            ),
                          )
                        ])),
                  ),
                  Container(
                    child: const Text(
                      'Hello',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildNameTextField(),
                  buildMailTextField(),
                  buildTextField(),
                  buildLocTextField(),
                  mobile(),
                  form(),
                  picfile(),
                  _buildListItem(context, 0),
                ]),
              )
            : Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 50, 50, 30),
                    child: Container(
                        alignment: Alignment.center,
                        child: Stack(children: [
                          imageFile == null
                              ? const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 70.0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 67.0,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 70.0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Hero(
                                      tag: '',
                                      child: Image.file(
                                        imageFile!,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    radius: 67.0,
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 90, 0, 0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                onPressed: () {
                                  _getFromGallery();
                                },
                                icon: Icon(Icons.camera_alt_outlined),
                                color: Colors.black,
                              ),
                            ),
                          )
                        ])),
                  ),
                  Container(
                    child: const Text(
                      'Hello',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  buildNameTextField(),
                  buildMailTextField(),
                  buildTextField(),
                  buildLocTextField(),
                  mobile(),
                  form(),
                  picfile(),
                  _buildListItem(context, 0),
                ]),
              ),
      ),
    );
  }

  Widget buildNameTextField() {
    double width = MediaQuery.of(context).size.width;
    return width < 500
        ? Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: nameController == null
                ? const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: '',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        )),
                  )
                : TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: '',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                  ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
            child: nameController == null
                ? const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: '',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        )),
                  )
                : TextField(
                    controller: nameController,style: TextStyle(fontSize:20 ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: '',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                  ),
          );
  }

  Widget buildMailTextField() {
    double width = MediaQuery.of(context).size.width;
    return width < 500
        ? Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              controller: mailController,
              readOnly: true,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: '',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'E-mail',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
            ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
            child: TextField(
              controller: mailController,style: TextStyle(fontSize:20 ),
              readOnly: true,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: '',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'E-mail',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
            ),
          );
  }

  Widget buildTextField() {
    double width = MediaQuery.of(context).size.width;
    return width < 500
        ? Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              controller: passwordController,
              readOnly: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: '',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
            ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
            child: TextField(
              controller: passwordController,style: TextStyle(fontSize:20 ),
              readOnly: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: '',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
            ),
          );
  }

  Widget buildLocTextField() {
    double width = MediaQuery.of(context).size.width;
    return width < 500
        ? Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: locController == null
                ? const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        contentPadding: EdgeInsets.only(bottom: 3),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Location',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                  )
                : TextField(
                    controller: locController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: '',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Location',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                  ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
            child: locController == null
                ? const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        contentPadding: EdgeInsets.only(bottom: 3),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Location',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                  )
                : TextField(
                    controller: locController,style: TextStyle(fontSize:20 ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: '',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Location',
                        hintStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                  ),
          );
  }

  Widget picfile() {
    double width = MediaQuery.of(context).size.width;
    return width < 500
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shadowColor: Colors.black,
                  child: Stack(children: [
                    ListTile(
                      title: Text('Upload resume'),
                      subtitle: file == null ? Text('') : Text(file!.name),
                      trailing: IconButton(
                        onPressed: () {
                          pickfile();
                        },
                        icon: Icon(Icons.link),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
                      child: file == null
                          ? Container()
                          : FlatButton(
                              onPressed: () {
                                OpenFile.open(file!.path);
                              },
                              child: Text('viewfile'),
                              color: Colors.black12),
                    ),
                  ]),
                ),
              ],
            ),
            //)
          )
        : Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shadowColor: Colors.black,
                  child: Stack(children: [
                    ListTile(
                      title: Text('Upload resume',style: TextStyle(fontSize: 20),),
                      subtitle: file == null ? Text('') : Text(file!.name),
                      trailing: IconButton(
                        onPressed: () {
                          pickfile();
                        },
                        icon: Icon(Icons.link,size: 40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
                      child: file == null
                          ? Container()
                          : FlatButton(
                              onPressed: () {
                                OpenFile.open(file!.path);
                              },
                              child: Text('viewfile'),
                              color: Colors.black12),
                    ),
                  ]),
                ),
              ],
            ),
            //)
          );
  }

  Widget piccalen() {
    double width = MediaQuery.of(context).size.width;
    return width < 500
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shadowColor: Colors.black,
                  child: Stack(children: [
                    ListTile(
                      title: Text('Pick Birthdate'),
                      subtitle: selectedDate == null
                          ? Text('')
                          : Text(
                              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                      trailing: IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: Icon(
                          Icons.calendar_today_sharp,
                          size: 19,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            //)
          )
        : Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shadowColor: Colors.black,
                  child: Stack(children: [
                    ListTile(
                      title: Text('Pick Birthdate'),
                      subtitle: selectedDate == null
                          ? Text('')
                          : Text(
                              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                      trailing: IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: Icon(
                          Icons.calendar_today_sharp,
                          size: 19,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            //)
          );
  }

  Widget mobile() {
    double width = MediaQuery.of(context).size.width;
    return width < 500
        ? Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mobile_friendly),
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: '',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Mobile number',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  suffixIcon: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => verif()),
                      );
                    },
                    child: const Text(
                      "verify",
                      style: TextStyle(color: Colors.black45),
                    ),
                  )),
            ),
          )
        : Padding(
            padding: EdgeInsets.fromLTRB(10, 13, 10, 13),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mobile_friendly),
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: '',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Mobile number',
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  suffixIcon: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => verif()),
                      );
                    },
                    child: const Text(
                      "verify",
                      style: TextStyle(color: Colors.black45,fontSize: 16),
                    ),
                  )),
            ),
          );
  }

  Widget form() {
    double width = MediaQuery.of(context).size.width;
    return width < 500
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shadowColor: Colors.black,
                  child: Stack(children: [
                    InkWell(
                      child: const ListTile(
                        title: Text('Form'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Formm()),
                        );
                      },
                    ),
                  ]),
                ),
              ],
            ),
            //)
          )
        : Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shadowColor: Colors.black,
                  child: Stack(children: [
                    InkWell(
                      child: const ListTile(
                        title: Text('Form',style: TextStyle(fontSize: 20),),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Formm()),
                        );
                      },
                    ),
                  ]),
                ),
              ],
            ),
            //)
          );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  pickfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        file = result.files.first;
      });
    }
  }

  Widget _buildListItem(BuildContext context, int index) {
    double width = MediaQuery.of(context).size.width;
    final downloadController = _downloadControllers[index];
    return width<500?Card(
      child: ListTile(
        title: const Text("About Company"),
        trailing: Container(
          width: 46,
          child: AnimatedBuilder(
            animation: downloadController,
            builder: (context, child) {
              return DownloadButton(
                status: downloadController.downloadStatus,
                downloadProgress: downloadController.progress,
                onDownload: downloadController.startDownload,
                onCancel: downloadController.stopDownload,
                onOpen: downloadController.openDownload,
              );
            },
          ),
        ),
      ),
    ):Card(
      child: ListTile(
        title: const Text("About Company",style: TextStyle(fontSize: 20),),
        trailing: Container(
          width: 46,
          child: AnimatedBuilder(
            animation: downloadController,
            builder: (context, child) {
              return DownloadButton(
                status: downloadController.downloadStatus,
                downloadProgress: downloadController.progress,
                onDownload: downloadController.startDownload,
                onCancel: downloadController.stopDownload,
                onOpen: downloadController.openDownload,
              );
            },
          ),
        ),
      ),
    );
  }
}

enum DownloadStatus {
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded,
}

abstract class DownloadController implements ChangeNotifier {
  DownloadStatus get downloadStatus;
  double get progress;

  void startDownload();
  void stopDownload();
  void openDownload();
}

class SimulatedDownloadController extends DownloadController
    with ChangeNotifier {
  SimulatedDownloadController({
    DownloadStatus downloadStatus = DownloadStatus.notDownloaded,
    double progress = 0.0,
    required VoidCallback onOpenDownload,
  })  : _downloadStatus = downloadStatus,
        _progress = progress,
        _onOpenDownload = onOpenDownload;

  DownloadStatus _downloadStatus;
  @override
  DownloadStatus get downloadStatus => _downloadStatus;

  double _progress;
  @override
  double get progress => _progress;

  final VoidCallback _onOpenDownload;

  bool _isDownloading = false;

  @override
  void startDownload() {
    if (downloadStatus == DownloadStatus.notDownloaded) {
      _doSimulatedDownload();
    }
  }

  @override
  void stopDownload() {
    if (_isDownloading) {
      _isDownloading = false;
      _downloadStatus = DownloadStatus.notDownloaded;
      _progress = 0.0;
      notifyListeners();
    }
  }

  @override
  void openDownload() {
    if (downloadStatus == DownloadStatus.downloaded) {
      _onOpenDownload();
    }
  }

  Future<void> _doSimulatedDownload() async {
    _isDownloading = true;
    _downloadStatus = DownloadStatus.fetchingDownload;
    notifyListeners();
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!_isDownloading) {
      return;
    }
    _downloadStatus = DownloadStatus.downloading;
    notifyListeners();
    const downloadProgressStops = [0.0, 0.15, 0.45, 0.8, 1.0];
    for (final stop in downloadProgressStops) {
      await Future<void>.delayed(const Duration(seconds: 1));
      if (!_isDownloading) {
        return;
      }
      _progress = stop;
      notifyListeners();
    }
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!_isDownloading) {
      return;
    }
    _downloadStatus = DownloadStatus.downloaded;
    _isDownloading = false;
    notifyListeners();
  }
}

@immutable
class DownloadButton extends StatelessWidget {
  const DownloadButton({
    Key? key,
    required this.status,
    this.downloadProgress = 0.0,
    required this.onDownload,
    required this.onCancel,
    required this.onOpen,
    this.transitionDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  final DownloadStatus status;
  final double downloadProgress;
  final VoidCallback onDownload;
  final VoidCallback onCancel;
  final VoidCallback onOpen;
  final Duration transitionDuration;

  bool get _isDownloading => status == DownloadStatus.downloading;

  bool get _isFetching => status == DownloadStatus.fetchingDownload;

  bool get _isDownloaded => status == DownloadStatus.downloaded;

  void _onPressed() {
    switch (status) {
      case DownloadStatus.notDownloaded:
        onDownload();
        break;
      case DownloadStatus.fetchingDownload:
        break;
      case DownloadStatus.downloading:
        onCancel();
        break;
      case DownloadStatus.downloaded:
        onOpen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width<500?GestureDetector(
      onTap: _onPressed,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: transitionDuration,
            curve: Curves.ease,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: AnimatedOpacity(
                duration: transitionDuration,
                opacity: _isDownloading || _isFetching ? 0.0 : 1.0,
                curve: Curves.ease,
                child: _isDownloaded
                    ? SizedBox(
                        height: 30,
                        child: Lottie.asset("assets/images/smalldone.json",
                            repeat: false))
                    : SizedBox(
                        height: 80,
                        child: Lottie.asset("assets/images/download.json")),
              ),
            ),
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              duration: transitionDuration,
              opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
              curve: Curves.ease,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: downloadProgress),
                      duration: const Duration(milliseconds: 200),
                      builder: (context, progress, child) {
                        return CircularProgressIndicator(
                          backgroundColor: _isDownloading
                              ? CupertinoColors.lightBackgroundGray
                              : Colors.white.withOpacity(0),
                          valueColor: AlwaysStoppedAnimation(_isFetching
                              ? CupertinoColors.lightBackgroundGray
                              : CupertinoColors.activeBlue),
                          strokeWidth: 2,
                          value: _isFetching ? null : progress,
                        );
                      },
                    ),
                  ),
                  if (_isDownloading)
                    const Icon(
                      Icons.stop,
                      size: 14,
                      color: CupertinoColors.activeBlue,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    ):GestureDetector(
      onTap: _onPressed,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: transitionDuration,
            curve: Curves.ease,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: AnimatedOpacity(
                duration: transitionDuration,
                opacity: _isDownloading || _isFetching ? 0.0 : 1.0,
                curve: Curves.ease,
                child: _isDownloaded
                    ? SizedBox(
                    height: 30,
                    child: Lottie.asset("assets/images/smalldone.json",
                        repeat: false))
                    : SizedBox(
                    height: 80,
                    child: Lottie.asset("assets/images/download.json")),
              ),
            ),
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              duration: transitionDuration,
              opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
              curve: Curves.ease,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: downloadProgress),
                      duration: const Duration(milliseconds: 200),
                      builder: (context, progress, child) {
                        return CircularProgressIndicator(
                          backgroundColor: _isDownloading
                              ? CupertinoColors.lightBackgroundGray
                              : Colors.white.withOpacity(0),
                          valueColor: AlwaysStoppedAnimation(_isFetching
                              ? CupertinoColors.lightBackgroundGray
                              : CupertinoColors.activeBlue),
                          strokeWidth: 2,
                          value: _isFetching ? null : progress,
                        );
                      },
                    ),
                  ),
                  if (_isDownloading)
                    const Icon(
                      Icons.stop,
                      size: 14,
                      color: CupertinoColors.activeBlue,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
