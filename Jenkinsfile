node {

    git url: 'https://github.com/WisWang/flask-demo', branch: 'master'
    rtServer (
        id: "Artifactory-1",
        url: "http://wis.com/artifactory",
        username: "admin",
        password: "Prinmic7LxbMXxE",
        bypassProxy: true

    )
    def rtDocker = Artifactory.docker server: rtServer
    def buildInfo = Artifactory.newBuildInfo()

      stage('docker image build') {
        buildInfo.env.collect()
        println('starting build '+env.BUILD_NUMBER)
        def tagName='wis.com/frog/flask-demo:'+env.BUILD_NUMBER
        sh 'pwd'
        sh 'ls -al'
        sh 'cat Dockerfile'
        sh ""
        docker.build(tagName)
        buildInfo.env.vars['status2'] = 'pre-test'
        artDocker.push(tagName, 'frog', buildInfo)

        artServer.publishBuildInfo(buildInfo)
        println('Retagging Image')

        sh "docker build ok"
      }
      stage('deploy to  production') {
      	sh "sudo ansible-play demo.yml -e "
        sh "docker build ok"
      }


}
