pipeline {
    agent any

    environment {
        IMAGE_NAME = "java-docker-hello"
        CONTAINER_NAME = "java-docker-app"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/sejalk12/java-docker-hello.git'
            }
        }

        stage('Compile Java Code') {
            steps {
                bat 'javac HelloWorld.java'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker run -d --name %CONTAINER_NAME% -p 8080:8080 %IMAGE_NAME%'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        cleanup {
            bat 'docker stop %CONTAINER_NAME%'
            bat 'docker rm %CONTAINER_NAME%'
        }
    }
}
