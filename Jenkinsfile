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

            println(userInput); //Use this value to branch to different logic if needed
    }
           }

}
        
        
        
        
            stage('terraform plan'){
                steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'terraform plan'
                }
               }
              }
 
    
    
    }
}
