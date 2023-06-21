---
layout: default
title: Style Guide
---

# Style Guide

Every open-source project has its own style guide, a set of rules on how to code for that project. <br/>
Projects launched in Pelagornis guide this style guide. <br/>


## Support
{% for nav in site.data.navigation %}
{% for navpage in nav.pages %}
- {{ navpage.title }}
{% endfor %}
{% endfor %}