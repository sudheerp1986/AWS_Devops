timestamps {

node () {

	stage ('SCM - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'awscodecommit', url: 'https://git-codecommit.us-west-2.amazonaws.com/v1/repos/project']]]) 
	}
	stage ('build - Build') {
 	sh """ 
 		mvn clean install test package
 		""" 
	}
	stage ('Publish - Build') {
 			// Shell build step
sh """ 
docker build -t project1 .
docker tag project1:latest public.ecr.aws/n3p8x4e4/project1:latest
docker push public.ecr.aws/n3p8x4e4/project1:latest 
 """ 
	}
}
}