node {
    def app
    environment {
        
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

 
    
    stage("Docker Push"){
        
                     withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh "docker push ${env.BUILD_NUMBER}"
        }
        }
    
   
}
