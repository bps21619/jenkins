pipeline {
    agent any
    environment{
                 
              registry = "081184234118.dkr.ecr.ap-south-1.amazonaws.com/test"
         
    }

    stages {
        
       // stage('Cloning Git') {
           // steps {
              //  checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/bps21619/jenkins']]])     
           // }
       // }

        stage('Docker build'){
            steps{
                script{
                    dockerImage= docker.build registry
                    sh "docker build -t test ."
                }
            }
        }

        stage('Docker push'){
            steps{
              script{
                 sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 081184234118.dkr.ecr.ap-south-1.amazonaws.com'
                 sh 'docker push 081184234118.dkr.ecr.ap-south-1.amazonaws.com/test:latest'
               }
        }
    }
}
}
