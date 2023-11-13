pipeline {
    agent any
    

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh '/usr/bin/terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh '/usr/bin/terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh '/usr/bin/terraform apply -auto-approve tfplan'
                }
            }
        }
        
    }
    post {
        always {
            cleanWs()
        }
    }
}
