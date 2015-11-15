#!/bin/sh

#Creamos el listado de motores
csvsort -d '^' -c nb_engines $1 -r| csvcut -c nb_engines | csvgrep -c nb_engines -m $2 |tail -n +2  | wc -l