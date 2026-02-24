pipelineJob('frontend_Pipeline') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/genocem/devops_showcase_frontend.git')
                    }
                    branch('main')
                }
            }
            scriptPath('Jenkinsfile')
        }
    }
}
