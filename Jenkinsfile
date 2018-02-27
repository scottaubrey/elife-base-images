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
                def images = ['php_cli', 'php_fpm', 'python']
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
