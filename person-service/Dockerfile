FROM gradle:5.4-jdk11 as build
WORKDIR /home/gradle/src
COPY . /home/gradle/src
RUN gradle build --no-daemon

FROM openjdk:11.0-jdk as application
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-boot-person-service.jar 
EXPOSE 8080
CMD ["java","-jar","/app/spring-boot-person-service.jar"]
