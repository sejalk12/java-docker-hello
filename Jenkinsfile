pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("java-hello")
                }
            }
        }

        stage('Run Container (Test)') {
            steps {
                script {
                    docker.image("java-hello").inside {
                        echo 'Running Docker container...'
                        sh 'java HelloWorld'
                    }
                }
            }
        }
    }
}
