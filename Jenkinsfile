pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                // Build Docker image from Dockerfile
                sh '''
                    JD_IMAGE="argocd-image"
                    sudo docker build -t "$JD_IMAGE" .
                '''

            }
        }

        stage('Push Docker Image to GCR') {
            steps {
                // Push Docker image to Google Container Registry (GCR)
                script {
                    docker.withRegistry('https://gcr.io/uzapoint-microservices/', 'gcr_credentials') {
                        docker.image('argocd-image').push('latest')
                    }
                }
            }
        }
    }
}
