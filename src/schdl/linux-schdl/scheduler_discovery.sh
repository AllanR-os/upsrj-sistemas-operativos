#!/bin/bash

# Práctica: Exploración del Scheduler Real en Linux (Ubuntu 22.04)
# Archivo: scheduler_discovery.sh
#
# En esta práctica se busca localizar y analizar el scheduler real
# que utiliza Linux. A diferencia de los algoritmos vistos en clase
# como FCFS, SJF o Round Robin, Linux utiliza el Completely Fair Scheduler (CFS).
#
# El objetivo es encontrar el archivo donde se implementa el scheduler
# y mostrar su código fuente usando solo comandos básicos.


# Mostrar información inicial
echo "Exploración del Scheduler Real de Linux"
echo "Sistema: Ubuntu 22.04"
echo
echo "Se localizará el código fuente del scheduler del kernel Linux."
echo "El scheduler por defecto es el Completely Fair Scheduler (CFS)."
echo


# Mostrar la ubicación actual
echo "Ubicación actual:"
pwd
echo


# El código fuente del kernel no se encuentra en /home
# En Ubuntu suele estar dentro del directorio /usr/src
echo "Contenido del directorio /usr/src:"
ls /usr/src
echo


# Entrar al directorio del kernel
# Se usa linux-headers, que contiene el código necesario para análisis
cd /usr/src
cd linux-headers-*
echo

echo "Ruta actual dentro del kernel:"
pwd
echo


# Dentro del kernel, la planificación de procesos se encuentra
# en el directorio kernel/sched
echo "Entrando al directorio de planificación de procesos:"
cd kernel/sched
echo

echo "Ruta actual:"
pwd
echo


# Listar los archivos relacionados con el scheduler
echo "Archivos relacionados con el scheduler:"
ls
echo

# El archivo fair.c implementa el Completely Fair Scheduler
echo "El archivo fair.c contiene la implementación del CFS."
echo


# Mostrar el código fuente real del scheduler
# No es necesario entender todo el código, solo identificar
# conceptos como fairness y virtual runtime
echo "Mostrando el código fuente del scheduler (fair.c):"
echo

cat fair.c


# Reflexión final
# ¿Por qué Linux no implementa directamente FCFS, SJF o RR?
#
# Estos algoritmos son modelos teóricos usados para entender
# conceptos básicos de planificación, pero no son adecuados
# para sistemas reales con muchos procesos y usuarios.
#
# Linux no puede conocer el tiempo exacto que un proceso tardará,
# por lo que no puede aplicar SJF de forma real.
#
# El CFS busca repartir el CPU de manera justa entre procesos,
# usando el concepto de tiempo virtual (vruntime),
# evitando la inanición y mejorando la responsividad del sistema.
#
# Por esta razón, Linux utiliza un scheduler más flexible y eficiente
# que los algoritmos clásicos vistos en clase.
