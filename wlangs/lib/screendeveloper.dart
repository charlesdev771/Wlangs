import 'package:flutter/material.dart';

class screendeveloper extends StatelessWidget {
  const screendeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Adicionando um Scaffold para estrutura
      backgroundColor: Color.fromARGB(255, 150, 120, 255), // Cor de fundo da tela
      body: SingleChildScrollView( // Permite rolagem do conteúdo
        child: Center( // Centraliza o conteúdo na tela
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Começa do topo
              crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
              children: [
                Text(
                  "Olá, mundo! Meu nome é Charles. "
                  "Tenho 23 anos e sou programador full stack, "
                  "além de ethical hacker. Sou apaixonado e estudo "
                  "tecnologia desde muito jovem. Também tenho "
                  "grande interesse em idiomas — além do português, "
                  "sou fluente em inglês, espanhol e italiano, e "
                  "já estudei outros, como latim, russo e francês. "
                  "Atualmente, estou me preparando para a faculdade, "
                  "onde cursarei Engenharia de Software. Convido "
                  "todos a visitar meu portfólio no GitHub!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16, // Tamanho da fonte
                    fontWeight: FontWeight.bold, // Negrito
                    color: const Color.fromARGB(255, 255, 221, 221), // Cor do texto
                  ),
                ),
                SizedBox(height: 20), // Espaço entre o texto e a imagem
                Container(
                  width: 200, // Largura da imagem
                  height: 200, // Altura da imagem
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Bordas arredondadas
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Arredonda as bordas da imagem
                    child: Image.asset(
                      'assets/i.jpeg', // Caminho da sua imagem
                      fit: BoxFit.cover, // Ajusta a imagem ao container
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
