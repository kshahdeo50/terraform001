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
        }
        
        
        
        stage('Wait for user to input text?') {
           steps {
               script{
             def userInput = input(id: 'userInput', message: 'Merge to?',
             parameters: [[$class: 'ChoiceParameterDefinition', defaultValue: 'strDef', 
                description:'Groups', name:'Group Choices', choices: "QA\nBilling\nReadOnly\nAdministrator\nMaster"]
             ])

            println(userInput);
    }
           }

}
        stage('User Name'){
            steps{
            script {
                def userInput2 = input(
                 id: 'userInput2', message: 'Enter path of test reports:?', 
                 parameters: [
                 [$class: 'TextParameterDefinition', defaultValue: 'None', description: 'Path of config file',name: 'User_Name']
                ])
                
                
                sed -i "s#Billing#${userInput}#g" variables.tf
                sed -i "s#siba#${User_Name}#g" variables.tf
            }
                
                
            }
        }
        
        
        
            stage('Plan'){
                steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'terraform plan'
                }
               }
              }
       stage('Apply'){
                steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'terraform apply -auto-approve'
                }
               }
              }
    
    
    }
}
