#!/bin/bash


#OPTIONS
TRARBALL=""
SOURCES=""

#EXIT_VALUES
EXIT_CORRECT=0
EXIT_HELP=100

while [ "$1" != "" ]; do
	case $1 in
		-s | --sources)
			shift
			SOURCES=$1
			;;
		-h | --help)
			echo "Script for giraph building from sources:"
			echo "FILE: http://ftp.cixug.es/apache/giraph/giraph-1.1.0/giraph-dist-1.1.0-src.tar.gz"
			echo "Dependences: "
			echo "Apache Maven 3.0.5"
			echo "jdk 7"
			echo "Wget 1.15"
			echo "--------"
			echo "If you have sources extraced, then inidicate that with:"
			echo "-s <tarball file>"
			exit $HELP_EXIT
			;;
		*)
			FINAL_VALUE=$1	
	esac	
	shift
done

if [ "$SOURCES" = "" ]; then
wget http://ftp.cixug.es/apache/giraph/giraph-1.1.0/giraph-dist-1.1.0-src.tar.gz

tar -xzf giraph-dist-1.1.0-src.tar.gz
rm -rf giraph-dist-1.1.0-src.tar.gz
cd giraph-1.1.0/
fi
if [ "$SOURCES" != "" ]; then
cd "$SOURCES"
fi

sed -i '93i\    job.getConfiguration().setBoolean("giraph.SplitMasterWorker", false);\' ./giraph-core/src/main/java/org/apache/giraph/GiraphRunner.java

mvn -Phadoop_2 -fae -DskipTests clean install
