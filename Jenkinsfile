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
    }
}
