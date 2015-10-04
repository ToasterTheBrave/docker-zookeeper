FROM centos:6

# hostname for consul service
ENV CONSUL_HOST consul

# Install preqs
RUN \
	yum update -y && \
	yum clean all && \
	yum -y install \
		tar

# Install Consul-Template
ENV CT_VER 0.10.0
ENV CT_NAME consul-template_${CT_VER}_linux_amd64
ADD https://github.com/hashicorp/consul-template/releases/download/v${CT_VER}/${CT_NAME}.tar.gz /usr/local/${CT_NAME}.tgz
RUN \
	cd /usr/local/ && \
	tar -zvxf /usr/local/${CT_NAME}.tgz && \
	rm /usr/local/${CT_NAME}.tgz

# TODO : Install Zookeeper

# Copy folders
COPY src /app/src
COPY conf /app/conf
COPY templates /app/templates

# TODO : Expose ports

# TODO : Volumes for logs


# mount start script
ADD start /sbin/start

# Run start script
ENTRYPOINT ["/sbin/start"]

# Run command
CMD ["bash"]
