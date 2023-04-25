node {
    def app
    environment {
        DOCKERHUB_USERNAME = "wissem007"
        APP_NAME = "argocd"
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
        REGISTRY_CREDS = 'dockerHub'
        IMAGE_TAG = "${BUILD_NUMBER}"
        project = 'python' 
        imageVersion = 'v' 
        imageTag = "wissem007/${project}:${imageVersion}.${env.BUILD_NUMBER}" 
        
    }

    stage('Clone repository') {
      

        checkout scm
    }

   stage('Build image') {
  
       app = docker.build("wissem007/python")
    }

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

 
    
 stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {
            app.push("${env.BUILD_NUMBER}")
        }
    }
     stage('Trigger ManifestUpdate') {
                echo "triggering updatemanifestjob"
                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
        }
    
   
}
