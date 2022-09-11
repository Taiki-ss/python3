from google.cloud import storage

client = storage.Client.from_service_account_json('/root/opt/.gcp-key/taiki-gcp-4f47b2cedaf8.json')

bucket = client.bucket('taiki_test_bucket_01')
blob = bucket.blob("test_folder_01/LH_taxtpl_202209072201.csv")

blob.download_to_filename("/root/opt/tmp/download.csv")