pipeline {
    agent any

    stages {

        stage('Docker build'){
            steps{
                script{
                    docker.build('Dockerfile')
                }
            }
        }

        stage('Docker push'){
            steps{
                 sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 081184234118.dkr.ecr.ap-south-1.amazonaws.com'
                 sh 'docker push 081184234118.dkr.ecr.ap-south-1.amazonaws.com/test:latest'
                    
        }
    }
}
}
