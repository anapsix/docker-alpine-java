def imageName = 'alpine-java'

def buildError = null
currentBuild.result = 'SUCCESS'

try {
    node('docker') {
        stage('Code Checkout'){
            git 'https://github.com/TiVo/docker-alpine-java.git'
        }
        stage('Build Docker Images') {
            dir('8/102b14/server-jre/standard/') {
                docker.withRegistry('https://docker.tivo.com', 'docker-registry') {
                    def image = docker.build("${imageName}:8_server-jre", "--pull .")
                    image.push()
                }
            }
            dir('8/102b14/jdk/standard/') {
                docker.withRegistry('https://docker.tivo.com', 'docker-registry') {
                    def image = docker.build("${imageName}:8_jdk", "--pull .")
                    image.push()
                }
            }
        }
     }
} catch (caughtError) {
    buildError = caughtError
    if (currentBuild.result == 'SUCCESS') {
        currentBuild.result = 'FAILURE'
    }
} finally {
    (currentBuild.result != 'ABORTED') && node('master') {
        // send e-mail notifications for failed or unstable builds
        step([$class: 'Mailer',
              notifyEveryUnstableBuild: true,
              recipients: 'builds-inception@mailman.tivo.com',
              sendToIndividuals: true
             ])
    }

    // rethrow exceptions to propagate error to jenkins
    if (buildError) {
        throw buildError
    }
}
