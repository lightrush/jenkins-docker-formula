{%- from "jenkins-docker/map.jinja" import jenkins with context -%}

jenkins_docker_compose_dir:
  file.directory:
    - name: {{ jenkins.compose_dir }}
    - makedirs: True
    - user: {{ jenkins.puid }}
    - group: {{ jenkins.pgid }}

{% if jenkins.data_dir -%}
jenkins_docker_data_dir:
  file.directory:
    - name: {{ jenkins.data_dir }}
    - makedirs: True
    - user: {{ jenkins.puid }}
    - group: {{ jenkins.pgid }}
{% endif -%}
