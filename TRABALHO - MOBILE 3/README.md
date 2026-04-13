
# README — TRABALHO 3

## Trabalho 3 — Aplicação de Calculadora em Flutter utilizando Componentização 

## 📌 Descrição
Este projeto consiste no desenvolvimento de uma aplicação de calculadora simples utilizando o framework Flutter. A aplicação possui uma interface gráfica funcional e permite a realização de operações matemáticas básicas.

O principal objetivo do projeto é aplicar os conceitos de componentização de widgets, promovendo organização, reutilização de código e boas práticas no desenvolvimento de interfaces mobile.

---
## 🎯 Objetivo

Desenvolver uma aplicação mobile que:

- Realize operações matemáticas básicas  
- Possua interface gráfica funcional e intuitiva  
- Utilize widgets reutilizáveis  
- Siga boas práticas de organização de código
  
---
## 💻 Funcionalidades
A calculadora implementa as seguintes funcionalidades:

- Inserção de números (0 a 9)  
- Operações matemáticas:  
  - Adição  
  - Subtração  
  - Multiplicação  
  - Divisão  
- Exibição do resultado no display  
- Limpeza da operação por meio do botão "C"  

---
## 🧠 Explicação da Estrutura de Componentes:

O projeto foi dividido em widgets reutilizáveis para melhor organização e manutenção do código.
- Widget Botão Numérico: Responsável por representar os números da calculadora.
- Widget Botão de Operação: Representa as operações matemáticas - adição (+), subtração (-), multiplicação (×), divisão (÷).
- Widget Display: Responsável por exibir - números digitados, operações e resultado final.
- Organização do Layout : A interface foi construída utilizando - Row, Column, Expanded, Containe
---
## 🧩 Componentização

O projeto foi estruturado utilizando widgets reutilizáveis para facilitar a manutenção e organização.

---
### 🔘 Botão (Botao)

Responsável por representar os botões da calculadora.

Características:
- Recebe o valor do botão (número ou operação)  
- Executa uma ação ao ser pressionado  
- Reutilizável em toda a interface  

---

### 📀 Display

Responsável por exibir:

- Valores digitados  
- Operações em andamento  
- Resultado final  

---

### 🧮 Lógica da Calculadora

Arquivo responsável pelo processamento das operações:

- Interpretação das entradas do usuário  
- Montagem da expressão matemática  
- Cálculo do resultado  

---

## 📸 Layout

A interface foi construída utilizando os principais widgets do Flutter:

- Column: organização vertical dos elementos  
- Row: organização horizontal dos botões  
- Expanded: distribuição proporcional do espaço  
- Container: estilização dos componentes  

---

## ▶️ Como Executar o Projeto

### ❗️ Pré-requisitos ❗️

É necessário ter instalado:

- Flutter SDK  
- Dart  
- Android Studio ou Visual Studio Code  
- Emulador Android ou dispositivo físico  
---
## 🎥 Vídeo demonstrativo

👉 [Coloque aqui o link]

---
## ▶️ Como executar

```bash
flutter pub get
flutter run
