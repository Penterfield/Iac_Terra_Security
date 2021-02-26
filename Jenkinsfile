pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/Penterfield/Iac_Terra_Security.git'
      }
    }
    stage ('PIP Install') {
      steps {
        sh 'pip3 install checkov'
      }
    }
    stage ('Checkov IaC Testing') {
      steps {
        echo 'Running scans against files' 
        sh 'checkov -d --output json checkovResults.json --exit-code 1'
      post {
          always{
              archiveArtifacts artifacts: 'checkovResults.json'
          }
        }
      }
    }   
  }
}
