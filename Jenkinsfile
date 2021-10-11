pipeline {
    agent {
        docker { image 'python' }
    }
    
    stages {
        stage('Preparation') {
            steps {
                sh 'curl -fsSL https://deb.nodesource.com/setup_14.x | bash -'
                sh 'apt-get install -y nodejs'
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run API Tests') {
            steps {
                sh 'cd backend && robot -d ./logs tests'
            }
        }
        stage('Run UI Tests') {
            steps {
                sh 'cd frontend && robot -d ./logs tests'
            }
        }
    }
}
