pipeline {
    agent any 
    stages {
        stage('teraaform init') { 
            steps {
               withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh 'yum install -y yum-utils'
                sh 'yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo'
                sh 'yum -y install terraform'
                sh 'terraform init'
            }
           }
            stage('terraform plan'){
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'terraform plan'
                }
            }
        }
    }
}
