pipeline {
    agent any

    stages {
        stage('Installations') {
            steps {
                // Install project dependencies
                sh '''
                    echo "uzapoint" | sudo -S bash -c "npm install"
                '''
            }
        }

        stage('Build the App') {
            steps {
                // Build the Vue.js application
                sh '''
                    echo "uzapoint" | sudo -S bash -c "npm run build"
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build('argocd-image')
                }
            }
        }

        stage('Push Docker Image to GCR') {
            steps {
                // Push Docker image to Google Container Registry (GCR)
                script {
                    docker.withRegistry('https://gcr.io/uzapoint-microservices/', 'gcr_credentials') {
                        docker.image('school').push('latest')
                    }
                }
            }
        }
    }
}
