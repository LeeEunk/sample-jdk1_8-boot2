FROM amazoncorretto:8u402-alpine3.18

WORKDIR /app

COPY . .
RUN ./gradlew clean build -S 2&>1 | exit
RUN rm -rf build/libs/*-plain.jar

ENTRYPOINT java -jar ./build/libs/*.jar