set -e

SERVICE=$1 #"yellow"
YEAR=$2 #2020

URL_PREFIX="https://d37ci6vzurychx.cloudfront.net/trip-data"

OUTPUT_DIR=~/de_zoomcamp/taxis_data/raw


for MONTH in {1..12}; do
    FMONTH=`printf "%02d" ${MONTH}`

    PARQUET_FILE=${SERVICE}_tripdata_${YEAR}-${FMONTH}.parquet

    URL="${URL_PREFIX}/${PARQUET_FILE}"

    DOwNLOAD_PATH="${OUTPUT_DIR}/${SERVICE}/${YEAR}/${FMONTH}"

    mkdir -p ${DOwNLOAD_PATH}

    wget ${URL} -O ${DOwNLOAD_PATH}/${PARQUET_FILE}
done
