include:
    - docker-container

supervisor:
    pkg.installed:
        - require:
            - sls: docker-container
    service.running:
        - watch:
            - file: /etc/supervisor/conf.d/docker-service.conf    

/etc/supervisor/conf.d/docker-service.conf:
    file.managed:
        - source: salt://api-service/supervisor.conf
        - require:
            - pkg: supervisor