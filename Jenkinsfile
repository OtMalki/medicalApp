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
     				apiToken: 'da219b3629a9dec63b57a4c8b5ca24cbfde4b1cc',
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
