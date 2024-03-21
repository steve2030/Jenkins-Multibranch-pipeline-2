pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Checkout code from your version control system
                git 'https://github.com/steve2030/CI-CD-using-Jenkins-and-ArgoCd'

                // Install Node.js and npm
                sh 'curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -'
                sh 'sudo apt-get install -y nodejs'

                // Install project dependencies
                sh 'npm install'

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
