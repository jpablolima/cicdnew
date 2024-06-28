pipeline {
    agent {
        label "linux"
    }
    stages {
        stage("build") {
            steps {
                sh """"
                    docker build -t hello_world .
                """
            }
        }
        stage("run") {
            steps {
                sh """
                    docker run --rm hello_world
                """

            }
        }
    }
}