pipeline {
    environment {
        registry = "hamzarabih/devops-tp4"
        registryCredential = 'dokerHub' // Ensure this ID matches Jenkins Credentials
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/HamzaRabih/devops-tp.git'
            }
        }
        stage('Building image') {
            steps {
                script {
                    // Building with both build number and 'latest' tag
                    dockerImage = docker.build("${registry}:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Publish Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
    post {
        always {
            script {
                // Cleans up the image from the Jenkins node to save space
                sh "docker rmi ${registry}:${env.BUILD_NUMBER}"
                sh "docker rmi ${registry}:latest"
            }
        }
    }
}
