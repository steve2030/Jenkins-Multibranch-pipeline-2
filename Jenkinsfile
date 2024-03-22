pipeline {
    agent any

    stages {
        stage('Build image from Dockerfile') {
            steps {
                script {
                    // Building Docker image from Dockerfile
                    docker.build('school:latest', '.')
                }
            }
        }

        stage('Tag the Image') {
            steps {


                  sh 'docker tag school steve3020/school:new'
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    // Pushing the Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        docker.image('steve3020/school:new').push()
                    }
                }
            }
        }
    }
}
