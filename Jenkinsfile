pipeline {
    agent any

    environment {
        IMAGE_NAME = "spring-hola-mundo"
    }

    stages {
        stage('Clonar repositorio') {
            steps {
                git 'https://github.com/cesarasdf/spring-hola-mundo.git'
            }
        }

        stage('Compilar Maven') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Construir Docker') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Probar Docker') {
            steps {
                sh "docker run -d -p 8081 :8080 --name $IMAGE_NAME $IMAGE_NAME"
            }
        }
    }
}
