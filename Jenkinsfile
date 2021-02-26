pipeline {
  agent any
  stages {
    stage ('PIP Install') {
      steps {
        sh 'virtualenv venv && . venv/bin/activate && pip3 install checkov'
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
