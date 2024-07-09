pipeline {
    agent {
        label "jenkins_wsl"
        
    }
    environment {
            GIT_REPO = "https://github.com/jpablolima/cicdnew.git"
            APACHE_PATH =  "/var/www/html"
            DOCKER_IMAGE = "webapp/httpd:latest"
        }
    stages {
        stage("Checkout") {
            steps {
                script {
                    
                    git branch: 'main', credentialsId: 'docker', url: "${GIT_REPO}"
                }
            }
        }
        stage ("Check Docker Installation"){
            steps {
                script {
                    try {
                        sh "docker --version"
                        echo " Docker is installed"
                    } catch (Exception e ) {
                        error "Docker is nor installed"
                    }
                     
            }
        }

    }
        stage("Build Docker Image") {
            steps {
                script {
                        sh """
                            docker build -t $DOCKER_IMAGE .
                        """
                }
            }
        }
        stage("Run Container") {
            steps {
                script {
                    sh "docker run -d -p 80:80 $DOCKER_IMAGE"
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