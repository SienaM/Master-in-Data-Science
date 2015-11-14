#!/bin/sh

##linea de comandos 

csvsort -d '^'  -c nb_engines $1 | csvcut -c model | tail -1 