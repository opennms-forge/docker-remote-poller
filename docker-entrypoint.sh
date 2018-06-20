#!/bin/bash -e
# =====================================================================
# Build script running OpenNMS Remote Poller in Docker environment
#
# Source: https://github.com/opennms-forge/docker-remote-poller
# Web: https://www.opennms.org
#
# =====================================================================
REMOTE_POLLER_HOME="/opt/opennms"

# Error codes
E_ILLEGAL_ARGS=126

# Help function used in error messages and -h option
usage() {
    echo ""
    echo "Docker entry script for OpenNMS Remote Poller service container"
    echo ""
    echo "-f: Initialize and start OpenNMS Minion in foreground and use configuration from environment."
    echo "-h: Show this help."
    echo ""
}

start() {
  cd ${REMOTE_POLLER_HOME}/bin
  java ${REMOTE_POLLER_JVM_ARGS} \
   -Djava.rmi.activation.port="${REMOTE_POLLER_RMI_PORT}" \
   -Djava.awt.headless=true -Djava.rmi.activation.port="${REMOTE_POLLER_RMI_PORT}" \
   -jar remote-poller.jar \
   --url=${REMOTE_POLLER_URI} \
   --location=${REMOTE_POLLER_LOCATION} \
   -n ${REMOTE_POLLER_USERNAME} \
   -p ${REMOTE_POLLER_PASSWORD}
}

# Evaluate arguments for build script.
if [[ "${#}" == 0 ]]; then
    usage
    exit ${E_ILLEGAL_ARGS}
fi

# Evaluate arguments for build script.
while getopts fh flag; do
    case ${flag} in
        f)
            start
            ;;
        h)
            usage
            exit
            ;;
        *)
            usage
            exit ${E_ILLEGAL_ARGS}
            ;;
    esac
done

# Strip of all remaining arguments
shift $((OPTIND - 1));

# Check if there are remaining arguments
if [[ "${#}" > 0 ]]; then
    echo "Error: To many arguments: ${*}."
    usage
    exit ${E_ILLEGAL_ARGS}
fi
