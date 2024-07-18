1. Convenciones sobre configuración: Rails sigue el principio de "convención sobre configuración", lo que significa que sigue convenciones preestablecidas en lugar de requerir configuraciones explícitas siempre que sea posible. Esto hace que el código sea más predecible y reduce la necesidad de decisiones arbitrarias.

2. Convenciones de nomenclatura: Uso de nombres en plural para modelos (`User` para una tabla users) y nombres de métodos descriptivos (`find_by_email`).

3. MVC (Modelo-Vista-Controlador): Rails sigue el patrón de arquitectura MVC, lo que separa la lógica de negocio (modelos), la presentación (vistas) y el control de las solicitudes (controladores). Esta separación facilita la organización del código y la mantenibilidad.

4. Uso de Helpers y Partial Views: Uso de Helpers y Partial Views para dividir y reutilizar código en las vistas, mejorando así la modularidad y la legibilidad.

5. Convenciones de Routing: El uso de rutas RESTful (CRUD) y la definición clara de rutas en `config/routes.rb` facilitan la comprensión de cómo se mapean las URLs a controladores y acciones.

6. Testing: Tests unitarios y de integración con minitest.
