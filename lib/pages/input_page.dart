import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/modern_button.dart';
import 'result_page.dart';
import 'history_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String gender = 'Man';

  final List<Map<String, dynamic>> _historyList = [];

  @override
  void dispose() {
    _nameController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  String _bmiCategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  void _calculate() {
    if (!_formKey.currentState!.validate()) return;

    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text) / 100;
    final bmi = weight / (height * height);
    final category = _bmiCategory(bmi);

    _historyList.insert(0, {
      'name': _nameController.text,
      'bmi': bmi,
      'category': category,
      'gender': gender,
      'date': DateTime.now(),
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          name: _nameController.text,
          bmi: bmi,
          gender: gender,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Modern BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HistoryPage(historyList: _historyList),
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: const [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 90,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Check Your Body Mass Index',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Monitor your body health with a modern look!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              CustomTextField(
                label: 'Name',
                hint: 'Enter your name',
                icon: Icons.person,
                controller: _nameController,
                keyboardType: TextInputType.name,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                label: 'Weight (kg)',
                hint: 'Example: 70',
                icon: Icons.monitor_weight_outlined,
                controller: _weightController,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                label: 'Height (cm)',
                hint: 'Example: 170',
                icon: Icons.height,
                controller: _heightController,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    RadioListTile<String>(
                      value: 'Man',
                      groupValue: gender,
                      activeColor: Colors.white,
                      title: const Text('Man', style: TextStyle(color: Colors.white)),
                      onChanged: (value) {
                        setState(() => gender = value!);
                      },
                    ),
                    RadioListTile<String>(
                      value: 'Woman',
                      groupValue: gender,
                      activeColor: Colors.white,
                      title: const Text('Woman', style: TextStyle(color: Colors.white)),
                      onChanged: (value) {
                        setState(() => gender = value!);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              ModernButton(
                text: 'Calculate BMI',
                onTap: _calculate,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}