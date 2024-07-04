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
        stage("Build") {
            steps {
               echo "Concluido"

            }
        }
    }
}