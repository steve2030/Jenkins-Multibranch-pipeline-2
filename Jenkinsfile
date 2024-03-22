pipeline {
    agent any

    stages {
        stage('Build image from Dockerfile') {
            steps {
                script {
                    // Building Docker image from Dockerfile
                    docker.build('school.build', '.')
                }
            }
        }



        stage('Push to DockerHub') {
            steps {
                script {
                    // Pushing the Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        docker.image('steve3020/school:latest').push()
                    }
                }
            }
        }
    }
}
