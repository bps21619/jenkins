pipeline {
    agent any

    stages {

        stage('Docker build'){
            steps{
                script{
                    docker.build('jenkins/')
                }
            }
        }

        stage('Docker push'){
            steps{
                script{
                    docker.withRegistry('https://081184234118.dkr.ecr.ap-south-1.amazonaws.com/test') {
                        docker.image('jenkins/').push("$currentBuild.number")
                    }
                }
            }
        }
    }
}
