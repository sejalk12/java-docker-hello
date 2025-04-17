# Step 1: Use OpenJDK base image to compile
FROM openjdk:17 AS build-stage

# Set working directory
WORKDIR /app

# Copy source code
COPY HelloWorld.java .

# Compile Java file
RUN javac HelloWorld.java

# Step 2: Use runtime image (slimmer)
FROM openjdk:17-slim AS runtime-stage
WORKDIR /app

# Copy the compiled class file
COPY --from=build-stage /app/HelloWorld.class .

# Run the Java program
CMD ["java", "HelloWorld"]
