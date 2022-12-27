import 'package:flutter/material.dart';
import 'package:flutter_application_1/can_bo.dart';
import 'package:flutter_application_1/cong_nhan.dart';
import 'package:flutter_application_1/ky_su.dart';
import 'package:flutter_application_1/nhan_vien.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class QuanLiCanBo extends GetxController {
  RxList<CanBo> can_bo = RxList([]);
  RxList<CongNhan> cong_nhan = RxList([]);
  RxList<KySu> ky_su = RxList([]);
  RxList<NhanVien> nhan_vien = RxList([]);

  void addCanBo(String address, int id, String genre, String name) {
    can_bo.add(CanBo(address, id, genre, name));
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    search = x.can_bo.value;
    super.initState();
  }

  var x = Get.put(QuanLiCanBo());
  final _formKey = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myControllerSearch = TextEditingController();
  List<CanBo> search = [];
  // final  RxInt index = RxInt(0);
  // late String x = '';
  // void displatText() {
  //   x = myController.text;
  // }
  void _runFilter(String enteredKeyword) {
    List<CanBo> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = x.can_bo.value;
    } else {
      results = x.can_bo.value
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      search = results;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();

    myController4.dispose();
    myControllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quan Ly Can Bo"),
          backgroundColor: Colors.green,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                  obscureText: false,
                  controller: myController1,
                  onChanged: ((value) {}),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  validator: ((value) {
                    value = value?.toLowerCase();
                    if (value is int) {
                      return 'Please input again';
                    }
                    return null;
                  }),
                  decoration: const InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: false,
                  controller: myController2,
                  onChanged: ((value) {}),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  validator: ((value) {
                    value = value?.toLowerCase();
                    if (value != 'nam' && value != 'nu' && value != '') {
                      return 'Please input again';
                    }
                    return null;
                  }),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Genre',
                  ),
                  obscureText: false,
                  controller: myController3,
                  onChanged: ((value) {}),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  obscureText: false,
                  controller: myController4,
                  onChanged: ((value) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Can bo da them thanh cong')),
                      );
                    }
                    x.addCanBo(
                        myController1.text,
                        int.parse(myController2.text),
                        myController3.text,
                        myController4.text);
                    myController1.clear();
                    myController2.clear();
                    myController3.clear();
                    myController4.clear();
                  },
                  child: const Text('Add can bo'),
                ),
              ),
              TextField(
                controller: myControllerSearch,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
                obscureText: false,
                onChanged: ((value) {
                  _runFilter(value);
                }),
              ),
              Expanded(
                child: search.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: ((context, index) => Row(
                                  children: [
                                    Text('Name: ' + search[index].name.toString()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("age: " +search[index].age.toString()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('address: ' + search[index].address.toString()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Genre: " + search[index].genre.toString()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                )
                            // Text(search[index].age.toString()),
                            ),
                        itemCount: search.length,
                      )
                    : SizedBox(),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Danh sach can bo",
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
    
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Table(
                    children: List.generate(x.can_bo.length, (index) {


                      return TableRow(
                        children: [
                          Text('Name: ' + x.can_bo.value[index].name),
                          Text("age: " + x.can_bo.value[index].age.toString()),
                          Text ('address: ' + x.can_bo.value[index].address),
                          Text("Genre: "+x.can_bo.value[index].genre),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
