Overmind
===========

__Overmind__ is a integrated centralized continuous delivery server template for __containerized continous delivery__ which running in **vagrant** VM.

__Overmind__ contains some essential common useful tools and services to help a scrum team start up quickly, most of them are running as a docker container:

1. [TaskBoard](https://github.com/kiswa/TaskBoard): A Kanban-inspired app for keeping track of things that need to get done.
2. [Jenkins](https://jenkins-ci.org/): An extensible open source continuous integration server.
3. [Gogs](http://gogs.io/): A self-hosted Git service written in Go.
4. [Docker-registry](https://registry.hub.docker.com/_/registry/): Containerized docker registry.
5. [Dockerboard](https://registry.hub.docker.com/u/dockerboard/dockerboard/): Simple dashboards, visualizations, managements for your dockers.

Requirements
----------

[Vagrant](https://www.vagrantup.com/): Create and configure lightweight, reproducible, and portable development environments

[Node.js](https://nodejs.org/): Node.js® is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.


Quick Start
----------
Clone this 	repository and run `start.sh`:

```
git clone https://github.com/wizardbyron/overmind.git
cd overmind
./start.sh
```
Then you can see a message like:

```
Overmind is running on http://192.168.0.2:8000/
```

Open the URL in your browser. Then you can see the overmind homepage.

Enjoy it!

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
