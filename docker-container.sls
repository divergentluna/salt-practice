api-user:
    user.present:
        - name: user
        - home: /home/api

git-client-package:
    pkg.installed:
        - name: git

api-source:
    git.latest:
        - name: https://github.com/divergentluna/SumAPI-Flask.git
        - rev: master
        - target: /home/api/api-source
        - require: 
            - git-client-package

docker:
    pkg.installed: []

