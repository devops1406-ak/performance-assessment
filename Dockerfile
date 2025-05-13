
FROM maven:3.8.7 AS build
WORKDIR /app
COPY . /app 
RUN mvn clean install


FROM openjdk:17.0.2-jdk-slim
COPY --from=build /app/target/*.jar /app/app.jar
EXPOSE 9001
CMD ["sh", "-c", "java -jar /app/app.jar"]



