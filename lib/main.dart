import 'package:flutter/material.dart';

// Modelo para um alimento
class FoodItem {
  final String food;
  final String quantity;
  final bool isOffer; // true se for uma oferta, false se for uma solicitação
  final String location;
  String status;

  FoodItem({
    required this.food,
    required this.quantity,
    required this.isOffer,
    required this.location,
    this.status = 'Pendente', // o status começa como 'Pendente'
  });
}

// Serviço global para gerenciar os alimentos
class FoodService {
  static final List<FoodItem> _foodItems = [];

  static List<FoodItem> get foodItems => _foodItems;

  static void addFoodItem(FoodItem foodItem) {
    _foodItems.add(foodItem);
  }

  static void updateFoodItemStatus(int index, String newStatus) {
    _foodItems[index].status = newStatus;
  }

  static List<FoodItem> getOffers() {
    return _foodItems.where((foodItem) => foodItem.isOffer).toList();
  }

  static List<FoodItem> getRequests() {
    return _foodItems.where((foodItem) => !foodItem.isOffer).toList();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoaFácil',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black87),
          headline6: TextStyle(color: Colors.green[700]),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, preencha todos os campos")),
      );
      return;
    }

    // Simulação de login bem-sucedido
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bem-vindo ao DoaFácil",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Nome de Usuário",
                prefixIcon: Icon(Icons.person, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                prefixIcon: Icon(Icons.lock, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                primary: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: _goToRegister,
              child: Text("Criar uma conta"),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, preencha todos os campos")),
      );
      return;
    }

    // Simulação de cadastro bem-sucedido
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Cadastro realizado com sucesso!")),
    );

    // Redireciona para a tela de login
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Cadastre-se no DoaFácil",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Nome de Usuário",
                prefixIcon: Icon(Icons.person, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "E-mail",
                prefixIcon: Icon(Icons.email, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                prefixIcon: Icon(Icons.lock, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _register,
              child: Text('Cadastrar', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('DoaFácil', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_grocery_store,
              size: 100,
              color: Colors.green[700],
            ),
            SizedBox(height: 20),
            Text(
              'Bem-vindo ao Banco de Alimentos',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green[700]),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonateFoodScreen()),
                );
              },
              child: Text('Doar Alimentos', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RequestFoodScreen()),
                );
              },
              child: Text('Solicitar Alimentos', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodListScreen()),
                );
              },
              child: Text('Ver Alimentos', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonateFoodScreen extends StatelessWidget {
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  void _donateFood(BuildContext context) {
    String food = _foodController.text;
    String quantity = _quantityController.text;
    String location = _locationController.text;

    if (food.isEmpty || quantity.isEmpty || location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, preencha todos os campos")),
      );
      return;
    }

    FoodService.addFoodItem(FoodItem(
      food: food,
      quantity: quantity,
      isOffer: true,
      location: location,
    ));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Doação registrada com sucesso!")),
    );

    Navigator.pop(context); // Volta para a tela inicial
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doação de Alimentos"),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _foodController,
              decoration: InputDecoration(
                labelText: "Nome do Alimento",
                prefixIcon: Icon(Icons.food_bank, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: "Quantidade",
                prefixIcon: Icon(Icons.shopping_cart, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: "Localização",
                prefixIcon: Icon(Icons.location_on, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _donateFood(context),
              child: Text('Doar', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestFoodScreen extends StatelessWidget {
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  void _requestFood(BuildContext context) {
    String food = _foodController.text;
    String quantity = _quantityController.text;
    String location = _locationController.text;

    if (food.isEmpty || quantity.isEmpty || location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, preencha todos os campos")),
      );
      return;
    }

    FoodService.addFoodItem(FoodItem(
      food: food,
      quantity: quantity,
      isOffer: false,
      location: location,
    ));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Solicitação registrada com sucesso!")),
    );

    Navigator.pop(context); // Volta para a tela inicial
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitação de Alimentos"),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _foodController,
              decoration: InputDecoration(
                labelText: "Nome do Alimento",
                prefixIcon: Icon(Icons.food_bank, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: "Quantidade",
                prefixIcon: Icon(Icons.shopping_cart, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: "Localização",
                prefixIcon: Icon(Icons.location_on, color: Colors.green[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _requestFood(context),
              child: Text('Solicitar', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Alimentos"),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        itemCount: FoodService.foodItems.length,
        itemBuilder: (context, index) {
          final foodItem = FoodService.foodItems[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(foodItem.food),
              subtitle: Text("${foodItem.quantity} - ${foodItem.location}"),
              trailing: Text(foodItem.status),
            ),
          );
        },
      ),
    );
  }
}

