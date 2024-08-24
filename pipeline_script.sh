pipeline {
    agent any

    environment {
        // Path to the Node.js application start command
        START_CMD = 'npm start'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Sarvagya82/ChatBot-Landing-Page-main.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Start Application and Wait') {
            steps {
                script {
                    // Start the application in the background and capture the process ID
                    def startCmd = "nohup ${START_CMD} & echo \$!"
                    def appPid = sh(script: startCmd, returnStdout: true).trim()

                    echo "Application started with PID: ${appPid}"

                    // Wait for 40 seconds
                    sleep(time: 40, unit: 'SECONDS')

                    // Terminate the application
                    sh "kill ${appPid}"
                    echo "Application stopped."
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            cleanWs()
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}

