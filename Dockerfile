FROM openjdk:26-slim AS build
WORKDIR /app
COPY .. .
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

FROM openjdk:26-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]