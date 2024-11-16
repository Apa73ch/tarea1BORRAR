import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  ThemeData _buildTheme(bool isDark) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard de Ventas',
      theme: _buildTheme(isDarkMode),
      home: DashboardScreen(
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        isDarkMode: isDarkMode,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const DashboardScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;

    if (screenWidth < 600) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 4;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard de Ventas'),
        actions: [
          if (screenWidth < 600)
            IconButton(
                onPressed: () {
                  //Implementar el flujo de búsqueda en móvil
                  print("Búsqueda activada");
                },
                icon: const Icon(Icons.search)),
          if (screenWidth >= 600)
            Container(
              width: 300,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Buscar...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarjetas de resumen
            GridView.count(
              crossAxisCount: crossAxisCount,
              shrinkWrap: true,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.5,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildSummaryCard(
                  context,
                  'Clientes Activos',
                  '1,234',
                  Icons.people,
                  colorScheme.primary,
                ),
                _buildSummaryCard(
                  context,
                  'Pedidos',
                  '56',
                  Icons.shopping_cart,
                  colorScheme.secondary,
                ),
                _buildSummaryCard(
                  context,
                  'Por Cobrar',
                  '\$45,678',
                  Icons.attach_money,
                  colorScheme.tertiary,
                ),
                _buildSummaryCard(
                  context,
                  'Ventas del Mes',
                  '\$123,456',
                  Icons.trending_up,
                  colorScheme.error,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Sección de pedidos recientes
            Text(
              'Pedidos Recientes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildRecentOrdersList(context),

            const SizedBox(height: 24),

            // Sección de estadísticas
            Text(
              'Estadísticas',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildStatisticsCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 32),
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentOrdersList(BuildContext context) {
    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text('#${index + 1}'),
            ),
            title: Text('Pedido #${1000 + index}'),
            subtitle: Text('Cliente ${index + 1}'),
            trailing: Text('\$${(index + 1) * 100}'),
          );
        },
      ),
    );
  }

  Widget _buildStatisticsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildStatisticRow('Ventas Totales', '\$567,890'),
            const Divider(),
            _buildStatisticRow('Promedio Diario', '\$18,930'),
            const Divider(),
            _buildStatisticRow('Tasa de Conversión', '68%'),
            const Divider(),
            _buildStatisticRow('Clientes Nuevos', '45'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
