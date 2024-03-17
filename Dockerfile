FROM debian

RUN apt-get update && \
    apt-get install -y ca-certificates gpg curl && \
    curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null && \
    apt-get install apt-transport-https --yes && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && \
    apt-get install -y helm && \
    helm repo add bitnami https://charts.bitnami.com/bitnami && \
    helm repo update

COPY --chmod=0400 kube-config /root/.kube/config

ENTRYPOINT ["/usr/sbin/helm"]
