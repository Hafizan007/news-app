# News App

This App using [GetX](https://pub.dev/packages/get) package for State management, routing and Dependency Injection (bindings). We are using [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) (Model View ViewModel) architectural pattern here. For network call we are using [Dio](https://pub.dev/packages/dio) package. We followed the recommended folder structure of GetX and used [Get CLI](https://pub.dev/packages/get_cli) command line tool for creating the folder structure.



## Installation
- Add [Flutter](https://flutter.dev/docs/get-started/install 'Flutter') to your machine
- Open this project folder with Terminal/CMD
- Ensure there's no cache/build leftover by running `flutter clean` in the Terminal
- Run in the Terminal `flutter packages get`


# run this project by command line
- Run in the Terminal `cp .env.example .env`

Dev: `flutter run lib/main_dev.dart`

Prod: `flutter run lib/main_prod.dart`


# run this project in vscode
- select  run and debug tab
- choose flavor want you run dev / prod



# How was this project developed?
- Run [get cli](https://pub.dev/packages/get_cli) command to create project in the required directory: `get create project`
- Create `main_view` by running this command: `get create page:main` and so on...