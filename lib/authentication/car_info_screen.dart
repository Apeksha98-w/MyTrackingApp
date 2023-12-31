import 'package:bus_driver/MainScreen/main_screen.dart';
import 'package:bus_driver/authentication/login_screen.dart';
import 'package:bus_driver/global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInforScreen extends StatefulWidget {
  const CarInforScreen({super.key});

  @override
  _CarInforScreenState createState() => _CarInforScreenState();
}

class _CarInforScreenState extends State<CarInforScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  List<String> carType = ["uber-x", "uber-go", "Bike"];
  String? selectedCarType;

  saveCarInfo() {
    Map driverCarInfoMap = {
      "car_model": carModelTextEditingController.text.trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_color": carColorTextEditingController.text.trim(),
      "type": selectedCarType,
    };

    DatabaseReference driversRef =
        FirebaseDatabase.instance.ref().child("drivers");
    driversRef
        .child(currentFirebaseUser!.uid)
        .child("car_details")
        .set(driverCarInfoMap);

    Fluttertoast.showToast(msg: "Congratulations, Car info has been saved .");
    Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('images/Screenshot (857).png'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter Car Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: carModelTextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "Car Model",
                  hintText: "Car Model",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextField(
                controller: carNumberTextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "Car Number",
                  hintText: "Car Number",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextField(
                controller: carColorTextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "Car Color",
                  hintText: "Car Color",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton(
                dropdownColor: Colors.white24,
                iconSize: 35,
                hint: const Text(
                  "Select the car type",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                value: selectedCarType,
                onChanged: (newValue) {
                  setState(() {
                    selectedCarType = newValue.toString();
                  });
                },
                items: carType.map((car) {
                  return DropdownMenuItem(
                    child: Text(
                      car,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    value: car,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (carModelTextEditingController.text.isNotEmpty &&
                      carNumberTextEditingController.text.isNotEmpty &&
                      carColorTextEditingController.text.isNotEmpty &&
                      selectedCarType != null) {
                    saveCarInfo();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(206, 255, 114, 82),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
