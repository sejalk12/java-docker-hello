pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sejalk12/java-docker-hello.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t java-hello-world-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name hello-app java-hello-world-app'
            }
        }
    }
}
