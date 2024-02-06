import inflection

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    data = data[(data.trip_distance > 0) & (data.passenger_count > 0)]

    data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date

    data.columns = [to_snake(col_name) for col_name in data.columns]

    return data

def to_snake(name):
    return inflection.underscore(name)

@test
def test_output(output, *args) -> None:
    assert 'vendor_id' in output.columns, 'vendor_id does not exists'        
    assert output['passenger_count'].isin([0]).sum() == 0, 'The are rides with 0 passengers '    
    assert output['trip_distance'].isin([0]).sum() == 0, 'The are rides with 0 distance '