pipeline {
    agent {
         label "jenkins_wsl"
    }

    stages {
        stage ("Check Docker") {
            steps {
                script {
                    // Verificando a instalação do Docker
                    try {
                        sh "docker --version"
                    } catch (Exception e) {
                        error "Docker não está instalado no Servidor"
                    }
                    try {
                        sh "docker info"
                    } catch(Exception e) {
                        error "O daemor Docker não está em execução no servidor"
                    }
                }   
            }
        }
        stage('Deploy') {
            steps {
                script {
                    dir("/mnt/f/devops/cicd") {
                        sh 'docker-compose down'
                        sh 'docker-compose up -d'
                    }
                }
            }
        }
        stage("Verify Deployment") {
            steps {
                script {
                    sh 'docker ps'
                }
            }
        }
    }
}