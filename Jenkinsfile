pipeline {
    agent any
    environment {
        // Define environment variables
        SONAR_TOKEN = credentials('Sonar_Token')
    }
    stages {
        stage('Pet clinic build using Maven') {
            steps {
                script {
                    sh "chmod +x mvnw"
                    sh "./mvnw clean install"
                }
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    def lowercaseRepoName = "testingkyaw/${JOB_NAME}".toLowerCase()
                    def lowercaseTag = "v1.${BUILD_ID}".toLowerCase()
                    def latestTag = "latest"
                    sh "docker build -t ${lowercaseRepoName}:${lowercaseTag} ."
                    sh "docker build -t ${lowercaseRepoName}:${latestTag} ."
                }
            }
        }
    stage('Push Docker image to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'Docker_Password', variable: 'Docker_Password')]) {
                    script {
                        def lowercaseRepoName = "testingkyaw/${JOB_NAME}".toLowerCase()
                        def lowercaseTag = "v1.${BUILD_ID}".toLowerCase()
                        def latestTag = "latest"
                        echo "Docker_Password" | docker login -u testingkyaw --password-stdin
                        docker push ${lowercaseRepoName}:${lowercaseTag}
                        docker push ${lowercaseRepoName}:${latestTag}
                            
                    }
                }
            }
        }
    }
}
