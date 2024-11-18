import 'package:tema1_actividad1/screens/screens.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Mi aplicacion",
    initialRoute: "/",
    routes: AppRoutes.routes,
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (BuildContext builder) => HomePage());
    },
  ));
}
