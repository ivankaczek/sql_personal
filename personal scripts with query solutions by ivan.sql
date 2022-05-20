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
# 10. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión de menor a mayor.
# 11. Obtener el valor total a pagar que resulta de sumar el salario y la comisión de los empleados del departamento 3000 una bonificación de 500, en orden alfabético del empleado.
# 12. Muestra los empleados cuyo nombre empiece con la letra J. 2.

# 13. Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos empleados que tienen comisión superior a 1000.
# 14. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión.
# 15. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
# 16. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
# 17. Hallar los empleados cuyo nombre no contiene la cadena “MA”
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
*/