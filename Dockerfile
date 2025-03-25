FROM maven:3.9.2-eclipse-temurin-17 as builder
WORKDIR /app
COPY . .
RUN mvn clean package

FROM eclipse-temurin:17
WORKDIR /app
COPY --from=builder /app/target/*.war app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]
