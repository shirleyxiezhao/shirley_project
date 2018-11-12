
node (''){


  def img= "maven:3.6.0-jdk-8"
  checkout scm
  sh 'git clean -fxd'
  
  docker.image("${img}").pull()
  docker.image("${img}").inside("") {
  
    sh "mvn install"
  
  }
}
