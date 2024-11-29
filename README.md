# flutter_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


PONIN ERIC 21889 - API DE CLIENTES - 

### 1. **Detalle del Cliente**

![lib/assets/cliente/documentacion/](DetalleCLiente.JPG)

   **Contenido:**
   - La pantalla muestra información detallada de un cliente específico:
     - Nombre: *Nombre Apellido*.
     - Dirección: *Calle False 123*.
     - Fecha de nacimiento: *01/01/2000*.
     - DNI: *00000000*.
     - Género: *Male*.
     - Estado VIP: *True*.

   **Función:**
   - Esta vista es utilizada para mostrar los datos completos de un cliente seleccionado desde una lista previa. Es útil para consultar información específica y detallada.

---
### 2. **Lista de Clientes**

![lib/assets/cliente/documentacion/](ListaClientes.JPG)

   **Contenido:**
   - La pantalla presenta una lista de clientes con un campo de búsqueda para filtrar por nombre.
   - En este caso como la API no proporciona imagenes se cargaron avatars de forma local y carga de manera aleatoria segun el genero una imagen para los clientes..
   - Cada cliente en la lista muestra: Nombre completo y correo electronico.
   - Muestra un escudo pintado con un tilde si el cliente es VIP.
   -Y un boton para marcarle una estrella.

   **Función:**
   - Es una vista principal para navegar entre los clientes registrados en la aplicación.
   - El campo de búsqueda permite al usuario encontrar un cliente rápidamente escribiendo su nombre.
   -Al hacer click en el cliente se puede ver mas informacion de el.

---
### 3. **Pantalla Principal**

![lib/assets/cliente/documentacion/](Principal.JPG)


   **Contenido:**
   - Es la vista de menú o página principal que ofrece múltiples opciones:
     - *Perfil de Usuario*.
     - *Lista de Clientes*.

   **Función:**
   - Actúa como el hub principal desde donde se puede navegar a otras funcionalidades de la aplicación.

