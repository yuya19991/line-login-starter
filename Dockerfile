FROM openjdk:8-alpine
ENV MAVEN_OPTS="-Xmx256m"
RUN apk add --no-cache maven
COPY . /app
WORKDIR /app
RUN mvn clean package -Dmaven.test.skip=true
EXPOSE 8080
ENTRYPOINT ["java", "-Xmx256m", "-jar", "/app/target/line-login-starter.jar"]
