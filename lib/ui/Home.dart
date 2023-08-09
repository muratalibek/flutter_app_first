
import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({super.key});

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0;
  int _personCounter = 0;
  double _billAmount = 0.0;

  //Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),// Отрегулировал место положение по вертикали малого контейнера
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20.5),
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0)// сгладил углы
              ),
              child: Center(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Per Person", style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple.shade700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(" \$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}", style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade200,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(12.0)//округлил края контейнера
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),// Номерная клавиатура
                    style: const TextStyle(color: Colors.purple,
                    fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount = double.parse(value);
                      }catch(exception){
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split", style: TextStyle(
                        color: Colors.grey.shade700
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState((){
                                if(_personCounter > 1){
                                  _personCounter--;
                                }else{

                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purple.shade100,
                              ),
                              child: Center(
                                child: Text(
                                  "-", style: TextStyle(
                                  color: Colors.purple.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text("$_personCounter", style: TextStyle(
                            color: Colors.purple.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),),
                          InkWell(
                            onTap: (){
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purple.shade100,
                              ),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: Colors.purple.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(" \$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}", style: TextStyle(
                          color: Colors.purple.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Slider---------------------------
                  Column(
                    children: [
                      Text("$_tipPercentage%", style: TextStyle(
                        color: Colors.purple.shade700,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.purple.shade400,
                          inactiveColor: Colors.grey.shade400,
                          divisions: 10,
                          value: _tipPercentage.toDouble(), onChanged: (double newValue){
                        setState(() {
                          _tipPercentage = newValue.round();
                        });
                      })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage){
    var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount)/ splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;

    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null){
      //no go
    }
    else{
      totalTip = (billAmount * tipPercentage)/100;

      return totalTip;
    }
  }
}


class Wisdom extends StatefulWidget {//
  const Wisdom({super.key});

  @override
  State<Wisdom> createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Доброе утро, Мурат!",
    "Добрый день, Мурат!",
    "Добрый вечер, Мурат!",
    "Доброй ночи, Мурат!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
              height: 200,
              margin: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(14.5)
              ),
              child: Center(child: Text(quotes[_index % quotes.length],
              style: TextStyle(
                color: Colors.grey.shade700,
                fontStyle: FontStyle.italic,
                fontSize: 16.5,
              ),))),
          const Divider(thickness: 1.3),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: ElevatedButton.icon(
                onPressed: _showQuote,
                icon: const Icon(Icons.wb_sunny),
                label: const Text("Inspire me!",
                    style: TextStyle(fontSize: 18.8, color: Colors.white))),
          ),
        ],
      ),
    );
  }

  void _showQuote() {
    //increment our index/counter by one
    setState(() {
      _index++;
    });
  }
}
//---------------------------------------StateLESS Widgets-------------------
class BizCard extends StatelessWidget {//
  const BizCard({super.key});

  @override
  Widget build(BuildContext context) {//State<Wisdom> createState() => _WisdomState();
    return Scaffold(
      appBar: AppBar(
        title: const Text("BizCard"),
      ),
      backgroundColor: Colors.redAccent,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  Container _getCard() {
    // Container во Flutter - это многофункциональный виджет,
    // который используется для создания прямоугольных контейнеров с различными
    // свойствами стилизации и компоновки. Он может содержать текст, изображения,
    // другие виджеты или даже служить просто для стилизации фона без содержимого.

    return Container(
      width: 350,
      height: 200,
      margin: const EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.5)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Murat Alibek",
            style: TextStyle(
                fontSize: 20.9,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          Text("buildapps.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline),
              Text("T: @buildapps"),
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: const DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"),
              fit: BoxFit.cover)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({super.key});

  _tapButton() {
    debugPrint("Tapped button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      Scaffold - это основной виджет во Flutter, предназначенный для создания
      структуры основного макета (layout) в мобильных приложениях.
      Он представляет собой скелет или каркас, на котором строится
      пользовательский интерфейс.

      - Scaffold обычно содержит несколько основных элементов, таких как:

         1. AppBar: Верхняя панель приложения, которая содержит заголовок,
         кнопки и другие элементы управления.

         2. Body: Область контента приложения, где размещаются основные
         виджеты и контент.

         3. FloatingActionButton: Плавающая кнопка действия, которая
         обычно находится в нижней правой части экрана и выполняет
         важное действие в приложении.

         4. Drawer: Боковая панель, которую можно выдвигать слева,
         содержащая дополнительные пункты меню или настройки.

         5. BottomNavigationBar: Нижняя навигационная панель, которая
         предоставляет вкладки или ссылки для навигации между различными
         разделами приложения.
      */
      appBar: AppBar(
        title: const Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.email),
            onPressed: () => debugPrint("Email Tapped!"),
          ),
          IconButton(
            icon: const Icon(Icons.access_alarm),
            onPressed: _tapButton,
          )
        ],
      ),

      //-------------------
      //FLOAT ACTION BUTTON

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () => debugPrint("Hello"),
        child: const Icon(Icons.call_missed),
      ),
      //-------------------------------------------
      //FLUTTER BOTTOM NAVIGATOR AND ADDING A TAP
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "First"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Second"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Third")
        ],
        onTap: (int index) => debugPrint("Tapped item: $index"),
      ),

      backgroundColor: Colors.redAccent.shade700,
      body: Container(
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
            // InkWell(
            //   /*
            //   InkWell во Flutter - это виджет, предоставляющий возможность
            //   создания реакции на пользовательские касания (например, нажатие)
            //   на своем содержимом. Он оборачивает свое содержимое (например,
            //   текст, изображение или другие виджеты) и добавляет анимированный
            //   эффект "splash" при касании, который представляет собой анимацию
            //   всплывающей чернили или круговой волны.*/
            //   child: const Text(
            //     "Tap me!",
            //     style: TextStyle(fontSize: 23.4),
            //   ),
            //   onTap: () => debugPrint("tapped..."),
            // )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /*
    GestureDetector во Flutter - это виджет, который позволяет обнаруживать
    различные жесты (gestures) пользователя на экране. Он позволяет определить
    и обработать касания, тапы, свайпы, двойные тапы и другие жесты.
    */
      onTap: () {
        final snackBar = SnackBar(
          content: const Text("Hello Again"),
          backgroundColor: Colors.amberAccent.shade700,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar); // Scaffold не
        // содержит showSnackBar() метод, поэтому поставил ScaffoldMessenger
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: const Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.deepOrange,
      child: Center(
          child: Text(
        "Hello Flutter!",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 23.4,
          fontStyle: FontStyle.italic,
        ),
      )),
    );
  }
}
