node {

    git url: 'https://github.com/WisWang/flask-demo', branch: 'master'
    def rtServer = Artifactory.server "wis"
    def rtDocker = Artifactory.docker server: rtServer
    def buildInfo = Artifactory.newBuildInfo()
    def tagName='wis.com/frog/flask-demo:'+env.BUILD_NUMBER

    stage('Artifacts build') {
        buildInfo.env.capture = true
        buildInfo.env.collect()
        println('starting build '+env.BUILD_NUMBER)
        sh 'pwd'
        sh 'ls -al'
        sh 'cat Dockerfile'
        docker.build(tagName)
        rtDocker.addProperty("project-name", "docker1").addProperty("status", "stable")
        rtDocker.push(tagName, 'frog', buildInfo)
        rtServer.publishBuildInfo(buildInfo)
    }
    stage('Build runtime') {
        sh "echo Build runtime"
    }
    stage('Verify runtime') {
        sh "echo Verify runtime"
    }
    stage('App runtime') {
        sh "sudo ansible-playbook demo.yml -e tagName=$tagName"
        sh "echo docker build ok"
    }


}
