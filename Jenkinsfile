pipeline {
	agent any
	 
   parameters {
    string(name: 'DOCKER_PUSH_USERNAME', defaultValue: 'ramanurs', description: 'Docker group username for pushing images..')
	string(name: 'PROJECT_NAME', defaultValue: 'orm', description: 'project name for creating image..')
	}
	
	stages {
          
	  
	  stage('Prepare Build image...'){
	   steps{
		script {
			IMAGE_NAME = "${params.DOCKER_PUSH_USERNAME}/${params.PROJECT_NAME}:1.0_100"
		}
		sh "echo Project Version1: ${IMAGE_NAME}"
	   }
	   
	 }
         
         stage('** Build Image **') {
	   steps{
			withCredentials([usernamePassword(credentialsId: 'ramana_dockerhub', passwordVariable: 'dockerhub_pwd', usernameVariable: 'dockerhub_user')]) {
				sh "docker login -u ${dockerhub_user} -p ${dockerhub_pwd}"
				sh 'echo logged in to docker hub, building image..'			
				sh "docker build -t ${IMAGE_NAME} ." 

				sh "echo Build docker image..${IMAGE_NAME}"
			}
		}
	}

	
	stage('** Push Image to Docker Hub **'){
           steps {
		sh "docker push ${IMAGE_NAME}"
	   }
	}
  }
}