import 'package:flutter/material.dart';

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
