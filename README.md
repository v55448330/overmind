Overmind
===========

__Overmind__ is a integrated centralized continuous delivery server vagrant file which contains some essential common useful tools and services to help a scrum team start up quickly.

Images in Overmind:

1. [TaskBoard](https://registry.hub.docker.com/u/mirweb/taskboard/)
2. [Jenkins](https://registry.hub.docker.com/_/jenkins/)
3. [Gogs](https://registry.hub.docker.com/u/codeskyblue/docker-gogs/)
4. [Docker-registry](https://registry.hub.docker.com/_/registry/)
5. [Docker-registry-ui](https://hub.docker.com/r/atcol/docker-registry-ui/)
6. [Rancher](https://registry.hub.docker.com/u/dockerboard/dockerboard/)


Quick Start
----------

1. Install [Vagrant](https://www.vagrantup.com/).

2. Clone this repository and vagrant up
	```
	git clone https://github.com/wizardbyron/overmind.git
	cd overmind
	vagrant up
	```

3. Access service by : `http://<your-ip>:<port>`

| Service            | Port |
| -------------------|------|
| TaskBoard          | 2000 |
| Gogs               | 3000 |
| Docker Registry    | 5000 |
| Docker Registry UI | 5050 |
| Rancher            | 8000 |
| Jenkins            | 8080 |


License
----------

copyright (c) 2015 All Overmind Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
