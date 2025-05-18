pipeline {
    agent { label 'private-node' }

    stages {
        stage('GitHub Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHub', url: 'git@github.com:muhamad-mamoun/secure-website-cicd-infra.git']])
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('Website') {
                    script {
                        sh "docker build . -t ${ env.IMAGE_NAME }:latest"
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DockerHub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh """
                            docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                            docker push ${ env.IMAGE_NAME }:latest
                            docker logout
                           """
                    }
            }
        }
        
        stage('Deploy The New Image') {
            steps {
                script {
                    sh """
                        docker rm -f ${ env.CONTAINER_NAME } || true
                        docker run -d -p 80:80 --name ${ env.CONTAINER_NAME } ${ env.IMAGE_NAME }:latest
                       """
                }
            }
        }
    }
}