pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    environment {
        DO_TOKEN = credentials('dop_v1_efe0720653988d53d2ae497a3dcc7c80affd65abbfc6b4a0e8d0b3f25072d291')
        PRIVATE_KEY = 'C:\\Users\\STW\\Documents\\DigitalKeyPrivate'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Validate') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    sh 'terraform destroy -auto-approve'
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
