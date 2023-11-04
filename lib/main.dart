import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Modelo(),
    //debugShowCheckedModeBanner: false,
  ));
}

class Modelo extends StatefulWidget {
  const Modelo({super.key});

  @override
  State<Modelo> createState() => _modeloState();
}

class _modeloState extends State<Modelo> {
  double valor1 = 0;
  double valor2 = 0;
  double sliderFirstValue = 0;
  double sliderSecondValue = 0;
  double resultado = 0;
  String imc = "";
  String imagen = "";

  List<String> condicion = [
    "bajo peso",
    "peso normal",
    "sobrepeso",
    "obesidad",
  ];
  double solucion() {
    double alturaM = valor1 / 100;
    resultado = valor2 / (alturaM * alturaM);
    resultado = double.parse(resultado.toStringAsFixed(2));
    return resultado;
  }

  String rcondicion() {
    if (resultado < 18.5) {
      imc = "bajo peso";
    } else if (resultado >= 18.5 && resultado < 24.9) {
      imc = "peso saludable";
    } else if (resultado >= 25 && resultado < 29.9) {
      imc = "sobrepeso";
    } else {
      imc = "obesidad";
    }
    return imc;
  }

  String rImage() {
    if (resultado < 18.5) {
      imagen = "./assets/bajo_peso.jpg";
    } else if (resultado >= 18.5 && resultado < 24.9) {
      imagen = "../assets/peso_normal.jpg";
    } else if (resultado >= 25 && resultado < 29.9) {
      imagen = "assets/sobrepeso.jpg";
    } else {
      imagen = "assets/obesidad.jpg";
    }
    return imagen;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text("IMC calculator"),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: [
                const Divider(
                  height: 20,
                ),
                const Text(
                  "Altura",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),
                ),
                Text(
                  valor1.toString() + " cm",
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
                Slider(
                    value: sliderFirstValue,
                    min: 0,
                    max: 220,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    onChanged: (uno) {
                      sliderFirstValue = uno;
                      setState(() {
                        valor1 = double.parse(uno.toStringAsFixed(2));
                      });
                    }),
                const Divider(
                  height: 20,
                ),
                const Text(
                  "Peso",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),
                ),
                Text(
                  valor2.toString() + " Kg",
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
                Slider(
                    value: sliderSecondValue,
                    min: 0,
                    max: 140,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    onChanged: (dos) {
                      sliderSecondValue = dos;
                      setState(() {
                        valor2 = double.parse(dos.toStringAsFixed(2));
                      });
                    }),
                const Divider(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        solucion();
                        rcondicion();
                        rImage();
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: const Text(
                        "Obtenga su IMC",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                ),
                const Divider(
                  height: 30,
                ),
                Text(
                  resultado.toString(),
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                Text(
                  imc,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const Text(
                  "Debes de comer mas saludable y menter una dieta sana y balanceada",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 15,
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset(imagen),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
