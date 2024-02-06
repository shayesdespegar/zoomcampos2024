import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    base_url = 'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green'
    
    taxi_dtypes = {
        'VendorID': pd.Int64Dtype(),
        'passenger_count': pd.Int64Dtype(),
        'trip_distance': float,
        'RatecodeID':pd.Int64Dtype(),
        'store_and_fwd_flag':str,
        'PULocationID':pd.Int64Dtype(),
        'DOLocationID':pd.Int64Dtype(),
        'payment_type': pd.Int64Dtype(),
        'fare_amount': float,
        'extra':float,
        'mta_tax':float,
        'tip_amount':float,
        'tolls_amount':float,
        'improvement_surcharge':float,
        'total_amount':float,
        'congestion_surcharge':float    
    }

    # native date parsing 
    parse_dates = ['lpep_pickup_datetime', 'lpep_dropoff_datetime']

    year = 2020
    
    data_list = []

    for month in range(10, 13):
        file_url = f'{base_url}/green_tripdata_{year}-{month}.csv.gz'
        print(f'appending {file_url}')

        data_list.append(pd.read_csv(file_url, sep=',', compression='gzip', dtype=taxi_dtypes, parse_dates=parse_dates))
    
    return pd.concat(data_list)

