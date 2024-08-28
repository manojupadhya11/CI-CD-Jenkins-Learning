pipeline {
    agent{
        label "Jenkins"
    }

    stages {
        stage('Download') {
            steps {
                git branch: 'main', url: 'https://github.com/manojupadhya11/Python-Basic-App.git'
                echo "Code downloaded"
            }
        }
        stage('Test') {
            steps {
                sh "yum install python3-pip -y"
                sh "pip3 install -r requirements.txt"
                sh "pytest"
                echo "Code have been testes succesfully!"
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t mywebimg ."                
            }
        }
        stage ('Deployment') {
            steps {
                sh "docker rm -f mywebos"
                sh "docker run -dit --name mywebos -p 81:80 mywebimg"
            }
        }

    }
}
