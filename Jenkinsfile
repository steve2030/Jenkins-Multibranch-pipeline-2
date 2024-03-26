pipeline {
    agent any

    stages {

        stage('Unit Testing') {
            steps {
                // Add your unit testing commands here
                sh 'npm install' // Example command to install dependencies
                sh 'npm test'    // Example command to run unit tests
            }
             }

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
