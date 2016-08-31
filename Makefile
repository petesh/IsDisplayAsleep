JAVAC=javac
JAVA=java
JAVA_FLAGS=-cp .:jna.jar
CFLAGS=-framework Foundation -framework CoreGraphics

JAVA_BIN=CoreGraphics.class IsDisplayAsleep.class jna_monitors_run.class
OBJC_BIN=cgdisplaydetection

.PHONY: all all-java all-c

all: all-java all-c

all-java: $(JAVA_BIN)

all-c: $(OBJC_BIN)

jna_monitors_run.class: IsDisplayAsleep.class jna_monitors_run.java

run-all: run-java run-c

run-java: all-java
	$(JAVA) $(JAVA_FLAGS) jna_monitors_run

run-c: all-c
	./cgdisplaydetection

clean:
	rm -f *.class cgdisplaydetection

%.class : %.java
	$(JAVAC) $(JAVA_FLAGS) $(@:.class=.java)

