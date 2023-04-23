pipeline {
    agent any
    environment {
        EMAIL_PATH = "bradleyspiclin@gmail.com"
        DIRECTORY_PATH = "https://github.com/BradleySpiclin/complete-ecommerce-aspnet-mvc-application.git"
        TESTING_ENVIRONMENT = "Live testing environment"
        PRODUCTION_ENVIRONMENT = "Bradley Spiclin's development environment"
    }
    stages {
        stage("Build") {
            steps {
                echo "Build started"
                echo "fetch the source code from: ${DIRECTORY_PATH}"
                echo "compile the code and generate any necessary artifacts"
            }
        }
        stage("Unit and Integration Tests") {
            steps {
                echo "Testing stage"
                echo "Unit tests"
                echo "Integration tests"
            }
            post {
                always {
                    to: "${EMAIL_PATH}",
                    subject: "Test Email",
                    body: "Test",
                    emailext attachLog: true
                }
            }
            // post {
            //     success {
            //         mail to: "${EMAIL_PATH}",
            //         subject: "Unit and Integration Tests - Success",
            //         body: "Email sent from Jenkins"
            //     }
            // }
        }
        stage("Code Analysis") {
            steps {
                echo "Check the quality of the code"
            }
        }
        stage("Security Scan") {
            steps {
                echo "Deply application to: ${TESTING_ENVIRONMENT}"
            }
        }
        stage("Deploy to Staging") {
            steps {
                echo "Pausing for approval - 10 seconds"
            }
        }
        stage("Integration Tests on Staging") {
            steps {
                echo "Integration tests on staging"
            }
        }
        stage("Deploy to Production") {
            steps {
                echo "Deploy code to production environment: ${PRODUCTION_ENVIRONMENT}"
            }
        }
    }
}