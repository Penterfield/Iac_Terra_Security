pipeline {
    agent {
        docker {
            image 'kennethreitz/pipenv:latest'
            args '-u root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
            label 'agent'
        }
    }
    stages {
        stage('test') {
            steps {
                script {
                    sh "pipenv install"
                    sh "pipenv run pip install checkov"
                    sh "pipenv run checkov --directory . -o junitxml > result.xml || true"
                    junit "result.xml"
                }


            }
        }
    }
}
