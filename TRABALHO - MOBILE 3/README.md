# Calculadora Flutter

## Descrição da Aplicação

Este projeto consiste no desenvolvimento de uma aplicação de calculadora simples utilizando o framework Flutter. A aplicação possui uma interface gráfica funcional e permite a realização de operações matemáticas básicas.

O principal objetivo do projeto é aplicar os conceitos de componentização de widgets, promovendo organização, reutilização de código e boas práticas no desenvolvimento de interfaces mobile.

---

## Objetivo

Desenvolver uma aplicação mobile que:

- Realize operações matemáticas básicas  
- Possua interface gráfica funcional e intuitiva  
- Utilize widgets reutilizáveis  
- Siga boas práticas de organização de código  

---

## Funcionalidades

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

## Componentização

O projeto foi estruturado utilizando widgets reutilizáveis para facilitar a manutenção e organização.

### Botão (Botao)

Responsável por representar os botões da calculadora.

Características:
- Recebe o valor do botão (número ou operação)  
- Executa uma ação ao ser pressionado  
- Reutilizável em toda a interface  

---

### Display

Responsável por exibir:

- Valores digitados  
- Operações em andamento  
- Resultado final  

---

### Lógica da Calculadora

Arquivo responsável pelo processamento das operações:

- Interpretação das entradas do usuário  
- Montagem da expressão matemática  
- Cálculo do resultado  

---

## Layout

A interface foi construída utilizando os principais widgets do Flutter:

- Column: organização vertical dos elementos  
- Row: organização horizontal dos botões  
- Expanded: distribuição proporcional do espaço  
- Container: estilização dos componentes  

---

## Como Executar o Projeto

### Pré-requisitos

É necessário ter instalado:

- Flutter SDK  
- Dart  
- Android Studio ou Visual Studio Code  
- Emulador Android ou dispositivo físico  

---

### Passos para execução

# Clonar o repositório
git clone 

# Acessar a pasta do projeto
cd calculadora-flutter

# Instalar as dependências
flutter pub get

# Executar o projeto
flutter run

### Imagem execução

<img width="520" height="621" alt="image" src="https://github.com/user-attachments/assets/cb9c2e08-791f-4ab4-9e94-ec88835ad730" />
