
node (''){


  /*def img= "maven:3.6.0-jdk-8"
  checkout scm
  sh 'git clean -fxd'
  
  docker.image("${img}").pull()
  docker.image("${img}").inside("") {
  
    sh "mvn install"
  
  }
  */
  
  //imgName="hashicorp/terraform:0.10.8"
  //docker.image("${imgName}").pull()
  //docker.image("${imgName}").inside ("-v ${pwd}:/terraform -v /tmp:/tmp -u root"){
    
    sh "terraform plan"
    sh "terraform apply"
    
  //}
  
}
