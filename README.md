
# 📦 Lectura API Package

**Lectura API Package** es un paquete diseñado para interactuar con la API [Fake Store](https://fakestoreapi.com), facilitando la gestión de productos, carritos y usuarios en una tienda en línea ficticia. Este paquete es ideal para aprender sobre el consumo de APIs REST y el manejo de datos en Flutter y Dart.

---

## 🚀 Funcionalidades

### **Gestión de productos**:
- **7 Endpoints disponibles:**
  - Obtener todos los productos.
  - Obtener un producto por su ID.
  - Obtener productos con límite.
  - Obtener productos ordenados.
  - Obtener categorías.
  - Obtener productos por categoría.
  - Agregar, actualizar y eliminar productos.

### **Gestión de carritos**:
- **9 Endpoints disponibles:**
  - Obtener todos los carritos.
  - Obtener un carrito por ID.
  - Obtener carritos con límite.
  - Obtener carritos ordenados.
  - Filtrar carritos por rango de fechas.
  - Obtener carritos de un usuario específico.
  - Agregar productos a un carrito.
  - Actualizar un carrito.
  - Eliminar un carrito.

### **Gestión de usuarios**:
- **6 Endpoints disponibles:**
  - Obtener todos los usuarios.
  - Obtener un usuario por ID.
  - Registrar un nuevo usuario.
  - Actualizar un usuario.
  - Eliminar un usuario.
  - Inicio de sesión con autenticación.

### **Manejo de errores**:
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

---

### 2. **Gestión de Productos**

#### Endpoints disponibles en `ProductService`:

| **Método**              | **Descripción**                                      |
|--------------------------|------------------------------------------------------|
| `fetchProducts()`        | Obtiene todos los productos.                        |
| `fetchProductById(int)`  | Obtiene un producto por ID.                         |
| `fetchProductsWithLimit(int)` | Obtiene productos con un límite específico.   |
| `fetchProductsSorted(String)` | Ordena productos (asc o desc).                |
| `fetchCategories()`      | Obtiene todas las categorías.                      |
| `fetchProductsByCategory(String)` | Obtiene productos por categoría.         |
| `addProduct(Product)`    | Agrega un nuevo producto.                          |
| `updateProduct(int, Product)` | Actualiza un producto existente.             |
| `deleteProduct(int)`     | Elimina un producto por ID.                        |

---

### 3. **Gestión de Carritos**

#### Endpoints disponibles en `CartService`:

| **Método**                      | **Descripción**                                      |
|----------------------------------|------------------------------------------------------|
| `fetchAllCarts()`                | Obtiene todos los carritos.                         |
| `fetchCartById(int)`             | Obtiene un carrito por ID.                         |
| `fetchCartsWithLimit(int)`       | Obtiene carritos con un límite específico.         |
| `fetchCartsSorted(String)`       | Ordena carritos (asc o desc).                      |
| `fetchCartsByDateRange(String, String)` | Obtiene carritos por rango de fechas.      |
| `fetchUserCarts(int)`            | Obtiene carritos de un usuario específico.         |
| `addToCart(int, List<CartItem>)` | Agrega productos a un carrito.                    |
| `updateCart(int, List<CartItem>)`| Actualiza productos en un carrito.                |
| `deleteCart(int)`                | Elimina un carrito por ID.                        |

---

### 4. **Gestión de Usuarios**

#### Endpoints disponibles en `UserService`:

| **Método**              | **Descripción**                                      |
|--------------------------|------------------------------------------------------|
| `fetchAllUsers()`        | Obtiene todos los usuarios.                         |
| `fetchUserById(int)`     | Obtiene un usuario por ID.                          |
| `registerUser(User)`     | Registra un nuevo usuario.                          |
| `updateUser(int, User)`  | Actualiza un usuario existente.                     |
| `deleteUser(int)`        | Elimina un usuario por ID.                          |
| `login(String, String)`  | Inicia sesión con credenciales (username y password).|

---

## 🌍 Recursos Relacionados

- **Fake Store API:** [https://fakestoreapi.com](https://fakestoreapi.com)
- **Repositorio del Paquete:** [GitHub](https://github.com/IngridFLG/lectura_api_package)
