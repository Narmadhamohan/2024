# Use the official Maven image to build the application
FROM maven:3.8.6-openjdk-11 AS build

WORKDIR /app

# Copy the pom.xml and install dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the source code
COPY src ./src

# Package the application
RUN mvn package

# Use the official OpenJDK image to run the application
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar demo.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "demo.jar"]
