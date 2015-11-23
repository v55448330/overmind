# Overmind

__Overmind__ is a integrated centralized dockerize continuous delivery server which contains some useful tools and services to help your scrum team start up faster.

Services in Overmind:

| Service            | Port | Note |
| -------------------|------|------|
|[Wekan](https://hub.docker.com/r/mquandalle/wekan/)|2000|An open-source kanban|
|[Gogs](https://registry.hub.docker.com/u/codeskyblue/docker-gogs/)|3000|A painless self-hosted Git service.|
|[Docker-registry](https://registry.hub.docker.com/_/registry/)|5000|Containerized docker registry|
|[Jenkins](https://registry.hub.docker.com/_/jenkins/)|8080|Official Jenkins Docker image|
|[Rancher](https://hub.docker.com/r/rancher/server/)|9000|Rancher Server Container|
|[cAdvisor](https://hub.docker.com/r/google/cadvisor-canary/)|9090|Analyzes resource usage and performance characteristics of running containers.|


# Notes:

1. Services are accessed by `http://<your-ip>:<port>`

2. All data were saved in host `/var/overmind_data`.

3. Please ensure all docker images are completely pulled.

4. Please ensure all required ports are accessible.

5. You have to setup all services by yourself.

## License

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
