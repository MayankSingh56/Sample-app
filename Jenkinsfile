pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'simple-app'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                url: 'https://github.com/MayankSingh56/Simple-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:latest .'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker stop ${DOCKER_IMAGE}-container || true'
                sh 'docker rm ${DOCKER_IMAGE}-container || true'
                sh 'docker run -d -p 8080:80 --name ${DOCKER_IMAGE}-container ${DOCKER_IMAGE}:latest'
            }
        }
        stage('Test') {
            steps {
                sh 'sleep 5' // Wait for container to start
                sh 'curl -f http://localhost:8080 || exit 1'
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed. Cleaning up...'
            sh 'docker stop ${DOCKER_IMAGE}-container || true'
            sh 'docker rm ${DOCKER_IMAGE}-container || true'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
