#!/bin/bash

cd /home/erik/code/DynMap/flume-tcp-sink/src/main/java
/usr/bin/javac -Xlint -cp "/home/erik/code/DynMap/apache-flume-1.3.1-bin/flume-ng-core/src/main/java:/home/erik/code/DynMap/apache-flume-1.3.1-bin/flume-ng-sdk/src/main/java:/home/erik/code/DynMap/apache-flume-1.3.1-bin/lib:/home/erik/code/DynMap/apache-flume-1.3.1-bin/flume-ng-configuration/src/main/java:/home/erik/code/DynMap/slf4j-1.7.2/slf4j-api/src/main/java:/home/erik/code/DynMap/protobuf-2.5.0rc1/java/src/main/java:/home/erik/code/DynMap/guava-14.0-rc3:/home/erik/code/DynMap/commons-io-2.4-src/src/main/java" org/apache/flume/sink/TCPSink.java
/usr/bin/jar cf TCPSink.jar org/apache/flume/sink/TCPSink.class
/bin/cp TCPSink.jar /home/erik/code/DynMap/apache-flume-1.3.1-bin/lib/
