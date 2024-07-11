pipeline {
    agent {
        label "jenkins_wsl"
    }
    environment {
        GIT_REPO = "https://github.com/jpablolima/cicdnew.git"
        APACHE_PATH = "/var/www/html"
        DOCKER_IMAGE = "webapp/httpd:latest"
        DOCKER_CONTAINER_NAME = "webapp"
    }
    stages {
        stage("Check Docker Installation") {
            steps {
                script {
                    try {
                        sh "docker --version"
                        echo "Docker is installed"
                    } catch (Exception e) {
                        error "Docker is not installed"
                    }
                }
            }
        }
        stage("Checkout") {
            steps {
                git branch: 'main', credentialsId: 'docker', url: "${GIT_REPO}"
            }
        }
        stage("Linting") {
            steps {
                script {
                    sh "npm -v"
                    sh "npm install  -g htmlhint"
                }
            }
        }
        stage("Lint HTML"){
            steps{
                script {
                    sh 'htmlhint "**/*.html" '
                }
            }
        }
        stage("Build Docker Image") {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        stage("Stop and Remove Existing Container") {
            steps {
                script {
                    sh """
                        if [ \$(docker ps -aq -f name=${DOCKER_CONTAINER_NAME}) ]; then
                            docker stop ${DOCKER_CONTAINER_NAME} || true
                            docker rm ${DOCKER_CONTAINER_NAME} || true
                        fi
                    """
                }
            }
        }
        stage("Run Container") {
            steps {
                script {
                    sh "docker run -d --name ${DOCKER_CONTAINER_NAME} -p 80:80 ${DOCKER_IMAGE}"
                }
            }
        }
        stage("Remove Docker Image") {
            steps {
                script {
                    sh "docker rmi ${DOCKER_IMAGE} || true"
                }
            }
        }
    }
    post {
        success {
            echo "Pipeline executed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
        always {
            cleanWs()
        }
    }
}
