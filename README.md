# JsonToCsv

JsonToCsv is a small library who convert json files into csv files.
Json format should be a array of objects like :
[
  {
    "id": 0,
    "email": "test@test.com",
    "tags": [
      "consectetur",
      "quis"
    ],
    "profiles": {
      "facebook": {
        "id": 0,
        "picture": "//fbcdn.com/a2244bc1-b10c-4d91-9ce8-184337c6b898.jpg"
      },
      "twitter": {
        "id": 0,
        "picture": "//twcdn.com/ad9e8cd3-3133-423e-8bbf-0602e4048c22.jpg"
      }
    }
  }
 ]

## Tests

You can run tests whith :

	ruby spec/json_to_csv_spec.rb

## Run

Exec lib with:
	
	ruby lib/json_to_csv.rb

Ruby version 2.5.7.