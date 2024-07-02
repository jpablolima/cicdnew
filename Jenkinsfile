pipeline {
    agent {
        label "linux-agent"
    }
   
    stages {
        stage("Checkout") {
            steps {
                git "https://github.com/jpablolima/cicdnew.git"
               
            }
        }
        stage("Build") {
            steps {
               echo "Concluido"

            }
        }
    }
}