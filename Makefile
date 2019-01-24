#
# SPDX-License-Identifier: Apache-2.0
#

STX_FAULT_TAG="fm-rest-api:7.4"

all:
	docker build \
		--tag $(STX_FAULT_TAG) \
		--build-arg http_proxy=$(PROXY) \
		--build-arg https_proxy=$(PROXY) \
		--file dockerfiles/Dockerfile .
