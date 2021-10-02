#!/bin/bash
export ROOT_DIR=$(pwd)

# LOGS
mkdir -p $ROOT_DIR/logs

#Permisos para pasar todo a modules
sudo chmod 777 -R /share/apps

# FFTW 
cd ${ROOT_DIR}
rm -f $ROOT_DIR/logs/fftw.out $ROOT_DIR/logs/fftw.err
echo "COMPILING FFTW"
./apps/fftw.sh 1>$ROOT_DIR/logs/fftw.out 2>$ROOT_DIR/logs/fftw.err
[ $? -eq 0 ] && echo "DONE WITH FFTW" || (echo "FAILED FFTW" && exit 1)

# CFITSIO
cd ${ROOT_DIR}
rm -f $ROOT_DIR/logs/cfitsio.out $ROOT_DIR/logs/cfitsio.err
echo "COMPILING CFITSIO" 
./apps/cfitsio.sh 1>$ROOT_DIR/logs/cfitsio.out 2>$ROOT_DIR/logs/cfitsio.err
[ $? -eq 0 ] && echo "DONE WITH CFITSIO" || (echo "FAILED CFITSIO" && exit 2)

## TEMPO
cd ${ROOT_DIR}
rm -f $ROOT_DIR/logs/tempo.out $ROOT_DIR/logs/tempo.err
echo "COMPILING TEMPO" 
./apps/tempo.sh 1>$ROOT_DIR/logs/tempo.out 2>$ROOT_DIR/logs/tempo.err
[ $? -eq 0 ] && echo "DONE WITH TEMPO" || (echo "FAILED TEMPO" && exit 3)

# GLIB
cd ${ROOT_DIR}
rm -f $ROOT_DIR/logs/glib.out $ROOT_DIR/logs/glib.err
echo "COMPILING GLIB"
./apps/glib.sh 1>$ROOT_DIR/logs/glib.out 2>$ROOT_DIR/logs/glib.err
[ $? -eq 0 ] && echo "DONE WITH GLIB" || (echo " FAILED GLIB" && exit 4)

# PGPLOT
cd ${ROOT_DIR}
echo "COMPILING PGPLOT"
rm -f $ROOT_DIR/logs/pgplot.out $ROOT_DIR/logs/pgplot.err
./apps/pgplot.sh 1>$ROOT_DIR/logs/pgplot.out 2>$ROOT_DIR/logs/pgplot.err
[ $? -eq 0 ] && echo "DONE WITH PGPLOT" || (echo "FAILED PGPLOT" && exit 5)

TODO
## PRESTO
#cd ${ROOT_DIR}
#echo "COMPILING PRESTO"
#./apps/presto.sh 1>$ROOT_DIR/logs/presto.out 2>$ROOT_DIR/logs/presto.err
#[ $? -eq 0 ] && echo "DONE WITH PRESTO" || echo "FAILED PRESTO"
