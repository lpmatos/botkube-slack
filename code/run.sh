#/usr/bin/env sh

#########################################################
#### Script to create BotKube Integration with Slack ####
#########################################################

echo -e "\nConfigure Kubeconfig..."

echo -e "${KUBECONFIG_CLUSTER}" | base64 -d > "${KUBECONFIG}"

# =============================================================================
# FUNCTIONS
# =============================================================================

function CheckHelmRelease(){
    if [ ${1} -eq 1 ] 
    then
        echo -e "\nThe Helm Release ${HELM_NAME} alredy exist..."
        echo -e "\nBye Bye :)"
        exit 
    else
        echo -e "\nThe Helm Release ${HELM_NAME} not exist. The process will be continued..."
    fi
}

function CheckNamespace(){
    if [ ${1} -eq 1 ] 
    then
        echo -e "\nThe namespace ${HELM_NAMESPACE} alredy exist in your Cluster..."
        echo -e "\nBye Bye :)"
        exit 
    else
        echo -e "\nThe namespace ${HELM_NAMESPACE} not exist in your Cluster..."
        if [ "${CREATE_NAMESPACE}" == "YES" ]
        then
            echo -e "\nThe namespace ${HELM_NAMESPACE} will be created."
            kubectl create namespace ${HELM_NAMESPACE}
        else
            echo -e "\nBye Bye :)"
            exit 1
        fi
    fi
}

function GetHelmReleases() {
    echo -e "\nChecking if the helm release ${HELM_NAME} alredy exist in helm releases..."
    HELM_RELEASES=$(helm list --all --all-namespaces | awk '{print $1}')
    for HELM_RELEASE in ${HELM_RELEASES}
    do
        if [ ${HELM_RELEASE} != ${HELM_NAME} ] ; then continue ; fi
        EXIST=1
    done
    CheckHelmRelease ${EXIST}
}

function GetNamespaces() {
    echo -e "\nChecking if ${HELM_NAMESPACE} alredy exist in ${BOTKUBE_CLUSTER_NAME} Cluster..."
    NAMESPACES=$(kubectl get ns | awk '{print $1}')
    for NAMESPACE in ${NAMESPACES}
    do
        if [ ${NAMESPACE} != ${HELM_NAMESPACE} ] ; then continue ; fi
        EXIST=1
    done
    CheckNamespace ${EXIST}
}

# =============================================================================
# MAIN
# =============================================================================

GetHelmReleases

GetNamespaces

echo -e "\nGetting all releases...\n"

helm list --all-namespaces

echo -e "\nAdding Helm Repository...\n"

helm repo add infracloudio https://infracloudio.github.io/charts

echo -e "\nRun Helm Repo Update...\n"

helm repo update

echo -e "\nRun Helm Install ${HELM_NAME} in ${HELM_NAMESPACE} namespace..."

helm install ${HELM_NAME} --version ${BOTKUBE_IMAGE_TAG} --namespace ${HELM_NAMESPACE} --skip-crds \
--set config.communications.slack.enabled=${BOTKUBE_ENABLE_SLACK} \
--set config.communications.slack.channel=${BOTKUBE_SLACK_CHANNEL} \
--set config.communications.slack.token=${BOTKUBE_SLACK_TOKEN} \
--set config.settings.clustername=${BOTKUBE_CLUSTER_NAME} \
--set config.settings.allowkubectl=${BOTKUBE_ALLOW_KUBECTL} \
--set config.settings.configwatcher=${BOTKUBE_CONFIG_WATCHER} \
--set config.settings.upgradeNotifier=${BOTKUBE_UPGRADE_NOTIFIER} \
--set image.repository=${BOTKUBE_IMAGE_REPOSITORY} \
--set image.tag=${BOTKUBE_IMAGE_TAG} \
${BOTKUBE_IMAGE_REPOSITORY}

echo -e "\nGetting all namespaces..."

kubectl get ns

echo -e "\nGetting cluster events to ${HELM_NAMESPACE} namespace..."

kubectl get events -n ${HELM_NAMESPACE}
