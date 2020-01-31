# -*- coding: utf-8 -*-
# vim: ft=yaml

{%- from "pritunl/map.jinja" import server with context %}

pritunl_repository:
  pkgrepo.managed:
    - humanname: Pritunl
    - name: deb http://repo.pritunl.com/stable/apt {{ grains['oscodename'] }} main
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/pritunl.list
    - gpgcheck: 1
    - keyid: 7568D9BB55FF9E5287D586017AE645C0CF8E292A
    - keyserver: keyserver.ubuntu.com

pritunl_packages:
  pkg.installed:
  - names: {{ server.pkgs }}
  - require:
     - pritunl_repository

/etc/pritunl.conf:
  file.managed:
  - source: salt://pritunl/files/pritunl.conf
  - template: jinja
  - mode: 640
  - group: root
  - require:
    - pkg: pritunl_packages

pritunl_service:
  service.running:
  - enable: true
  - name: {{ server.service }}
  - watch:
    - file: /etc/pritunl.conf

{% if not server.redirect %}
pritunl set no redirect port:
  cmd.run:
    - name: pritunl app.server_port {{ server.bind.port }}
    - onchanges:
      - file: /etc/pritunl.conf

pritunl disable redirection:
  cmd.run:
    - name: pritunl set app.redirect_server false
    - onchanges:
      - file: /etc/pritunl.conf
{% endif %}
