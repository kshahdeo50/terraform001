pipeline {
    agent any 
    parameters {
        choice(name: 'INPUT', choices: ['CREATE','DESTROY'])
    }
    stages {
        
       /*Stage1----*/
        
        stage('teraaform init') { 
            steps {
                script{
               withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                   if  (params.INPUT == "CREATE" ){
                sh 'yum install -y yum-utils'
                sh 'yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo'
                sh 'yum -y install terraform'
                sh 'terraform init'
            }
           }
          }
         }
        }    
        
        
        /*Stage 2----*/
        stage('Wait for user to input text?') {
           steps {
               script{
                   if  (params.INPUT == "CREATE" ){
             def userInput = input(id: 'userInput', message: 'Merge to?',
             parameters: [[$class: 'ChoiceParameterDefinition', defaultValue: 'strDef', 
                description:'Groups', name:'Group Choices', choices: "QA\nBilling\nReadOnly\nAdministrator\nMaster"]
             ])

            println(userInput);
             }
            }
           }
          }
        
        /*Stage 3---*/
        
        stage('User Name'){
            steps{
            script {
                if  (params.INPUT == "CREATE" ){
                def userInput2 = input(
                 id: 'userInput2', message: 'Enter User Name', 
                 parameters: [
                 [$class: 'TextParameterDefinition', defaultValue: 'None', description: 'Path of config file',name: 'User_Name']
                ])
               }
              }
             }
            }
        
        /*Stage 4---*/
        
            stage('Plan'){
                steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    if  (params.INPUT == "CREATE" ){
                    sh 'terraform plan'
               }
              }
             }
            }
        
        /*Stage 5*/
           stage('Apply'){
                steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    if  (params.INPUT == "CREATE" ){
                    sh 'terraform apply -auto-approve'
                }
               }
              }
             }
        
        /*stage 6*/
        stage('Destroy'){
                steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    if  (params.INPUT == "DESTROY" ){
                    sh 'terraform destroy -auto-approve'
                }
               }
              }
             }
        
        
        
        
    }
}
