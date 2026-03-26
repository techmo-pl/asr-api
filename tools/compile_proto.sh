#!/bin/bash

# compile_proto.sh
#
# Usage:
#   compile_proto [PROTOC_OPTIONS...]

set -euo pipefail

abs_project_dir="$(realpath -- "$(dirname -- "${0}")/..")"

protoc_options=(
    --cpp_out="${abs_project_dir}"
    --proto_path="${abs_project_dir}/proto"
)
readarray -d '' protos < <(find "${abs_project_dir}/proto" -name '*.proto' -print0)

read -ra protoc_options <<< "${PROTOC_OPTIONS-${protoc_options[@]}}"
read -ra protos <<< "${PROTOS-${protos[@]}}"

"${PROTOC:-protoc}" "${protoc_options[@]}" "${protos[@]}" "${@}"
