pipeline {
    
    agent {
        label "my-gradle"
    }

    triggers {
         pollSCM('* * * * *')
    }

    stages {
        stage("pullfromscm") {
            steps {
                 git 'https://github.com/apulijala/demo.git'
            }
            post{
                always{
                    echo "Testing Post"
                }
                success{
                    echo "Should send the email to the relavent team."
                }
                failure{
                    echo "Should send the failure email to the relavent team."
                }
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

        stage("staticCodeCoverage") {
            steps {
                    sh './gradlew checkstyleMain'
                    publishHTML([allowMissing: false, 
                            alwaysLinkToLastBuild: false, 
                            keepAll: false, 
                            reportDir: 'build/reports/checkstyle/', 
                            reportFiles: 'main.html', 
                            reportName: 'Checkstyle Report', 
                            reportTitles: 'Test Report'])
            }
        }

        
   }

}