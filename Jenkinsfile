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
                script {
                    
                    git branch: 'main', credentialsId: 'docker', url: "${GIT_REPO}"

                }
           
            }
        }
        stage {
            script {
                sh '''
                    # Verificar se o diretório /var/www/html existe
                        if [ ! -d /var/www/html ]; then
                            echo "O diretório /var/www/html não existe. Criando o diretório."
                            sudo mkdir -p /var/www/html
                        fi
t
                '''
            }
        }
        
        stage("Deploy to Apache") {
            steps {
               sh "ls -l /var/www/htm"
               sh "cp . ${env.APACHE_PATH}/index.html"
               sh " systemctl restart apache2"

            }
        }
    }
}