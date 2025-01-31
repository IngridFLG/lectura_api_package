
# 📦 Lectura API Package

**Lectura API Package** es un paquete diseñado para interactuar con la API [Fake Store](https://fakestoreapi.com), facilitando la obtención, adición y eliminación de productos en una tienda en línea ficticia. Este paquete es ideal para aprender sobre el consumo de APIs REST y el manejo de datos en Flutter y Dart.

---

## 🚀 Funcionalidades

- **Obtener productos:** Recupera una lista de productos desde la API con todos sus detalles.
- **Agregar productos:** Permite agregar nuevos productos a la base de datos ficticia.
- **Eliminar productos:** Elimina productos de manera simulada a través de la API.
- **Manejo de errores:** Implementación robusta del manejo de errores con el tipo `Either` de la biblioteca `dartz`.

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

Para usar este paquete, importa los archivos necesarios en tu proyecto:

```dart
import 'package:lectura_api_package/fake_store_package.dart';
```

### 2. **Configurar `ApiService`**

Inicializa la clase `ApiService` para interactuar con la API:

```dart
final apiService = ApiService();
```

### 3. **Obtener Productos**

Llama al método `fetchProducts` para obtener la lista de productos desde la API:

```dart
final result = await apiService.fetchProducts();
result.fold(
  (error) => print('Error al obtener productos: $error'),
  (products) {
    for (var product in products) {
      print('Producto: ${product.title}, Precio: \$${product.price}');
    }
  },
);
```

### 4. **Agregar un Producto**

Para agregar un producto, crea una instancia del modelo `Product` y utiliza el método `addProduct`:

```dart
final newProduct = Product(
  id: 0, // La API genera automáticamente un ID.
  title: 'Nuevo Producto',
  price: 99.99,
  category: 'Categoría Prueba',
  description: 'Descripción del producto de prueba',
  image: 'https://via.placeholder.com/150',
);

final result = await apiService.addProduct(newProduct);
result.fold(
  (error) => print('Error al agregar producto: $error'),
  (product) => print('Producto agregado: ${product.title}'),
);
```

### 5. **Eliminar un Producto**

Llama al método `deleteProduct` proporcionando el ID del producto que deseas eliminar:

```dart
final result = await apiService.deleteProduct(1); // Cambia el ID según sea necesario.
result.fold(
  (error) => print('Error al eliminar producto: $error'),
  (product) => print('Producto eliminado: ${product.title}'),
);
```

---

## 🛠️ Detalles Técnicos

### **Clases Principales**

#### `ApiService`

Es la clase principal que gestiona las interacciones con la API Fake Store.

| **Método**          | **Descripción**                                    |
|----------------------|----------------------------------------------------|
| `fetchProducts()`    | Obtiene una lista de productos desde la API.       |
| `addProduct()`       | Agrega un nuevo producto a través de la API.       |
| `deleteProduct(int)` | Elimina un producto de la API mediante su ID.      |

#### `Product`

Modelo de datos que representa un producto.

| **Campo**       | **Tipo**  | **Descripción**                              |
|------------------|-----------|----------------------------------------------|
| `id`            | `int`     | Identificador único del producto.            |
| `title`         | `String`  | Nombre del producto.                         |
| `price`         | `double`  | Precio del producto.                         |
| `category`      | `String`  | Categoría del producto.                      |
| `description`   | `String`  | Descripción detallada del producto.          |
| `image`         | `String`  | URL de la imagen del producto.               |

---

## 📑 Ejemplo Completo

Este es un ejemplo completo que utiliza todas las funcionalidades del paquete:

```dart
import 'package:lectura_api_package/fake_store_package.dart';

void main() async {
  final apiService = ApiService();

  // Obtener productos
  print('--- Lista de Productos ---');
  final productsResult = await apiService.fetchProducts();
  productsResult.fold(
    (error) => print('Error al obtener productos: $error'),
    (products) {
      for (var product in products) {
        print('Producto: ${product.title}, Precio: \$${product.price}');
      }
    },
  );

  // Agregar un producto
  print('--- Agregar Producto ---');
  final newProduct = Product(
    id: 0,
    title: 'Producto de Prueba',
    price: 99.99,
    category: 'Categoría Prueba',
    description: 'Descripción de producto de prueba',
    image: 'https://via.placeholder.com/150',
  );
  final addResult = await apiService.addProduct(newProduct);
  addResult.fold(
    (error) => print('Error al agregar producto: $error'),
    (product) => print('Producto Agregado: ${product.title}, ID: ${product.id}'),
  );

  // Eliminar un producto
  print('--- Eliminar Producto ---');
  final deleteResult = await apiService.deleteProduct(1); // Cambia el ID según sea necesario.
  deleteResult.fold(
    (error) => print('Error al eliminar producto: $error'),
    (product) => print('Producto Eliminado: ${product.title}, ID: ${product.id}'),
  );
}
```

---

## 🌟 Características Adicionales

- **Manejo de errores con `Either`:** Permite controlar tanto respuestas exitosas (`Right`) como errores (`Left`) de forma funcional y predecible.
- **Fácil Extensibilidad:** Puedes agregar más métodos para interactuar con otros endpoints de la API Fake Store.
- **Documentación Clara:** Este paquete incluye ejemplos detallados para facilitar su uso.

---

## 🌍 Recursos Relacionados

- **Fake Store API:** [https://fakestoreapi.com](https://fakestoreapi.com)
- **Repositorio del Paquete:** [GitHub](https://github.com/IngridFLG/lectura_api_package)
