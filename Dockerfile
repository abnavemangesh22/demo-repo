FROM mangeshabnave/spring-maven AS build
RUN mkdir /app
WORKDIR /app
COPY . .
RUN mvn package 

FROM openjdk:18-jdk-alpine3.14
COPY --from=build /app/target/*.jar /run/sample.jar
EXPOSE 8080
CMD ["java", "-jar", "/run/sample.jar"] 
