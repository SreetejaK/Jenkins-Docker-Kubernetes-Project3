pipeline {
	agent any
	
	  tools
    {
       maven "MAVEN_HOME"
    }
environment {
registry = "sreeteja07/jibmvnpluginpoc"
registryCredential = 'dockerhub_id'
dockerImage = ''
}
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'main', url: 'https://github.com/SreetejaK/Jenkins-Docker-Kubernetes-Project3.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                /*sh 'mvn package'*/
		   withDockerRegistry([ credentialsId: "dockerhub_id", url: "" ]){
		   sh 'mvn compile jib:build'
		   }
	   }
          }
        }
}
