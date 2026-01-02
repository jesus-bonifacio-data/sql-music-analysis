-- Objetivo:
-- Analizar la cantidad de canciones por artista, incluyendo aquellos
-- que aún no tienen canciones registradas.
--
-- Conceptos SQL utilizados:
-- LEFT JOIN, COUNT, GROUP BY.
select a.nombre,
       count(c.cancion_id) as total_canciones
from artistas a
left join canciones c on a.artista_id = c.artista_id
group by a.artista_id, a.nombre;


-- Objetivo:
-- Identificar canciones que no han registrado ninguna reproducción,
-- es decir, sin interacción por parte de los usuarios.
--
-- Conceptos SQL utilizados:
-- LEFT JOIN, IS NULL, análisis de datos faltantes.
select c.titulo
from canciones c
left join reproducciones r on c.cancion_id=r.cancion_id
where r.cancion_id is null;


-- Objetivo:
-- Medir el nivel de actividad de cada usuario y la diversidad de canciones
-- que ha escuchado, para analizar patrones de consumo.
--
-- Conceptos SQL utilizados:
-- JOINs, COUNT, COUNT(DISTINCT), GROUP BY.
select u.nombre,
	   count(r.usuario_id) as total_reproducciones,
       count(distinct c.cancion_id) as total_canciones_distintas_escuchadas
from usuarios u
inner join reproducciones r on u.usuario_id=r.usuario_id
inner join canciones c on r.cancion_id=c.cancion_id
group by u.usuario_id, u.nombre;


-- Objetivo:
-- Clasificar las canciones en categorías de popularidad según su puntaje,
-- facilitando la segmentación y el análisis de contenido.
--
-- Conceptos SQL utilizados:
-- CASE WHEN, lógica condicional.
select titulo,popularidad,
       case 
		   when popularidad >=90 then 'Muy popular'
           when popularidad between 80 and 89 then 'Popular'
           else 'Poco popular'
	    end as categoria
from canciones;


-- Objetivo:
-- Comparar distintos criterios de ranking de canciones según su popularidad,
-- mostrando la diferencia entre rankings que permiten saltos de posición
-- y rankings que mantienen posiciones consecutivas en caso de empate.
--
-- Conceptos SQL utilizados:
-- Funciones ventana (RANK, DENSE_RANK), ORDER BY.
select titulo,popularidad,
       rank() over(order by popularidad desc) as saltan_posiciones,
       dense_rank() over(order by popularidad desc) as no_saltan_posiciones
from canciones;


-- Objetivo:
-- Analizar el orden en que cada usuario reproduce canciones a lo largo del tiempo,
-- para entender el comportamiento secuencial de escucha.
--
-- Conceptos SQL utilizados:
-- Funciones ventana (ROW_NUMBER), PARTITION BY, ORDER BY temporal.
select u.nombre,r.fecha_reproduccion,c.titulo,
	   row_number() over(partition by u.usuario_id order by r.fecha_reproduccion) as orden_de_reproduccion
from usuarios u
inner join reproducciones r on u.usuario_id=r.usuario_id
inner join canciones c on c.cancion_id=r.cancion_id;
