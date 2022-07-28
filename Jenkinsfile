// see Jenkinsfile.* for the various mainline versions including pushes
elifePipeline {
    node('containers-jenkins-plugin') {
            def commit
            stage 'Checkout', {
                checkout scm
                commit = elifeGitRevision()
            }

            stage 'Build images', {
                def actions = [:]
                def images = [
                    'php_7.1_cli', 'php_7.1_fpm',
                    'php_7.3_cli', 'php_7.3_fpm',
                    'python_3.8'
                ]
                for (int i= 0; i < images.size(); i++) {
                    def image = images.get(i);
                    actions[image] = {
                        sh "docker build -f Dockerfile.${image} -t elifesciences/${image}:${commit} --build-arg image_tag=${commit} ."
                    }
                }
                parallel actions
            }
    }
}
