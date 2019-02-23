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
        docker.build(tagName)
        rtDocker.push(tagName, 'frog', buildInfo)
        rtServer.publishBuildInfo(buildInfo)
        println('Retagging Image')
        sh "echo docker build ok"
      }
      stage('deploy to  production') {
      	sh "sudo ansible-playbook demo.yml -e tagName=$tagName"
        sh "echo docker build ok"
      }


}
