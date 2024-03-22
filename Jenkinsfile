pipeline {
    agent any

    stages {
        stage('Build image from Dockerfile') {
            steps {
                script {
                    // Building Docker image from Dockerfile
                    docker.build('argo-image:latest', '.')
                }
            }
        }

        stage('Tag the Image') {
            steps {
                script {
                    // Tagging the Docker image
                    docker.image('argo-image:latest').tag('steve3020/argo:latest')
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    // Pushing the Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        docker.image('steve3020/argo:latest').push()
                    }
                }
            }
        }
    }
}
