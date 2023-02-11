pipeline {
    agent any
    environment {
        PATH = "/opt/maven/apache-maven-3.8.7/bin:$PATH"
    }    
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/jitsdemo']], extensions: [], userRemoteConfigs: [[credentialsId: 'git_cred', url: 'https://github.com/pjitss/jits_k8_project_1.git']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t jitss/kubernetes .'
                }
            }
        }
        stage('Push image to hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u suresh394 -p ${dockerhubpwd}'
                        
                    }
                    sh 'docker push suresh394/kubernetes'
                }
            }
        }
        stage('Deploy to K8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'kubeconfig')
                }
            }
        }
    
    }    
}
