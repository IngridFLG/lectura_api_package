# 📌 Documentación del Proyecto

## 🛠 Diseño de los Modelos de Datos

El modelo de datos está representado por la clase `Product`, la cual encapsula la información de un producto, incluyendo atributos como `id`, `title`, `price`, `category`, `description` e `image`. Esta clase también proporciona un método de fábrica `fromJson` para facilitar la conversión de datos desde formato JSON a una instancia de `Product`.

## 🔗 Solicitud y Procesamiento de la API

Para interactuar con la API, se ha implementado la clase `ApiClient`, que proporciona métodos para realizar peticiones HTTP (`get`, `post` y `delete`). Estos métodos encapsulan las solicitudes a la API externa `https://fakestoreapi.com`.

La clase `ApiService` utiliza `ApiClient` para manejar la lógica de negocio y procesar las respuestas de la API. Implementa los siguientes métodos:

| 📌 Tipo de Petición | 🚀 Nombre            | 📄 Descripción                                      |
|------------------|----------------|------------------------------------------------|
| 🟢 GET              | `fetchProducts()` | Obtiene la lista de productos desde la API.     |
| 🔵 POST             | `addProduct()`    | Envía un producto nuevo a la API para su creación. |
| 🔴 DELETE           | `deleteProduct()` | Elimina un producto por su ID.                 |

## ⚠️ Implementación del Control de Errores con Either

Para manejar errores de manera efectiva, se ha utilizado la librería `dartz`, la cual proporciona la clase `Either<L, R>`. En este caso:

- ❌ `Left<String>` representa un error ocurrido durante la solicitud (problemas de red, errores de respuesta, etc.).
- ✅ `Right<T>` representa una respuesta exitosa conteniendo el objeto esperado.

Cada método en `ApiService` utiliza `Either` para envolver la respuesta de la API, permitiendo que el código del lado del cliente maneje errores de manera clara y estructurada mediante `fold()`, lo que permite diferenciar y procesar los resultados exitosos y fallidos adecuadamente.
