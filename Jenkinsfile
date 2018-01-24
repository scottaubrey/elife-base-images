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
                def images = ['php_cli', 'php_fpm']
                for (int i= 0; i < images.size(); i++) {
                    def image = images.get(i);
                    actions[image] = {
                        sh "docker build -f Dockerfile.${image} -t ${image}:${commit} ."
                    }
                }
                parallel actions
            }
        },
        'elife-libraries--ci'
    )
}
