pipeline {
    agent {
        docker {
            image 'maven:3.9.2-eclipse-temurin-17'
        }
    }
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-creds')
        IMAGE_NAME = 'jrojasfe/comp367-maven-webapp'
    }
    stages {
        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Login') {
            steps {
                sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Docker Push') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }
    }
}
