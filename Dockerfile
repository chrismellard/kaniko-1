FROM alpine
# ACR docker env credential helper
ADD https://github.com/chrismellard/docker-credential-acr-env/releases/download/0.6.0/docker-credential-acr-env_0.6.0_Linux_x86_64.tar.gz /usr/local/bin/
RUN tar --no-same-owner -C /usr/local/bin/ -xvzf /usr/local/bin/docker-credential-acr-env_0.6.0_Linux_x86_64.tar.gz

FROM gcr.io/kaniko-project/executor:5f4e2f136633d241444129517a4e75ebf44065c7
COPY --from=0 /usr/local/bin/docker-credential-acr-env /kaniko/docker-credential-acr-env
