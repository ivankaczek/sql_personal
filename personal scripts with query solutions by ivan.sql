SELECT avg(sal_emp), d.nombre_depto   

FROM empleados e 
INNER JOIN departamentos d 
ON e.id_depto = d.id_depto 

GROUP BY d.nombre_depto 
;

SELECT nombre_depto,sal_emp,AVG(sal_emp)
From empleados
Inner join departamentos
On empleados.id_depto=departamentos.id_depto
Group by  nombre_depto;

SELECT e.nombre, e.cod_jefe, e.id_emp, count(e.nombre)   
FROM empleados e 
INNER JOIN  departamentos d
ON e.id_depto=d.id_depto
WHERE e.cargo_emp LIKE 'Jefe%' 
GROUP BY e.cod_jefe;


SELECT e.nombre, e.cargo_emp, d.nombre_depto 
FROM empleados e 
INNER JOIN  departamentos d 
ON e.id_depto = d.id_depto 
WHERE d.nombre_depto = 'VENTAS' 
OR d.nombre_depto = 'MERCADEO' 
OR d.nombre_depto = 'MANTENIMIENTO' 
GROUP BY d.nombre_depto 
;

SELECT e.nombre, e.cargo_emp, count(d.nombre_depto) AS 'cuantos trabajan en este dpto'  
FROM empleados e 
INNER JOIN  departamentos d 
ON e.id_depto = d.id_depto 
WHERE d.nombre_depto = 'VENTAS' 
OR d.nombre_depto = 'MERCADEO' 
OR d.nombre_depto = 'MANTENIMIENTO' 
GROUP BY d.nombre_depto 
;

SELECT e.nombre, e.cargo_emp, (count(d.nombre_depto)-1) AS 'cant empleados a cargo'  
FROM empleados e 
INNER JOIN  departamentos d 
ON e.id_depto = d.id_depto 
WHERE e.nombre LIKE 'Jefe%' 
OR d.nombre_depto = 'VENTAS' 
OR d.nombre_depto = 'MERCADEO' 
OR d.nombre_depto = 'MANTENIMIENTO' 
GROUP BY d.nombre_depto 
;



# a) A continuación, realizar las siguientes consultas sobre la base de datos personal:
# 1. Obtener los datos completos de los empleados.

SELECT * FROM empleados;


# 2. Obtener los datos completos de los departamentos.

SELECT * FROM departamentos;

# 3. Listar el nombre de los departamentos.

SELECT DISTINCT nombre_depto AS 'Nombre del departamento' 
FROM departamentos;

# 4. Obtener el nombre y salario de todos los empleados.

SELECT nombre AS 'Nombre', sal_emp AS 'Salario (en pesetas)'  
FROM empleados;

# 5. Listar todas las comisiones.

SELECT nombre AS 'Nombre', comision_emp AS 'Comisión del empleado' 
FROM empleados;

# 6. Obtener los datos de los empleados cuyo cargo sea ‘Secretaria’.

SELECT * 
 FROM empleados 
 WHERE cargo_emp = 'Secretaria';

# 7. Obtener los datos de los empleados vendedores, ordenados por nombre alfabéticamente.

SELECT * 
 FROM empleados 
 WHERE cargo_emp = 'Vendedor' 
 ORDER BY nombre;

# 8. Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a mayor.

SELECT nombre AS 'Nombre', cargo_emp AS 'Cargo' 
 FROM empleados 
 ORDER BY sal_emp;

# 9. Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para las respectivas tablas de empleados.

SELECT nombre AS 'Nombre', cargo_emp AS 'Cargo' 
 FROM empleados;


# 10. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión de menor a mayor.

SELECT nombre AS 'Nombre', sal_emp AS 'Salario', comision_emp AS 'Comisión' 
 FROM empleados 
 WHERE id_depto = 2000 
 ORDER BY comision_emp;

# 11. Obtener el valor total a pagar que resulta de sumar el salario y la comisión de los empleados del departamento 3000 
#     una bonificación de 500, en orden alfabético del empleado.

SELECT nombre AS 'Nombre', (sal_emp + comision_emp + 500) as 'Total a pagar (salario + comisión + bonificación)'  
 FROM empleados
 WHERE id_depto = 3000 
 ORDER BY nombre;

# 12. Muestra los empleados cuyo nombre empiece con la letra J. 

SELECT nombre AS 'Nombre' 
 FROM empleados 
 WHERE nombre LIKE 'J%';

# 13. Listar el salario, la comisión, el salario total (salario + comisión) y nombre, 
#     de aquellos empleados que tienen comisión superior a 1000.

SELECT nombre, sal_emp, comision_emp, (sal_emp + comision_emp) as 'salario total' 
 FROM empleados 
 WHERE comision_emp > 1000;

# 14. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión.

SELECT nombre, sal_emp, comision_emp, (sal_emp + comision_emp) as 'salario total' 
 FROM empleados 
 WHERE comision_emp =  0;

# 15. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.

/*
Podemos reutilizar el codigo anterior y despues modificarlo
SELECT nombre, sal_emp, comision_emp, (sal_emp + comision_emp) as 'salario total' 
 FROM empleados 
 WHERE comision_emp > sal_emp;
 
 incluso podemos calcular la diferencia, la cual debe ser mayor a cero, para estar seguros que lo hemos hecho bien
 
 SELECT nombre, sal_emp, comision_emp, (sal_emp + comision_emp) as 'salario total', (comision_emp - sal_emp) as 'diferencia'
 FROM empleados 
 WHERE comision_emp > sal_emp;
 
 Habiendo comprobado esto, podemos dejar sólo la búsqueda que pide el ejercicio, donde solo pide el nombre
 
*/

SELECT nombre
 FROM empleados 
 WHERE comision_emp > sal_emp;

# 16. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.

/*
Podemos mirar primero la cuenta para saber si lo estamos haciendo bien. 
Por ejemplo haciendo la cuenta siguiente, se cumple lo pedido cuando lo marcado como diferencia es negativo

SELECT nombre, (comision_emp - 0.3*sal_emp) as 'diferencia'
 FROM empleados;
 
 La lista arroja lo siguiente, aunque es facil ver que seria mejor ordenarlos de algún modo para poder controlar mejor
 Luis Pérez
Darío Casas
Carla López
María Rojas
Marcos Cortez
Irene Díaz
Abel Gómez
Iván Duarte
*/


SELECT nombre
 FROM empleados 
 WHERE comision_emp <= (sal_emp*0.3);


# 17. Hallar los empleados cuyo nombre no contiene la cadena “MA”

/*

*/


# 18. Obtener los nombres de los departamentos que sean “Ventas” ni “Investigación” ni ‘Mantenimiento.
# 19. Ahora obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” ni ‘Mantenimiento.
# 20. Mostrar el salario más alto de la empresa.
# 21. Mostrar el nombre del último empleado de la lista por orden alfabético.
# 22. Hallar el salario más alto, el más bajo y la diferencia entre ellos.
# 23. Hallar el salario promedio por departamento.

# Consultas con Having
# 24. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.
# 25. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los que tengan más de dos empleados (2 incluido).
# 26. Hallar los departamentos que no tienen empleados

#Consulta con Subconsulta
# 27. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.

23. Hallar el salario promedio por departamento.
1) seleccionamos cada departamento



Consultas con Having
24. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.
25. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los que tengan más de dos empleados (2 incluido).
26. Hallar los departamentos que no tienen empleados
Consulta con Subconsulta
27. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.

/*
echo "# sql_personal" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/ivankaczek/sql_personal.git
git push -u origin main

*/