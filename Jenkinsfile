pipeline {
    agent {
        label "linux-agent"
        
    }
    environment {
            GIT_REPO = "https://github.com/jpablolima/cicdnew.git"
            APACHE_PATH =  "/var/www/html"
        }

   
    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', credentialsId: 'docker', url: "${GIT_REPO}"
           
            }
        }
        
        stage("Deploy to Apache") {
            steps {
               sh "ls -la"
               sh "cp index.html ${GIT_PATH}/index.html"
               sh "sudo systemctl restart apache2"

            }
        }
    }
}