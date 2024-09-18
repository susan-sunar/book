

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Profile extends StatefulWidget {
  final String username;
  final String email;
  final String contact;

  Profile({
    super.key,
    required this.username,
    required this.email,
    required this.contact,
  });

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  File? _image;
  final _formKey = GlobalKey<FormState>();

  // Profile information
  String _address = '';


  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile '),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 16),
              Center(
                child: CircleAvatar(
                  radius: 64,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : null,
                  child: _image == null
                      ? Icon(Icons.person, size: 128)
                      : null,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _captureImage,
                    child: Text('Capture Image'),
                  ),
                  ElevatedButton(
                    onPressed: _selectImage,
                    child: Text('Select Image'),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text('Username: ${widget.username}'),
              Text('Email: ${widget.email}'),
              Text('Contact: ${widget.contact}'),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _address = value ?? '',
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  // Save the profile information to your database or API
                  print('Address: $_address');
                  print('Profile information saved:');
                },
                child: Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
