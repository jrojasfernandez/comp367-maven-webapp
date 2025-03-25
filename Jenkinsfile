pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-creds')
        IMAGE_NAME = 'jrojasfe/comp367-maven-webapp'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/jrojasfernandez/comp367-maven-webapp.git'
            }
        }
        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Docker Login') {
            steps {
                bat "docker login -u %DOCKER_HUB_CREDENTIALS_USR% -p %DOCKER_HUB_CREDENTIALS_PSW%"
            }
        }
        stage('Docker Build') {
            steps {
                bat "docker build -t %IMAGE_NAME% ."
            }
        }
        stage('Docker Push') {
            steps {
                bat "docker push %IMAGE_NAME%"
            }
        }
    }
}
