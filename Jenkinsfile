pipeline {
    agent any

    environment {
        IMAGE_NAME = 'java-hello'
        TAG = 'latest'
        DOCKER_REGISTRY = ''  // Optional: set if pushing to DockerHub
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/yourusername/java-docker-hello.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${TAG}")
                }
            }
        }

        stage('Run Container (Test)') {
            steps {
                script {
                    def container = docker.image("${IMAGE_NAME}:${TAG}")
                    container.run('--rm')
                }
            }
        }

        // Optional: Push to DockerHub
        // stage('Push to DockerHub') {
        //     steps {
        //         withDockerRegistry([credentialsId: 'dockerhub-credentials', url: '']) {
        //             script {
        //                 docker.image("${IMAGE_NAME}:${TAG}").push()
        //             }
        //         }
        //     }
        // }
    }
}
