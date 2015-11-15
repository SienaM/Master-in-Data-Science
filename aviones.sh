#!/bin/sh

#Creamos el listado de motores
csvsort -d '^' -c nb_engines optd_aircraft.csv -r| csvcut -c nb_engines > listado.csv 

#Indicamos el número de aviones por cada número de motores
cat listado.csv |uniq -c| tail -n +2    