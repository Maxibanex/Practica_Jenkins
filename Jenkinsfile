pipeline {
    agent any
    tools {
        terraform 'terraform'
    }
    

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'tokenDigitalOcean', variable: 'DO_TOKEN')]) {
                        sh "terraform init -backend-config='token=${DO_TOKEN}'"
                    }
                }
            }
        }
        stage('Terraform Validate') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'tokenDigitalOcean', variable: 'DO_TOKEN')]) {
                        sh "terraform validate -var 'do_token=${DO_TOKEN}'"
                    }
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'tokenDigitalOcean', variable: 'DO_TOKEN')]) {
                        sh "terraform plan -var 'do_token=${DO_TOKEN}'"
                    }
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'tokenDigitalOcean', variable: 'DO_TOKEN')]) {
                        sh "terraform apply -auto-approve -var 'do_token=${DO_TOKEN}'"
                    }
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'tokenDigitalOcean', variable: 'DO_TOKEN')]) {
                        sh "terraform destroy -auto-approve -var 'do_token=${DO_TOKEN}'"
                    }
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
