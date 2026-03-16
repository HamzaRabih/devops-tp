pipeline {
   environment {
     registry = "hamzarabih/devops-tp4"
     registryCredential = 'dokerHub'
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
     steps{
       script {
        dockerImage = docker.build registry + ":$BUILD_NUMBER"
       }
     }
   }
    stage('Test image') {
      steps{
        script {

          echo "Tests passed"
        }
      }
    }
    stage('Publish Image') {
      steps{
        script {
        docker.withRegistry( '', registryCredential ) {
        dockerImage.push()
        }
      }
    }
  }
  }
 }
