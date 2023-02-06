jenkins_docker_service_installed:
  file.managed:
    - name: /etc/systemd/system/jenkins-docker.service
    - source: salt://jenkins-docker/files/jenkins-docker.service
    - template: jinja

  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: jenkins_docker_service_installed

jenkins_docker_service_running:
  service.running:
    - name: jenkins-docker
    - enable: True
    - watch:
      - module: jenkins_docker_service_installed
