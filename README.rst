
==================================
pritunl
==================================

Pritunl is a distributed enterprise vpn server built using the OpenVPN protocol.



Sample pillars
==============

Single pritunl service

.. code-block:: yaml

    pritunl:
      server:
        enabled: true
      cli:
        sso: saml_okta
        app_id: "<Okta app Id>"
        saml_url: "<Okta app url>"
        saml_issuer_url: "<Okta saml issuer url>"
        okta_token: "<Okta Token>"
        okta_mode: "push"
        saml_cert: "<Okta SAML Cert>" 

Read more
=========

* https://github.com/pritunl/pritunl

Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-pritunl/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-pritunl

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
