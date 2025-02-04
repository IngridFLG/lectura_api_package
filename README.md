
# 📦 Lectura API Package

**Lectura API Package** es un paquete diseñado para interactuar con la API [Fake Store](https://fakestoreapi.com), facilitando la gestión de productos, carritos y usuarios en una tienda en línea ficticia. Este paquete es ideal para aprender sobre el consumo de APIs REST y el manejo de datos en Flutter y Dart.

---

## 🚀 Funcionalidades

- **Gestión de productos**:
  - Obtener todos los productos.
  - Obtener un producto por su ID.
  - Obtener productos con límites y ordenados.
  - Agregar, actualizar y eliminar productos.

- **Gestión de carritos**:
  - Obtener todos los carritos.
  - Obtener un carrito por ID.
  - Filtrar carritos por límite o rango de fechas.
  - Agregar, actualizar y eliminar carritos.
  - Obtener carritos de un usuario específico.

- **Gestión de usuarios**:
  - Obtener todos los usuarios.
  - Obtener un usuario por ID.
  - Registrar, actualizar y eliminar usuarios.
  - Inicio de sesión con autenticación.

- **Manejo de errores**:
  - Uso del tipo `Either` de la biblioteca `dartz` para controlar errores y respuestas exitosas.

---

## 📦 Instalación

1. Agrega la siguiente dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  lectura_api_package:
    git:
      url: https://github.com/IngridFLG/lectura_api_package.git
```

2. Ejecuta el comando para instalar las dependencias:

```bash
flutter pub get
```

---

## 📚 Guía de Uso

### 1. **Importar el Paquete**

Importa las clases necesarias desde el paquete:

```dart
import 'package:lectura_api_package/fake_store_package.dart';
```

### 2. **Gestión de Productos**

#### Obtener todos los productos

```dart
final productService = ProductService();

final result = await productService.fetchProducts();
result.fold(
  (error) => print('Error: $error'),
  (products) => products.forEach((product) => print('Producto: ${product.title}')),
);
```

#### Agregar un producto

```dart
final newProduct = Product(
  id: 0, // La API genera automáticamente un ID
  title: 'Producto Nuevo',
  price: 59.99,
  category: 'Categoría Prueba',
  description: 'Descripción del producto nuevo',
  image: 'https://via.placeholder.com/150',
);

final result = await productService.addProduct(newProduct);
result.fold(
  (error) => print('Error: $error'),
  (product) => print('Producto agregado: ${product.title}'),
);
```

#### Actualizar un producto

```dart
final updatedProduct = Product(
  id: 1, // ID del producto existente
  title: 'Producto Actualizado',
  price: 79.99,
  category: 'Categoría Actualizada',
  description: 'Nueva descripción del producto',
  image: 'https://via.placeholder.com/150',
);

final result = await productService.updateProduct(1, updatedProduct);
result.fold(
  (error) => print('Error: $error'),
  (product) => print('Producto actualizado: ${product.title}'),
);
```

#### Eliminar un producto

```dart
final result = await productService.deleteProduct(1);
result.fold(
  (error) => print('Error: $error'),
  (product) => print('Producto eliminado: ${product.title}'),
);
```

### 3. **Gestión de Carritos**

#### Obtener todos los carritos

```dart
final cartService = CartService();

final result = await cartService.fetchAllCarts();
result.fold(
  (error) => print('Error: $error'),
  (carts) => carts.forEach((cart) => print('Carrito ID: ${cart.id}')),
);
```

#### Agregar productos a un carrito

```dart
final cartItems = [
  CartItem(productId: 1, quantity: 2),
  CartItem(productId: 2, quantity: 1),
];

final result = await cartService.addToCart(1, cartItems);
result.fold(
  (error) => print('Error: $error'),
  (cart) => print('Carrito actualizado: ${cart.id}'),
);
```

#### Actualizar un carrito

```dart
final updatedItems = [
  CartItem(productId: 1, quantity: 3),
  CartItem(productId: 3, quantity: 5),
];

final result = await cartService.updateCart(1, updatedItems);
result.fold(
  (error) => print('Error: $error'),
  (cart) => print('Carrito actualizado: ${cart.id}'),
);
```

#### Eliminar un carrito

```dart
final result = await cartService.deleteCart(1);
result.fold(
  (error) => print('Error: $error'),
  (message) => print(message),
);
```

### 4. **Gestión de Usuarios**

#### Registrar un nuevo usuario

```dart
final userService = UserService();

final newUser = User(
  email: 'usuario@ejemplo.com',
  username: 'usuario123',
  password: 'claveSegura',
  phone: '1234567890',
  firstName: 'Juan',
  lastName: 'Pérez',
  city: 'Ciudad Ejemplo',
  street: 'Calle Ejemplo',
  number: 123,
  zipcode: '45678',
);

final result = await userService.registerUser(newUser);
result.fold(
  (error) => print('Error: $error'),
  (user) => print('Usuario registrado: ${user.username}'),
);
```

#### Iniciar sesión

```dart
final result = await userService.login('usuario123', 'claveSegura');
result.fold(
  (error) => print('Error: $error'),
  (token) => print('Token recibido: $token'),
);
```

---

## 🛠️ Clases Principales

### **`ProductService`**

Maneja las operaciones relacionadas con productos.

| **Método**              | **Descripción**                                  |
|--------------------------|--------------------------------------------------|
| `fetchProducts()`        | Obtiene todos los productos.                    |
| `addProduct(Product)`    | Agrega un nuevo producto.                       |
| `updateProduct(int, Product)` | Actualiza un producto existente.          |
| `deleteProduct(int)`     | Elimina un producto por ID.                     |

### **`CartService`**

Maneja las operaciones relacionadas con carritos.

| **Método**              | **Descripción**                                  |
|--------------------------|--------------------------------------------------|
| `fetchAllCarts()`        | Obtiene todos los carritos.                     |
| `addToCart(int, List<CartItem>)` | Agrega productos a un carrito.          |
| `updateCart(int, List<CartItem>)` | Actualiza productos en un carrito.     |
| `deleteCart(int)`        | Elimina un carrito por ID.                      |

### **`UserService`**

Maneja las operaciones relacionadas con usuarios.

| **Método**              | **Descripción**                                  |
|--------------------------|--------------------------------------------------|
| `fetchAllUsers()`        | Obtiene todos los usuarios.                     |
| `registerUser(User)`     | Registra un nuevo usuario.                      |
| `updateUser(int, User)`  | Actualiza un usuario existente.                 |
| `deleteUser(int)`        | Elimina un usuario por ID.                      |
| `login(String, String)`  | Inicia sesión con credenciales.                 |

---

## 🌍 Recursos Relacionados

- **Fake Store API:** [https://fakestoreapi.com](https://fakestoreapi.com)
- **Repositorio del Paquete:** [GitHub](https://github.com/IngridFLG/lectura_api_package)
