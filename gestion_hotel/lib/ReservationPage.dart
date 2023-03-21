import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Reservation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReservationPage(),
    );
  }
}

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final _formKey = GlobalKey<FormState>();
  late String? _fullName;
  late String? _phoneNumber;
  late String? _email;
   DateTime? _arrivalDate;
   DateTime? _departureDate;
   String? _roomType;
   int? _numberOfPeople;

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
    // TODO: save the reservation data to a database or send it to an API
    print('Full Name: $_fullName');
    print('Phone Number: $_phoneNumber');
    print('Email: $_email');
    print('Arrival Date: $_arrivalDate');
    print('Departure Date: $_departureDate');
    print('Room Type: $_roomType');
    print('Number of People: $_numberOfPeople');
    if (_roomType == 'unique' && _numberOfPeople! > 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The unique room can only accommodate 1 person'),
        ),
      );
    } else {
      // TODO: save the reservation data to a database or send it to an API
    }
    }
  }

  @override
  Widget build (BuildContext context) {
    return 
  Container( 
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/.chambresimple.jpg'),
      fit: BoxFit.cover,
    ),
  ),
  child: Scaffold(
    appBar: AppBar(
      title: Text('Hotel Reservation'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
            children: [// Add room type dropdown button field
    
TextFormField(
  decoration: InputDecoration(
    labelText: 'Number of people',
  ),
  validator: (value) {
    if (value == null || int.tryParse(value) == null || int.parse(value) < 1) {
      return 'Please enter a valid number of people';
    }
    if (_roomType == 'Single' && int.parse(value) > 1) {
      return 'The unique room can only accommodate 1 person';
    }
    return null;
  },
  onSaved: (value) => _numberOfPeople = int.parse(value!),
),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Room Type',
                ),
                value: _roomType,
                onChanged: (String? newValue) {
                  setState(() {
                    _roomType = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a room type';
                  }
                  return null;
                },
                items: <String>[
                  'Single',
                  'Double',
                  'Twin',
                  'Royal',
                  'Suite',
                ]
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value), 
                   );
                }).toList(),
              ),

              // ...
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) => _fullName = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) => _phoneNumber = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b').hasMatch(value!)) {
                    return 'Please enter your email';
                  }
                 
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              ListTile(
                title: Text('Date D\'arrivee'),
                subtitle: Text(_arrivalDate?.toString() ?? 'Select date'),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  setState(() {
                    _arrivalDate = selectedDate;
                  });
                },
              ),
              ListTile(
                title: Text('Date de Depart'),
                subtitle: Text(_departureDate?.toString() ?? 'Select date'),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  setState(() {
                    _departureDate = selectedDate;
                  });
                },
              ),
              ElevatedButton(
                child: Text('Reserver'),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}

