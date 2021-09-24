pipeline {
	agent any
	
	  tools
    {
       maven "MAVEN_HOME"
    }
environment {
registry = "sreeteja07/samplewebapp"
registryCredential = 'dockerhub_id'
dockerImage = ''
}
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/SreetejaK/CI-CD-using-Docker.git'
             
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
