pipeline {
    agent any 

    stages {
        stage('Checkout') {
            steps {
                checkout scm  // Checks out the source code from the repository
            }
        }

        stage('Build and Start Services') {
            steps {
                script {
                    // Use docker-compose to build services defined in docker-compose.yml
                    sh 'docker build -t dchong/docker-react -f Dockerfile.dev .'
                    // Start services
                    sh 'docker run -r CI=true dchong/docker-react npm run test'
                }
            }
        }

        // stage('Test') {
        //     steps {
        //         // Assume a simple curl command to ensure the application is running
        //         // Replace with your actual test commands
        //         sh 'curl http://localhost:8080'
        //     }
        // }
    }

    post {
        always {
            // Cleanup: Stop and remove containers, networks, images, and volumes
            sh 'docker-compose down'
        }
    }
}