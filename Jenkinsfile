pipeline {
    agent {
        label "linux-agent"
    }
   
    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', credentialsId: 'docker', url: 'https://github.com/jpablolima/cicdnew.git'
               
            }
        }
        stage("Uploud para Apache") {
            steps {
               sh "ls -la"
               sh "cp index.html /var/www/html"
               sh "sudo systemctl restart apache2"

            }
        }
    }
}