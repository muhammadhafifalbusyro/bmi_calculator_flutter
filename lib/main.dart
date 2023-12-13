import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){ runApp(MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //controllers
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  //state
  String height = '';
  String weight = '';
  String bmi_result = '';
  double bmi_index =0.0;

  void changeHeight(value) { setState(() {
    height = value;
  });}
  void changeWeight(value) { setState(() {
    weight = value;
  });}

  void submit(height,weight){
        if(height != '' && weight != ''){
          double heightInt= double.parse(height);
          double weightInt = double.parse(weight);
          double result = weightInt/(heightInt*heightInt);
          setState(() {
            bmi_index = result;
          });
          if(result<18.5){
              setState(() {
                bmi_result = 'UNDERWEIGHT';
              });
          }
          else if(result>=18.5 && result<=24.9){
               setState(() {
                bmi_result = 'NORMAL';
              });
          }
          else if(result>=25 && result<=29.9){
               setState(() {
                bmi_result = 'OVERWEIGHT';
              });
          }
          
          else if(result>=30 && result<=34.9){
               setState(() {
                bmi_result = 'OBESE';
              });
          }
          else if(result>=35){
               setState(() {
                bmi_result = 'EXTREME OBESE';
              });
          }
        }
        else{
            print('error');
			Fluttertoast.showToast(
				msg: "Field must be inputed",
				toastLength: Toast.LENGTH_SHORT,
				gravity: ToastGravity.BOTTOM,
				timeInSecForIosWeb: 1,
				backgroundColor: Colors.red,
				textColor: Colors.white,
				fontSize: 16.0
			);
  
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Height (meter)",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),textAlign: TextAlign.left,),
                ],
              ),
              SizedBox(height: 12,),
              TextField(decoration: InputDecoration(
                hintText: 'Input your height',
                hintStyle: TextStyle(color: Colors.grey[500])  ,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.grey.shade300)),
                filled: true,
                fillColor: Colors.grey.shade200
              ),
              controller: _heightController,
              onChanged: (value) => changeHeight(value),
              keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Text("Weight (kilograms)",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),textAlign: TextAlign.left,),
                ],
              ),
              SizedBox(height: 12,),
              TextField(decoration: InputDecoration(
                hintText: 'Input your weight',
                hintStyle: TextStyle(color: Colors.grey[500])  ,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.grey.shade300)),
                filled: true,
                fillColor: Colors.grey.shade200
              ),
              controller: _weightController,
              onChanged: (value) => changeWeight(value),
              keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12,),
              ElevatedButton(onPressed: (() => submit(height, weight)), child: Text('Submit'),style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50)

              )),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    'Result:',
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Text(
                    'BMI INDEX: ' + bmi_index.toString() ,
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Text(
                    'BMI RESULT: '+ bmi_result,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
