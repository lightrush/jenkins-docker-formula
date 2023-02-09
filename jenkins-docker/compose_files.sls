{%- from "jenkins-docker/map.jinja" import jenkins with context -%}

jenkins_docker_compose_file_installed:
  file.managed:
    - name: {{ jenkins.compose_dir }}/docker-compose.yml
    - source: salt://jenkins-docker/files/docker-compose.yml
    - template: jinja

jenkins_docker_dockerfile_installed:
  file.managed:
    - name: {{ jenkins.compose_dir }}/Dockerfile
    - source: salt://jenkins-docker/files/Dockerfile
