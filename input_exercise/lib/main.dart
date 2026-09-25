import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          centerTitle: true,
          title: const Text(
            'Welcome Back!!!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: welcomeForm(),
          ),
        ),
      ),
    ),
  );
}

class welcomeForm extends StatefulWidget {
  const welcomeForm({super.key});

  @override
  State<welcomeForm> createState() => _welcomeFormState();
}

class _welcomeFormState extends State<welcomeForm> {
  String _sex = '';
  bool _hidePassword = true;
  bool _machineLearning = false;
  bool _fullStack = false;
  bool _mobileDev = false;
  double _tuition = 0.0;
  bool _submitted = false;
  int _resetCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const Text(
            'Username',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [Expanded(child: TextField(key: ValueKey('username-$_resetCounter')))],
          ),
          const Text('Username must be 10 char long',
              style: TextStyle(color: Colors.red, fontSize: 10)),
          const SizedBox(height: 16),

          const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [Expanded(child: TextField(
              key: ValueKey('password-$_resetCounter'),
              obscureText: _hidePassword,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(_hidePassword
                    ? Icons.visibility_off
                    : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                )
              ),
            )),],
          ),
          const Text('password must be 8 char long',
              style: TextStyle(color: Colors.red, fontSize: 10)),
          const SizedBox(height: 12),

          const Text(
            'Sex',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Radio<String>(
                value: 'Male',
                groupValue: _sex,
                onChanged: (val) => setState(() => _sex = val!),
              ),
              const Text('Male'),
              Radio<String>(
                value: 'Female',
                groupValue: _sex,
                onChanged: (val) => setState(() => _sex = val!),
              ),
              const Text('Female'),
            ],
          ),

          const Text(
            'Courses',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(children: [
            Checkbox(
              value: _machineLearning,
              onChanged: (val) => setState(() => _machineLearning = val!),
            ),
            const Text('Machine Learning'),
          ]),

          Row(children: [
            Checkbox(
              value: _fullStack,
              onChanged: (val) => setState(() => _fullStack = val!),
            ),
            const Text('Full Stack'),
          ]),

          Row(children: [
            Checkbox(
              value: _mobileDev,
              onChanged: (val) => setState(() => _mobileDev = val!),
            ),
            const Text('Mobile Application'),
          ]),

          const Text(
            'Tuition',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _tuition,
                  min: 0.0,
                  max: 3000.0,
                  activeColor: Colors.green,
                  onChanged: (val) => setState(() => _tuition = val),
                ),
              ),
              Text(_tuition.round().toString()),
            ],
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _submitted = true;
                  });
                },
                child: const Text('Submit'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _submitted = false;
                    _sex = '';
                    _hidePassword = true;
                    _machineLearning = false;
                    _fullStack = false;
                    _mobileDev = false;
                    _tuition = 0.0;
                    _resetCounter++;
                  });
                },
                child: const Text('Clear'),
              )
            ],
          ),
          if (_submitted)
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              color: Colors.black87,
              child: const Text(
                'Submitted successfully 🥳!!!',
                style: TextStyle(color: Colors.white),
              ),
            ),
      ],
    );
  }
}


