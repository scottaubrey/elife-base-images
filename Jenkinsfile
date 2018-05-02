// see Jenkinsfile.* for the various mainline versions including pushes
elifePipeline {
    elifeOnNode(
        {
            def commit
            stage 'Checkout', {
                checkout scm
                commit = elifeGitRevision()
            }

            stage 'Build images', {
                def actions = [:]
                def images = ['php_7.0_cli', 'php_7.0_fpm', 'python_3.6', 'python_3.6_pipenv']
                for (int i= 0; i < images.size(); i++) {
                    def image = images.get(i);
                    actions[image] = {
                        sh "docker build -f Dockerfile.${image} -t elifesciences/${image}:${commit} ."
                    }
                }
                parallel actions
            }
        },
        'elife-libraries--ci'
    )
}
