pipeline {
  agent any
  stages {
    stage ('PIP Install') {
      steps {
        sh 'pip3 install checkov --user'
      }
    }
    stage ('Checkov IaC Testing') {
      steps {
        echo 'Running scans against files' 
        sh '/var/lib/jenkins/.local/bin/checkov -d --output json checkovResults.json --exit-code 1'
      post {
          always{
              archiveArtifacts artifacts: 'checkovResults.json'
          }
        }
      }
    }   
  }
}
