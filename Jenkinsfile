pipeline {

    agent{
        label "my-gradle"
    }

    stages {
        stage("pullfromscm") {
            steps {
                 git 'https://github.com/apulijala/demo.git'
            }
        }
        
        stage("compilejavacode") {
            steps {
                sh './gradlew compileJava'
            }
            
        }
        
        stage("testjavacode") {
            steps {
                sh './gradlew test'
            }
            
        }
        
   }

}