# SQL Music Analysis Project

## Descripción
Proyecto de análisis de datos desarrollado en SQL sobre una base de datos simulada
de una plataforma de música. El objetivo es analizar el comportamiento de usuarios,
la popularidad de canciones y patrones de consumo.

Este proyecto fue desarrollado como parte de mi preparación para prácticas
pre profesionales en análisis de datos.

## Modelo de datos
La base de datos incluye las siguientes entidades:
- usuarios
- artistas
- canciones
- reproducciones
- generos
- amigos

## Análisis realizados
- Cantidad de canciones por artista (incluyendo artistas sin canciones)
- Canciones sin reproducciones
- Actividad y diversidad de escucha por usuario
- Clasificación de canciones por popularidad
- Ranking de canciones usando funciones ventana
- Orden de reproducción por usuario

## Tecnologías utilizadas
- SQL (JOINs, agregaciones, funciones ventana)
- MySQL
- MySQL Workbench

## Key SQL Analysis Results
- Cantidad de canciones por artista (LEFT JOIN)
Analiza cuántas canciones tiene cada artista, incluyendo aquellos sin canciones registradas.

![Cantidad de canciones por artista](sql/images/Cantidad%20de%20canciones%20por%20artista%20(LEFT%20JOIN).PNG)

---

### Canciones sin reproducciones
- Identifica canciones que no han sido reproducidas por ningún usuario.

![Canciones sin reproducciones](sql/images/Canciones%20sin%20reproducciones.PNG)

---

### Orden de reproducción por usuario (ROW_NUMBER)

![Orden de reproducción](sql/images/Orden%20de%20reproducción%20por%20usuario%20(ROW_NUMBER).PNG)

