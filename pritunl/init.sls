{%- if pillar.pritunl is defined %}
include:
{%- if pillar.pritunl.server is defined %}
- pritunl.server
{%- endif %}

{%- if pillar.pritunl.cli is defined %}
- pritunl.setup
{%- endif %}

{%- endif %}
