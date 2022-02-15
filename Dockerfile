FROM openjdk:11-jdk
VOLUME /tmp
ADD target/pubsub-streaming-1.0.0-SNAPSHOT.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]