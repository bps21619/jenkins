pipeline {
    agent any

    stages {

        stage('Docker build'){
            steps{
                script{
                    docker.build('jenkins/demo')
                }
            }
        }

        stage('Docker push'){
            steps{
                script{
                    docker.withRegistry('https://081184234118.dkr.ecr.ap-south-1.amazonaws.com/test', 'ecr:ap-south-1:bps21619@gmail.com') {
                        docker.image('jenkins/demo').push("$currentBuild.number")
                    }
                }
            }
        }
    }
}
