pipelineJob('transaction_service_Pipeline') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/genocem/devops_showcase_transaction_service.git')
                    }
                    branch('main')
                }
            }
            scriptPath('Jenkinsfile')
        }
    }
}
