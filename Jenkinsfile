pipeline {
  agent any
  stages {
    stage('Fluffy Build') {
      agent any
      steps {
        echo 'Placeholder'
        sh 'echo "I am a ${BUZZ_NAME}"'
      }
    }

    stage('Fluffy Test') {
      steps {
        sh 'sleep 5'
        sh 'echo Success!'
      }
    }

    stage('Fluffy Deploy') {
      steps {
        echo 'Placeholder'
      }
    }

  }
  environment {
    BUZZ_NAME = 'Worker Bee'
  }
}