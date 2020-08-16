pipeline {
    
    agent {
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
        
        stage("codecoverage") {
            steps {
                
                sh './gradlew build jacocoTestReport'
                publishHTML([allowMissing: false, 
                            alwaysLinkToLastBuild: false, 
                            keepAll: false, 
                            reportDir: 'build/reports/jacoco/test/html', 
                            reportFiles: 'index.html', 
                            reportName: 'Jacaco Test report', 
                            reportTitles: 'Test Report'])
                sh './gradlew test jacocoTestReport'
                
            }
            
            
        }
   }

}