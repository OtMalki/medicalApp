pipeline {
    agent { 
	docker{
		file 'Dockerfile'
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
	stage('AppCenter Distribution') {
  		steps {
    			appCenter {
     				apiToken: '411767f5695a915073112d6fa6364ad60d1f7a73',
      				ownerName: 'MALKIOT',
      				appName: 'medicalApp',
      				pathToApp: 'build/app/outputs/flutter-apk/app-release.apk',
      				distributionGroups: 'medicalApp-Distribution'
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
