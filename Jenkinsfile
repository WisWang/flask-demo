node {

    git url: 'https://github.com/WisWang/flask-demo', branch: 'master'
    def rtServer = Artifactory.server "wis"
    def rtDocker = Artifactory.docker server: rtServer
    def buildInfo = Artifactory.newBuildInfo()

      stage('docker image build') {
        buildInfo.env.capture = true
        println('starting build '+env.BUILD_NUMBER)
        def tagName='wis.com/frog/flask-demo:'+env.BUILD_NUMBER
        sh 'pwd'
        sh 'ls -al'
        sh 'cat Dockerfile'
        sh ""
        docker.build(tagName)
        artDocker.push(tagName, 'frog', buildInfo)
        def buildInfo = rtDocker.push tagName, 'frog'
        artServer.publishBuildInfo(buildInfo)
        println('Retagging Image')

        sh "docker build ok"
      }
      stage('deploy to  production') {
      	sh "sudo ansible-play demo.yml -e "
        sh "docker build ok"
      }


}
