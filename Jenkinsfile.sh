pipeline {
    agent any
    environment {
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
        stage("Test") {
            steps {
                echo "Testing stage"
                echo "Unit tests"
                echo "Integration tests"
            }
        }
        stage("Code Quality Check") {
            steps {
                echo "Check the quality of the code"
            }
        }
        stage("Deploy") {
            steps {
                echo "Deply application to: ${TESTING_ENVIRONMENT}"
            }
        }
        stage("Approval") {
            steps {
                echo "Pausing for approval - 10 seconds"
                sleep 10
                echo "Approved"
            }
        }
        stage("Deploy to Production") {
            steps {
                echo "Deploy code to production environment: ${PRODUCTION_ENVIRONMENT}"
            }
        }
    }
}