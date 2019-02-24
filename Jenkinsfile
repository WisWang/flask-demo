node {

    git url: 'https://github.com/WisWang/flask-demo', branch: 'master'
    def rtServer = Artifactory.server "wis"
    def rtDocker = Artifactory.docker server: rtServer
    def buildInfo = Artifactory.newBuildInfo()
    def tagName='wis.com/frog/flask-demo:'+env.BUILD_NUMBER
    def addArtifactsProperty="curl -X PUT  -H 'Authorization: Basic YWRtaW46UHJpbm1pYzdMeGJNWHhF' 'http://wis.com/artifactory/api/storage/frog/flask-demo/"+env.BUILD_NUMBER+"?properties="

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
        sh addArtifactsProperty+"build_runtime=passed"+"'"
        sh "echo Build runtime passed"

    }
    stage('Verify runtime') {
        sh addArtifactsProperty+"verify_runtime=passed"+"'"
        sh "echo Verify runtime passed"
    }
    stage('App runtime') {
        sh "sudo ansible-playbook demo.yml -e tagName=$tagName"
        sh addArtifactsProperty+"app_runtime=passed"+"'"
        sh "echo App runtime passed"
    }


}
