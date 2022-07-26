pipeline {
    agent any
    
    environment{
                 
              registry = "034280345394.dkr.ecr.us-east-1.amazonaws.com/nodeapp"
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
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 034280345394.dkr.ecr.us-east-1.amazonaws.com'
                    sh "docker build -t nodeapp ."
                    sh "docker tag nodeapp:latest 034280345394.dkr.ecr.us-east-1.amazonaws.com/nodeapp:latest"
                }
            }
        }

        stage('Docker push'){
            steps{
              script{
                
                 sh 'docker push 034280345394.dkr.ecr.us-east-1.amazonaws.com/nodeapp:latest'
               }
        }
    }
        
        stage('Deploy'){
            steps {
                 withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubectl', namespace: '', serverUrl: '') {
                 sh 'kubectl apply -f deployement.yml'
}
                 
            }
        }
}
}
