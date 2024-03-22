pipeline {
    agent any

    stages {


        stage('Installations') {
            steps {


                // Install project dependencies
                sh 'npm install'
            }
        }

        stage('Build the App') {
            steps {
                // Build the Vue.js application
                sh 'npm run build'
            }
        }

        stage('Static Code Analysis') {
            steps {
                // Execute SonarQube scanner for static code analysis
                withSonarQubeEnv('SonarQube_Server') {
                    sh 'npm run lint'
                }
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
