pipeline{
  agent any

  parameter{
    choice(name: 'CHOICE', choices: ['', 'APPLY', 'DESTROY'], description: 'Pick something')
  }

  stages{
    stage('terraform init'){
      when{
        expression{
          params.name == 'APPLY'
        }
      }
      steps{
        sh '''
        terraform init 
        terraform apply -auto-approve
        cd Mysql
        terraform init 
        terraform apply -auto-approve
        cd ..
        cd Redis
        terraform init 
        terraform apply -auto-approve
        '''
      }
    }
  }
}