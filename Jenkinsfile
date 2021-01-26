pipeline {
    agent any
	environment {
      AWS_ACCESS_KEY_ID = "${env.AWS_LIB_ACCESS_KEY_ID}"
      AWS_SECRET_ACCESS_KEY = "${env.AWS_LIB_SECRET_ACCESS_KEY}"
    }
    stages {
	 stage('Set Terraform path') {
            steps {
		dir('rds') {
		script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh 'terraform --version'
               
               }
            }
     }
         stage('Provision infrastructure') {
             
            steps {
               dir('rds') {
                sh 'terraform init'
                sh 'terraform plan -out=plan'
                sh 'terraform apply plan'
              
             
             }
         }            
     }
  }
}
