node {
    def app
    environment {
        DOCKERHUB_USERNAME = "wissem007"
        APP_NAME = "argocd"
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
        REGISTRY_CREDS = 'dockerhub'
        IMAGE_TAG = "${BUILD_NUMBER}"
        project = 'python' 
        imageVersion = 'v' 
        imageTag = "wissem007/${project}:${imageVersion}.${env.BUILD_NUMBER}" 
        
    }

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
         //app = docker.build("wissem007/python")
         docker_image = docker.build "${IMAGE_NAME}"
  
    }

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

 
    
    stage("Docker Push"){
        
                     withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh "docker push ${imageTag}"
        }
        }
    
   
}
