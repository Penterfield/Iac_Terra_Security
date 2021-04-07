pipeline {
    agent {
        docker {
            image 'kennethreitz/pipenv:latest'
            args '-u root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
            label 'agent'
        }
    }
    stages {
        stage('Checkov Security Scan') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'aws']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Penterfield/Iac_Terra_Security.git']]])
                script {
                    sh "pipenv install"
                    sh "pipenv run pip install checkov"
                    sh "pipenv run checkov --directory . -o cli || true"
                }


            }
        }
    }

}
