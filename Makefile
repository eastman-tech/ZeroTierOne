BUILDDIR := build
TIMESTAMP=$(shell date +"%Y%m%d%H%M")

.PHONY: all

all:	setup
	cd ${BUILDDIR} && $(MAKE) -j4 VERBOSE=1

setup:
	mkdir -p ${BUILDDIR} && cd ${BUILDDIR} && cmake .. -DCMAKE_BUILD_TYPE=Release ${CMAKE_ARGS}

setup-debug:
	mkdir -p ${BUILDDIR} && cd ${BUILDDIR} && cmake .. -DCMAKE_BUILD_TYPE=Debug ${CMAKE_ARGS}

debug:
	mkdir -p ${BUILDDIR} && cd ${BUILDDIR} && cmake .. -DCMAKE_BUILD_TYPE=Debug ${CMAKE_ARGS} && $(MAKE)

central-controller:
	mkdir -p ${BUILDDIR} && cd ${BUILDDIR} && cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_CENTRAL_CONTROLLER=1 ${CMAKE_ARGS} && $(MAKE) -j4

central-controller-debug:
	mkdir -p ${BUILDDIR} && cd ${BUILDDIR} && cmake .. -DCMAKE_BUILD_TYPE=Debug -DBUILD_CENTRAL_CONTROLLER=1 ${CMAKE_ARGS}  && $(MAKE) -j4

central-controller-docker:
	docker build -t registry.zerotier.com/zerotier-central/ztcentral-controller:${TIMESTAMP} -f controller/central-docker/Dockerfile .

clean:
	rm -rf ${BUILDDIR}

distclean:
	rm -rf ${BUILDDIR}
