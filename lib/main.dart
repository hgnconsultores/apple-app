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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Mantener la paleta por defecto o puedes definir una más simple
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
  // Variables para controlar la navegación
  bool _canGoBack = false;
  bool _canGoForward = false;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // No hacer setState en cada progreso, solo cuando llega al 100%
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
              // No actualizamos canGoBack/Forward aquí, esperamos a onPageFinished
            });
          },
          onPageFinished: (String url) async {
            // Al finalizar la carga, actualizamos el estado de carga y navegación
            setState(() {
              _isLoading = false;
            });
            _updateNavigationState();
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              // Filtrar errores comunes o de recursos menores que no son críticos
              if (error.isForMainFrame ?? true) {
                _errorMessage = 'Error al cargar la página: ${error.description}';
                _isLoading = false;
              }
            });
            _updateNavigationState();
          },
          onNavigationRequest: (NavigationRequest request) {
            // Permitir toda la navegación por defecto
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.hgnconsultores.com/app/index.php'));
  }

  // Función para obtener el estado actual de la navegación
  void _updateNavigationState() async {
    final canGoBack = await _controller.canGoBack();
    final canGoForward = await _controller.canGoForward();

    if (_canGoBack != canGoBack || _canGoForward != canGoForward) {
      setState(() {
        _canGoBack = canGoBack;
        _canGoForward = canGoForward;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Fondo de la cabecera blanco
        backgroundColor: Colors.white,
        // Eliminamos el título por defecto
        title: const Text(''),
        // Sombra suave o sin elevación para un aspecto limpio de navegador
        elevation: 1.0, 
        actions: [
          // Botón para Retroceder
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _canGoBack
                ? () {
                    _controller.goBack();
                    // No es estrictamente necesario, pero ayuda a la inmediatez visual
                    _updateNavigationState(); 
                  }
                : null, // Deshabilitado si no puede retroceder
            tooltip: 'Volver',
          ),
          // Botón para Ir Adelante
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: _canGoForward
                ? () {
                    _controller.goForward();
                    // No es estrictamente necesario, pero ayuda a la inmediatez visual
                    _updateNavigationState();
                  }
                : null, // Deshabilitado si no puede ir adelante
            tooltip: 'Adelante',
          ),
          // Botón para Recargar
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller.reload();
            },
            tooltip: 'Recargar',
          ),
        ],
      ),
      body: Stack(
        children: [
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
                  ElevatedButton.icon(
                    onPressed: () {
                      _controller.reload();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reintentar'),
                  ),
                ],
              ),
            )
          else
            WebViewWidget(controller: _controller),
          if (_isLoading)
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