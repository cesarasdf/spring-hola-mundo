# ====== Etapa 1: Build ======
FROM maven:3.9.9-eclipse-temurin-17 AS builder

# Carpeta de trabajo
WORKDIR /app

# Copiar el pom y descargar dependencias (cacheo)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiar el resto del código y compilar
COPY src ./src
RUN mvn clean package -DskipTests

# ====== Etapa 2: Run ======
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copiamos solo el jar desde la etapa anterior
COPY --from=builder /app/target/hello-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]
