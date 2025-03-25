pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-creds') // replace with your actual Jenkins credentials ID
        IMAGE_NAME = 'yourdockerhubusername/comp367-maven-webapp'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/jrojasfernandez/comp367-maven-webapp.git'
            }
        }
        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Login') {
            steps {
                sh "echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin"
            }
        }
        stage('Docker Build') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }
        stage('Docker Push') {
            steps {
                sh "docker push $IMAGE_NAME"
            }
        }
    }
}
