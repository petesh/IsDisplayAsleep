
Monitor activity detection examples - objective c & java with jna
===

The purpose of the sample code is to show the detection of the different
display using CoreGraphics and then checking if they're awake or asleep.

The code itself displays a text output with the state of the monitor. This
could more easily be just a return code of true or false, which can be acted
on by the user.

The purpose of both C and JNA code is to show that you can interface with the
MacOS environment without needing to write JNI code which can be difficult to
work with. While there are complications in the JNA code involving dealing
with structures and memory, the ability to run it without having to load
another loadable object in your JRE is probably a good thing.

Building the code
---

The Objective-C code requires a java compiler and a development environment installed -
e.g. XCode or the Command Line Development kit (`xcode-select --install`).

The java code requires a copy of the [JNA](https://github.com/java-native-access/jna/blob/master/README.md)
jar file in the current working directory. It can be downloaded from the JNA link.

There's a makefile, which builds the examples, they can be built using:

    $ make
    javac -cp .:jna.jar CoreGraphics.java
    javac -cp .:jna.jar IsDisplayAsleep.java
    javac -cp .:jna.jar jna_monitors_run.java
    cc -framework Foundation -framework CoreGraphics    cgdisplaydetection.m   -o cgdisplaydetection


They can be run using:

    $ make run-all
    javac -cp .:jna.jar CoreGraphics.java
    javac -cp .:jna.jar IsDisplayAsleep.java
    javac -cp .:jna.jar jna_monitors_run.java
    java -cp .:jna.jar jna_monitors_run
    Awake
    cc -framework Foundation -framework CoreGraphics    cgdisplaydetection.m   -o cgdisplaydetection
    ./cgdisplaydetection
    Awake

