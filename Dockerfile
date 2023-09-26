FROM openjdk:22-jdk-bullseye

RUN mkdir -p /home/app

WORKDIR /home/app
COPY ./spring-petclinic-3.1.0-SNAPSHOT.jar /home/app

EXPOSE 8080

CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]
