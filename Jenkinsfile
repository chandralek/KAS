pipeline{
  agent any

  parameter{
    choice(name: 'CHOICE', choices: ['', 'VPC', 'Destroy'], description: 'Pick something')
  }

  stages{
    stage('terraform init'){
      when{
        expression{
          params.name == 'VPC'
        }
      }
      steps{
        sh '''
        terraform init 
        terraform apply -auto-approve
        '''
      }
    }
  }
}