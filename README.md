Overmind
===========

__Overmind__ is a integrated centralized continuous delivery server template which contains some essential common useful tools and services to help a scrum team start up quickly. They are started up by [docker-compose](http://docs.docker.com/compose/):

Images in Overmind:

1. [TaskBoard](https://registry.hub.docker.com/u/mirweb/taskboard/)
2. [Jenkins](https://registry.hub.docker.com/_/jenkins/)
3. [Gitlab](https://registry.hub.docker.com/u/sameersbn/gitlab/)
4. [Docker-registry](https://registry.hub.docker.com/_/registry/)
5. [Dockerboard](https://registry.hub.docker.com/u/dockerboard/dockerboard/)


Quick Start
----------
1.[Vagrant](https://www.vagrantup.com/):

```
git clone https://github.com/wizardbyron/overmind.git
cd overmind/vagrant
vagrant up
```

2.[docker-compose](http://docs.docker.com/compose/):

```
git clone https://github.com/wizardbyron/overmind.git
cd overmind
docker-compose up -d
```

3.Access each service by port:

| Service         |  Port  |
| --------------- |:------:|
| TaskBorad       | 4000   |
| Docker Registry | 5000   |
| Dockerboard     | 8001   |
| Jenkins         | 8080   |
| Gitlab          | 10080  |

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
