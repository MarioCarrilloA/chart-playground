#
# SPDX-License-Identifier: Apache-2.0
#

FROM starlingx/stx-centos:f-stein

# Download dependencies
RUN yum install -y epel-release && \
    yum install -y centos-release-openstack-pike && \
    yum install -y gcc-c++ \
        git \
        libuuid-devel \
        make \
        postgresql-devel \
        python-devel \
        python-pecan \
        python-setuptools \
        python2-eventlet \
        python2-httplib2 \
        python2-keystoneauth1 \
        python2-keystonemiddleware \
        python2-neutronclient \
        python2-oslo-db \
        python2-oslo-log \
        python2-oslo-middleware \
        python2-oslo-policy \
        python2-oslo-versionedobjects \
        python2-wsme

# Some modules required by fm restful API are stored
# in other StarlingX repositories, In this section
# those dependencies are installed.
RUN git clone https://git.starlingx.io/stx-config && \
    pushd stx-config/sysinv/cgts-client/cgts-client && \
    python setup.py install && \
    popd && \
    git clone https://git.starlingx.io/stx-update && \
    pushd stx-update/tsconfig/tsconfig && \
    python setup.py install && \
    popd

# The stx-fault repository is composed by different
# sub projects and some of them are dependencies of the
# fm restful API, in this section those sub components
# are installed.
RUN git clone https://git.starlingx.io/stx-fault && \
    pushd stx-fault/fm-common/sources && \
    make && \
    make install INCDIR=/usr/include LIBDIR=/usr/lib64 && \
    python setup.py install && \
    popd && \
    pushd stx-fault/devstack/files && \
    mkdir -p /etc/fm && \
    cp api-paste.ini /etc/fm/ && \
    popd && \
    pushd stx-fault/fm-api && \
    python setup.py install && \
    popd && \
    pushd stx-fault/fm-rest-api/fm && \
    python setup.py install && \
    popd

ENTRYPOINT ["/usr/bin/fm-api"]
