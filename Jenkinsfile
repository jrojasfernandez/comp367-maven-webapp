pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                bat 'echo "Welcome to COMP367"'
            }
        }
    }
}
