pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
        PORT = '3000'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'trunk', url: 'https://github.com/ServeRest/ServeRest.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Install Dependencies 2') {
            steps {
                bat 'npm install -g pm2'
                bat '"C:\\Windows\\system32\\config\\systemprofile\\AppData\\Roaming\\npm\\pm2.cmd" start ./src/server.js'
            }
        }

        stage('Clone Test Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/cristianoleal/service-test-serverest.git'
            }
        }

        stage('Install Python and Dependencies') {
            steps {
                // Instalar o Python e configurar a virtualenv
                bat '''
                choco install python --version=3.10.0 -y
                python -m venv venv
                venv\\Scripts\\activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                // Ativar a virtualenv e rodar os testes
                bat '''
                robot -d ./logs -i SmokeTest .\\Tests\\
                '''
            }
        }

        stage('Finish pm2') {
            steps {
                bat 'npm install -g pm2'
                bat '"C:\\Windows\\system32\\config\\systemprofile\\AppData\\Roaming\\npm\\pm2.cmd" delete app'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
