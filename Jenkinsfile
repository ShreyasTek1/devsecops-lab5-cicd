pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devsecops-lab5-cicd:latest .'
            }
        }

        stage('Security Scan') {
            steps {
                sh 'trivy image devsecops-lab5-cicd:latest'
            }
        }

        stage('Deploy Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                        docker tag devsecops-lab5-cicd:latest shreyastekawade/devsecops-lab5-cicd:latest
                        docker push shreyastekawade/devsecops-lab5-cicd:latest
                        docker logout
                    '''
                }
            }
        }

        stage('Clean up') {
            steps {
                sh '''
                    docker rmi devsecops-lab5-cicd:latest || true
                    docker system prune -f
                '''
            }
        }

    }
}
