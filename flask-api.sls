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
        
api-requirenment-install:
    cmd.wait:
        - name: pip3 install -r requirements.txt
        - cwd: /home/api/api-source
        - watch:
            - git: api-source

api-run:
    cmd.wait:
        - name: python3 api.py
        - cwd: /home/api/api-source
        - whatch:
            - git: api-source