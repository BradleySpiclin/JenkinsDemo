pipeline {
    agent any
    environment {
        EMAIL_PATH = "bradleyspiclin@gmail.com"
        EMAIL_BODY = "Build logs attached"
        DIRECTORY_PATH = "https://github.com/BradleySpiclin/complete-ecommerce-aspnet-mvc-application.git"
        TESTING_ENVIRONMENT = "Live testing environment"
        PRODUCTION_ENVIRONMENT = "Bradley Spiclin's development environment"
    }
    stages {
        stage("Build") {
            steps {
                echo "Build started"
                echo "fetch the source code from: ${DIRECTORY_PATH}"
                echo "Building using MSBuild automation tool"
            }
        }
        stage("Unit and Integration Tests") {
            steps {
                echo "Testing stage"
                echo "Unit tests conducted using NUnit"
                echo "Integration tests conducted using SpecFlow"        
            }
            post {
                success {
                    emailext(attachLog: true, 
                    to: "${EMAIL_PATH}", 
                    subject: 'Unit and Integration Tests - Success', 
                    body: "${EMAIL_BODY}")      
                }
                failure {
                    emailext(attachLog: true, 
                    to: "${EMAIL_PATH}", 
                    subject: 'Unit and Integration Tests - Failed', 
                    body: "${EMAIL_BODY}")      
                }
            }
        }
        stage("Code Analysis") {
            steps {
                echo "Code analysis stage"
                echo "Analyzing code using ReSharper"
            }
        }
        stage("Security Scan") {
            steps {
                echo "Security scan stage"
                echo "Scanning using Microsoft Security Code Analysis"
            }
            post {
                success {
                    emailext(attachLog: true, 
                    to: "${EMAIL_PATH}", 
                    subject: 'Security Scan - Success', 
                    body: "${EMAIL_BODY}")      
                }
                failure {
                    emailext(attachLog: true, 
                    to: "${EMAIL_PATH}", 
                    subject: 'Security Scan - Failed', 
                    body: "${EMAIL_BODY}")      
                }
            }
        }
        stage("Deploy to Staging") {
            steps {
                echo "Deploying to staging slot on Azure AppService"
            }
        }
        stage("Integration Tests on Staging") {
            steps {
                echo "Integration tests on staging"
                echo "API integration tests..."
                echo "Database integration tests..."
                echo "User interface integration tests..."
            }
        }
        stage("Deploy to Production") {
            steps {
                echo "Deployed to production server on Azure AppService"
            }
        }
    }
}