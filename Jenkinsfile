
node (''){
  
 //def img= "maven:3.6.0-jdk-8"
 checkout scm
 sh 'git clean -fxd'

	 withCredentials([file(credentialsId: "pkey", variable: 'key')]) {

	  sh 'cat ${key} > private.pem'
          sh 'chmod 400 private.pem'
	  sh "cat private.pem"	 
	  sh "terraform init"
	  sh "terraform plan"
	  sh "terraform apply -auto-approve"

	}
}
