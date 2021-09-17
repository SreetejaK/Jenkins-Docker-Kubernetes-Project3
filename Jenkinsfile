pipeline {
    agent any
	tools {
		maven 'MAVEN_HOME'
	}
	
	environment {	
		registry = "suren67/jenkingkeimage"
registryCredential = 'dockerhub_id'
dockerImage = ''
		    PROJECT_ID = 'true-campus-320305'
		    CLUSTER_NAME = 'jenkink8scluster'
		    LOCATION = 'us-central1-c'
		    CREDENTIALS_ID = 'Jenkin_GCP_Cred_ID'
	}
	
    stages {
	    stage('Scm Checkout') {
		    steps {
			    checkout scm
		    }
	    }
	    
	    stage('Build') {
		    steps {
			    sh 'mvn clean package'
		    }
	    }
	    
	    stage('Test') {
		    steps {
			    echo "Testing..."
			    sh 'mvn test'
		    }
	    }
	    
	    stage('Build Docker Image') {
		    steps {
			    sh 'whoami'
			    script {
				    // myimage = docker.build("ameintu/devops:${env.BUILD_ID}")
				    //sh 'docker build -t jenkindockergke:latest .' 
                	           //sh 'docker tag samplewebapp suren67/jenkindockergke:latest'
				    dockerImage = docker.build registry + ":$BUILD_ID"
			    }
		    }
	    }
	    
	    stage("Push Docker Image") {
		    steps {
			    script {
				    /*echo "Push Docker Image"
				    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
            				sh "docker login -u ameintu -p ${dockerhub}"
				    }
				        myimage.push("${env.BUILD_ID}")*/
				    script {
            docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
                dockerImage.push("${env.BUILD_ID}")
				    
			    }
		    }
	    }
	    
	    stage('Deploy to K8s') {
		    steps{
			    /*echo "Deployment started ..."
			    sh 'ls -ltr'
			    sh 'pwd'
			    sh "sed -i 's/tagversion/${env.BUILD_ID}/g' serviceLB.yaml"
				sh "sed -i 's/tagversion/${env.BUILD_ID}/g' deployment.yaml"
			    echo "Start deployment of serviceLB.yaml"
			    step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'serviceLB.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
				echo "Start deployment of deployment.yaml"
				step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
			   */
			    sh "sed -i 's/tagversion/${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, 
		      location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
			   echo "Deployment Finished ..."
		    }
	    }
    }
}
