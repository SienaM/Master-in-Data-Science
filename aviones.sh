#!/bin/sh

# El script muestra el número de aviones que hay con un determinado número de motores

# El primer parámetro es el nombre del fichero del que queremos tomar los datos
# El segundo parámetro es para introducir el número de motores
csvsort -d '^' -c nb_engines $1 -r| csvcut -c nb_engines | csvgrep -c nb_engines -m $2 |tail -n +2  | wc -l