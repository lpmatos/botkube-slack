BotKube with Slack
============

[![Open Source](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://github.com/lpmatos/botkube-slack) [![Contributors](https://img.shields.io/github/contributors/lpmatos/botkube-slack)](https://github.com/lpmatos/botkube-slack/graphs/contributors) [![MIT License](https://img.shields.io/github/license/lpmatos/botkube-slack)](https://github.com/lpmatos/botkube-slack/blob/master/LICENSE) [![Languages](https://img.shields.io/github/languages/count/lpmatos/botkube-slack)](https://github.com/lpmatos/botkube-slack) [![Top Language](https://img.shields.io/github/languages/top/lpmatos/botkube-slack)](https://github.com/lpmatos/botkube-slack) [![GitHub fork](https://img.shields.io/github/forks/lpmatos/botkube-slack?style=social)](https://github.com/lpmatos/botkube-slack/network/members) [![GitHub stars](https://img.shields.io/github/stars/lpmatos/botkube-slack?style=social)](https://github.com/lpmatos/botkube-slack/stargazers) [![GitHub watchers](https://img.shields.io/github/watchers/lpmatos/botkube-slack?style=social)](https://github.com/lpmatos/botkube-slack/watchers)

<p align="center">
  <img src="/docs/images/BOTKUBE-LOGO.jpg" width="500px" float="center"/>
</p>
<h1 align="center">💻 BotKube Integration with Slack 💻</h1>
<p align="center">
  <strong>Basic project used in your process to creat a Slack Integration with BotKube in your Cluster</strong>
</p>

## Copyright (c)

Lucca Pessoa da Silva Matos (c) 2020 - **GitHub Repository**

## Getting Started

To use this repository you need to make a **git clone**:

```bash
git clone --depth 1 https://github.com/lpmatos/botkube-slack.git -b master
```

This will give access on your **local machine** to this project.

Pull requests are welcome. If you'd like to support the work and buy me a ☕, I greatly appreciate it!

<a href="https://www.buymeacoffee.com/EatdMck" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 100px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## Pre-Requisites

**Tools**
:---:
**Helm**
**Kubectl**
**Shell Script**

- Kubernetes 1.14 or higher is recommended.
- For Kubernetes < 1.14, BotKube won’t be able to monitor Ingress resources.

## Description

To run this automation (Botkube + Slack) you can be configure all your credentials in the .env file and run the container using the docker-compose.

## Architecture

![Alt text](docs/images/BOTKUBE-ARQUITETURA.jpg?raw=true "BotKube Architecture")

## Containers

It's set at [docker-compose.yml](docker-compose.yml) the **Containers** required for application execution.

**Container** | **Description** | **Dockerfile**
:---: | :---: | :---:
botkube-slack | **Alpine Container with Helm and Kubectl to run BotKube configuration with Slack** | [Dockerfile](app/Dockerfile)

## Usage

![BotKube Usage](docs/gifs/BOTKUBE-USAGE.gif)

## Environment variables

**Name**  |  **Description**
:---:  |  :---:
**HELM_NAME**  |  Helm Chart Resource Name
**HELM_NAMESPACE**  |  Helm Namespace that this Chart will be created
**BOTKUBE_ENABLE_SLACK**  |  If you want enable Skack
**BOTKUBE_SLACK_CHANNEL**  |  Is the channel name where @BotKube is added
**BOTKUBE_SLACK_TOKEN**  |  Is the Token you received after installing BotKube app to your Slack workspace
**BOTKUBE_CLUSTER_NAME**  |  Is the cluster name set in the incoming messages
**BOTKUBE_ALLOW_KUBECTL**  |  If you want enable Kubectl Commands in BotKube
**BOTKUBE_CONFIG_WATCHER**  |  Set true to enable config watcher
**BOTKUBE_UPGRADE_NOTIFIER**  |  Set false to disable upgrade notification
**BOTKUBE_IMAGE_REPOSITORY**  |  Helm Chart BotKube Repository
**BOTKUBE_IMAGE_TAG**  |  Helm Chart BotKube Tag
**CREATE_NAMESPACE**  | If YES the script create a namespace in the Cluster

## Development with Docker

Steps to build the Docker image.

### Build

```bash
docker image build -t <IMAGE_NAME> -f <PATH_DOCKERFILE> <PATH_CONTEXT_DOCKERFILE>
docker image build -t <IMAGE_NAME> . (This context)
```

### Run

Steps to run the container.

* **Linux** running:

```bash
docker container run -d -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME> <COMMAND>
docker container run -it --rm --name <CONTAINER_NAME> -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME> <COMMAND>
```

* **Windows** running:

```
winpty docker.exe container run -it --rm <IMAGE_NAME> <COMMAND>
```

For more information, access the [Docker](https://docs.docker.com/)

## Development with Docker Compose

Steps to run this integration with docker-compose.

```bash
docker-compose up --build
```

Steps to down all services deployed by docker-compose.

```bash
docker-compose down
```

## Kubectl

Kubectl is a command line tool for controlling Kubernetes clusters. kubectl looks for a file named config in the $HOME/.kube directory.

For more information, access the [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/). In this [Project](/docs/annotations/kubectl.md) we have a list of usually commands used to get some informations about the Cluster and your resources with kubectl.

## Built with

- [Helm](https://helm.sh/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Shell Script](https://devdocs.io/bash/)
- [Docker](https://docs.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## How to contribute

1. Make a **Fork**.

2. Follow the project organization.

3. Add the file to the appropriate level folder - If the folder does not exist, create according to the standard.

4. Make the **Commit**.

5. Open a **Pull Request**.

6. Wait for your pull request to be accepted.. 🚀

Remember: There is no bad code, there are different views/versions of solving the same problem. 😊

## Add to git and push

You must send the project to your GitHub after the modifications

```bash
git add -f .
git commit -m "Added - Fixing somethings"
git push origin master
```

## Contacts

Hey!! If you like this project or if you find some bugs feel free to contact me in my channels:

* **Email**: luccapsm@gmail.com
* **Linkedin**: www.linkedin.com/in/lucca-pessoa-4abb71138/

[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/lucca.pessoa.9)
[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/lpmatos)

## Versioning

- [CHANGELOG](CHANGELOG.md)

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## Contributors ✨

<table>
  <tr>
    <td align="center"><a href="https://github.com/lpmatos"><img src="https://avatars2.githubusercontent.com/u/58797390?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Lucca Pessoa</b></sub></a><br /><a href="https://github.com/lpmatos/botkube-slack/commits?author=lpmatos" title="Code">💻</a></a></td>
  <tr>
</table>

## Autor

<table>
  <tr>
    <td align="center"><a href="https://github.com/lpmatos"><img src="https://avatars2.githubusercontent.com/u/58797390?s=400&v=4" width="100px;" alt=""/><br /><sub><b>Lucca Pessoa</b></sub></a><br /><a href="https://github.com/lpmatos/botkube-slack/commits?author=lpmatos" title="Code">💻</a> <a href="#lpmatos" title="Design">🎨</a></td>
  <tr>
</table>

## Project Status

* ✔️ In production
