#!/bin/bash

plato-parallel() {

local NUM_THREADS=1
local NUM_RANKS=1
local RUN_PLATO=1
local OPTIND h n t

while getopts "hn:t:" ARG; do
  case "${ARG}" in
    n) # MPI ranks
      NUM_RANKS=${OPTARG}
      ;;
    t) # GPU arch
      NUM_THREADS=${OPTARG}
      ;;
    h)
      unset RUN_PLATO
      ;;
    *)
      unset RUN_PLATO
      ;;
  esac
done

if [[ "$#" -lt 1 ]]
then
  unset RUN_PLATO
fi

if [[ -z $RUN_PLATO ]]; then

  echo "Plato MPI launch script, which facilitates specifying hardware resources for mixed MPI/OpenMP runs. Usage:"
  echo "plato-parallel [-n <number-of-ranks>] [-t <number-of-threads>] <input-file>"

else

  local CORES_PER_SOCKET=$(lscpu | grep 'Core(s) per socket:' | awk '{print $4}')
  if ! [[ "${CORES_PER_SOCKET}" =~ ^[0-9]+$ ]]; then
    echo "Problem running lscpu to find the number of cores per socket, defaulting to 16."
    CORES_PER_SOCKET=16
  fi

  if [[ "${NUM_THREADS}" -gt "${CORES_PER_SOCKET}" ]]; then
    echo "Warning: The number of threads (${NUM_THREADS}) exceeds the number of cores per socket (${CORES_PER_SOCKET}). Performance may degrade."
  fi

  local RANKS_PER_SOCKET=$((CORES_PER_SOCKET/NUM_THREADS))

  local INPUT="${@: -1}"

  echo "Launching plato with ${NUM_RANKS} ranks and ${NUM_THREADS} threads per rank, assuming ${CORES_PER_SOCKET} cores per socket."
  mpirun -n ${NUM_RANKS} \
          --map-by ppr:${RANKS_PER_SOCKET}:socket:PE=${NUM_THREADS} \
          -x OMP_NUM_THREADS=${NUM_THREADS} \
          -x OMP_PROC_BIND=close \
          -x OMP_PLACES=threads \
          plato "${INPUT}"

fi
}
