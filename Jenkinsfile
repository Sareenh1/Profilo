pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = 'kanwarsaad'
        APP_NAME = 'portfolio'
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}/${APP_NAME}"
        REGISTRY_CREDS = 'dockerhub'
    }

    stages {
        stage('cleanup workspace') {
            steps {
                script {
                    cleanWs()
                }
            }
        }
        
        stage('checkoutscm') {
            steps {
                script {
                    git credentialsId: 'github',
                        url: 'https://github.com/kanwarsaadali/porfolio.git',
                        branch: 'master'
                }
            }
        }
        
        stage('Build Docker image') {
            steps {
                script {
                    docker_image = docker.build(IMAGE_NAME)
                }
            }
        }
        
        stage('Push Docker image') {
            steps {
                script {
                    docker.withRegistry('', REGISTRY_CREDS) {
                        docker_image.push(BUILD_NUMBER)
                        docker_image.push('latest')
                    }
                }
            }
        }
        
        stage('Delete Docker images') {
            steps {
                script {
                    sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "docker rmi ${IMAGE_NAME}:latest"
                }
            }
        }
        
        stage('Updating Kubernetes deployment file') {
            steps {
                script {
                    sh """
                      cat deployment.yml
                      sed -i "s/${APP_NAME}.*/${APP_NAME}:${IMAGE_TAG}/g" deployment.yml
                      cat deployment.yml
                    """
                }
            }
        }
        
//         stage('Push the changed deployment file to git') {
//             steps {
//                 script {
//                     sh """
//                       git config --global user.name "kanwarsaad"
//                       git config --global user.email "kanwarsaad@gmail.com"
//                       git add deployment.yml
//                       git commit -m "update the deployment file"
//                     """
//                     withCredentials([gitUsernamePassword(credentialsId: 'github', gitToolName: 'Default')]) {
//                     sh "git push https://github.com/kanwarsaadali/porfolio.git master" 
// }
                    
//                 }
//             }
//         }
    }
}
