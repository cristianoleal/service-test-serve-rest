pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
        PORT = '3000'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/ServeRest/ServeRest.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build || echo "No build script defined"'
            }
        }

        stage('Start Server') {
            steps {
                sh 'nohup npm start &'
                sleep 10
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    def response = sh(
                        script: 'curl -X POST http://localhost:3000/login -H "Content-Type: application/json" -d \'{"email":"email@example.com","password":"password"}\'',
                        returnStdout: true
                    ).trim()
                    echo "Response: ${response}"
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
