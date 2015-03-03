# giraphInstaller
This is my first version of the installation script.

Tested with: 
Apache Maven 3.0.5
Java version: 1.7.0_71, vendor: Oracle Corporation
Hadoop 2.6.0
Giraph 1.1.0
Wget 1.15

In order to install only execute that scrpt.

You can verify if this worf with a file:

[0,0,[[1,1],[3,3]]]
[1,0,[[0,1],[2,2],[3,1]]]
[2,0,[[1,2],[4,4]]]
[3,0,[[0,3],[1,1],[4,4]]]
[4,0,[[3,4],[2,4]]]

That you can copy to hadoop and execute that example:

hadoop jar /<GIRAPH FOLDER>/giraph-examples/target/giraph-examples-1.1.0-for-hadoop-2.5.1-jar-with-dependencies.jar org.apache.giraph.GiraphRunner org.apache.giraph.examples.SimpleShortestPathsComputation -vif org.apache.giraph.io.formats.JsonLongDoubleFloatDoubleVertexInputFormat -vip <HDFS INPUT FILE> -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -op <HDFS OUTPUT PATH> -w 1
