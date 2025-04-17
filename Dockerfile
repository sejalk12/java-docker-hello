FROM openjdk:17 AS build-stage
WORKDIR /app
COPY HelloWorld.java .
RUN javac HelloWorld.java

FROM openjdk:17-jdk-slim AS runtime-stage
WORKDIR /app
COPY --from=build-stage /app/HelloWorld.class .
CMD ["java", "HelloWorld"]
