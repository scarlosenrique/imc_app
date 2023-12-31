import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Modelo(),
  ));
}

class Modelo extends StatefulWidget {
  const Modelo({super.key});

  @override
  State<Modelo> createState() => _modeloState();
}

class _modeloState extends State<Modelo> {
  double valor_1 = 0;
  double valor_2 = 0;
  double slider1 = 0;
  double slider2 = 0;
  double resultado = 0;
  String imc = "";
  String imagen = "";

  double calculo() {
    double alturaM = valor_1 / 100;
    resultado = valor_2 / (alturaM * alturaM);
    resultado = double.parse(resultado.toStringAsFixed(2));
    return resultado;
  }

  String estado_fisico() {
    if (resultado < 18.5) {
      imc = "Bajo peso";
    } else if (resultado >= 18.5 && resultado < 24.9) {
      imc = "Peso saludable";
    } else if (resultado >= 25 && resultado < 29.9) {
      imc = "Sobrepeso";
    } else {
      imc = "Obesidad";
    }
    return imc;
  }

  String aspecto() {
    if (resultado < 18.5) {
      imagen = "assets/bajo_peso.jpg";
    } else if (resultado >= 18.5 && resultado < 24.9) {
      imagen = "assets/peso_normal.jpg";
    } else if (resultado >= 25 && resultado < 29.9) {
      imagen = "assets/sobrepeso.jpg";
    } else {
      imagen = 'assets/obesidad.png';
    }
    return imagen;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("IMC calculator"),
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
                  valor_1.toString() + " cm",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Slider(
                    value: slider1,
                    min: 0,
                    max: 220,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    onChanged: (uno) {
                      slider1 = uno;
                      setState(() {
                        valor_1 = double.parse(uno.toStringAsFixed(2));
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
                  valor_2.toString() + " Kg",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Slider(
                    value: slider2,
                    min: 0,
                    max: 140,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    onChanged: (dos) {
                      slider2 = dos;
                      setState(() {
                        valor_2 = double.parse(dos.toStringAsFixed(2));
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
                        calculo();
                        estado_fisico();
                        aspecto();
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
                    color: Colors.blueAccent,
                  ),
                ),
                Text(
                  imc,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Ejercitate y sigue una dieta balanceada",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 30),
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
