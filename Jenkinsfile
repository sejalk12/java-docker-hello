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
script { 
dir('java-docker-hello') { 
docker.build("java-hello-world-app", ".") 
} 
} 
} 
} 
stage('Run Docker Container') { 
 
            steps { 
                script { 
                    docker.image("java-hello-world-app").run() 
                } 
            } 
        } 
    } 
} 
