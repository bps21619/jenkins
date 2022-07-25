pipeline {
    agent any
    
    environment{
                 
              registry = "081184234118.dkr.ecr.us-east-1.amazonaws.com/jenkins"
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
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 081184234118.dkr.ecr.us-east-1.amazonaws.com'
                    sh "docker build -t jenkins ."
                    sh "docker tag jenkins:latest 081184234118.dkr.ecr.us-east-1.amazonaws.com/jenkins:latest"
                }
            }
        }

        stage('Docker push'){
            steps{
              script{
                
                 sh 'docker push 081184234118.dkr.ecr.us-east-1.amazonaws.com/jenkins:latest'
               }
        }
    }
        
        stage('Deploy'){
            steps {
                 sh 'kubectl apply -f deployment.yml'
            }
        }
}
}
