import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task8/model/request.dart';
import 'package:task8/service/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController nationalidController;
  late TextEditingController complainofficeController;
  late TextEditingController complaintitleController;
  late TextEditingController complaindescController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    nationalidController = TextEditingController();
    complainofficeController = TextEditingController();
    complaintitleController = TextEditingController();
    complaindescController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    nationalidController.dispose();
    complainofficeController.dispose();
    complaintitleController.dispose();
    complaindescController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'National ID',
                    prefixIcon: const Icon(Icons.save),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: nationalidController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your national id";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Complain Office',
                    prefixIcon: const Icon(Icons.mic_rounded),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: complainofficeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your complain office";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Complain Title',
                    prefixIcon: const Icon(Icons.title_sharp),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: complaintitleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your complain title";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Complain Desc',
                    prefixIcon: const Icon(Icons.description_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: complaindescController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your complain description";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var data = UserRequestModel(
                            name: nameController.text,
                            email: emailController.text,
                            nationalid: nationalidController.text,
                            complainoffice: complainofficeController.text,
                            complaintitle: complaintitleController.text,
                            complaindesc: complaindescController.text);
                        await ApiService().createUser(userModel: data.toJson());
                      }
                      log("error");
                    },
                    child: const Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
