pipeline {
  agent any
  stages {
    stage ('PIP Install') {
      steps {
        //sh 'pip3 install virtualenv'
        //sh '/usr/local/bin/virtualenv checkov_env && source checkov_env/bin/activate'
        sh 'pip3 install checkov --user && whereis checkov'
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
