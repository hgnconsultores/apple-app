import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const HGNWebViewApp());
}

class HGNWebViewApp extends StatelessWidget {
  const HGNWebViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HGN Consultores',
      // Mantener esto en false es buena práctica para producción
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // Asegurar que el fondo sea transparente
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _errorMessage = null;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              // Solo mostrar error si afecta el marco principal
              if (error.isForMainFrame ?? true) {
                _errorMessage = 'Error al cargar la página: ${error.description}';
                _isLoading = false;
              }
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      // Cargar la URL
      ..loadRequest(Uri.parse('https://www.hgnconsultores.com/app/index.php'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Se elimina el 'AppBar' completamente.
      // appBar: null, // o simplemente no se incluye
      
      body: Stack(
        children: [
          // 1. Mostrar la WebView (si no hay error)
          if (_errorMessage == null)
            WebViewWidget(controller: _controller),
          
          // 2. Mostrar el mensaje de error (si existe)
          if (_errorMessage != null)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // En modo de pantalla completa, la única forma de reintentar es con un botón
                  ElevatedButton.icon(
                    onPressed: () {
                      // Usar initState o reload para intentar cargar de nuevo
                      _controller.reload(); 
                      setState(() {
                         _errorMessage = null; // Limpiar error para mostrar loader
                         _isLoading = true;
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reintentar'),
                  ),
                ],
              ),
            ),

          // 3. Mostrar el indicador de carga (si está cargando Y no hay un error persistente)
          if (_isLoading && _errorMessage == null)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Cargando...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}