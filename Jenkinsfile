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
     				apiToken: '85f3fdbab030066b6c409a7697293a56ed091cb9',
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
