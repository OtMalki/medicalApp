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
	stage('AppCenter Distribution') {
  		steps {
    			appCenter 	apiToken: '8073c81042f89dd7d82741b5a45665481c21618e',
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
