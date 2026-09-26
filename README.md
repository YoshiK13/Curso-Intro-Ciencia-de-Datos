# Explorador Histórico de Mundiales de la FIFA

Proyecto desarrollado para el curso de **Introducción a la Ciencia de Datos**.

## Objetivo

Desarrollar un programa que permita explorar, consultar y aprender de la información histórica y estadísticas de los mundiales de fútbol pasados.

## Creador

- Joshoa Alarcón Sánchez · 20221020013

## Tecnologías Utilizadas

- **CSV:** Almacenamiento, lectura y preprocesamiento de datasets tabulares.
- **SQL (MariaDB / MySQL):** Modelado relacional, almacenamiento persistente y consultas estructuradas.
- **Python:** Limpieza, procesamiento y transformación de datos.
- **XAMPP:** Entorno de servidor local (Apache, MariaDB) con phpMyAdmin para la gestión de la base de datos.
- **Streamlit (Python):** Construcción de la interfaz de usuario interactiva y visualizaciones *(a implementar en etapas posteriores)*.

## Instrucciones para Cargar la Base de Datos

El esquema y los datos consolidados se encuentran en el archivo [`sql/fifa_world_cup.sql`](sql/fifa_world_cup.sql).

### Pasos para importar en phpMyAdmin:

1. **Iniciar servicios:** Abrir el panel de control de **XAMPP** y arrancar los módulos **Apache** y **MySQL**.
2. **Acceder a phpMyAdmin:** Abrir el navegador e ingresar a [http://localhost/phpmyadmin](http://localhost/phpmyadmin).
3. **Importar script:**
   - Hacer clic en la pestaña superior **Importar** (el script se encarga de crear y seleccionar la base de datos `fifa_world_cup` automáticamente).
   - En *Archivo a importar*, seleccionar el archivo `sql/fifa_world_cup.sql`.
   - Bajar al final de la página y hacer clic en **Importar** (o **Continuar**).
4. **Verificación:** Comprobar que en el panel izquierdo aparezca la base de datos `fifa_world_cup` con sus 15 tablas importadas correctamente.