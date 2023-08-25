pipeline {
    agent { 
	docker{
		image 'instrumentisto/flutter'
		args '-u root --privileged'
	    }
	}
    stages {
	stage('flutter doctor') {
            steps {
                sh '''
		    flutter doctor -v
		'''
            }
        }
	stage('dependencies') {
            steps {
                sh '''
		    flutter pub get
		'''
            }
        }
	stage('test') {
            steps {
                sh '''
		    flutter test
		'''
            }
        }
        stage('Build') {
            steps {
                sh '''
                    flutter build apk 
		'''
            }
        }
	stage('Firebase Distribution') {
	    steps {
		node {
		    sh '''
      			firebase appdistribution:distribute build\app\outputs\flutter-apk\app-release.apk --app 1:205437649078:android:46c944aac773f384c96617 --groups medical-App-Group
	 	    '''
		}
	    }
	}
	stage('Clean') {
	    steps {
		sh '''
  		    flutter clean
  		'''
	    }
	}
    }
}
