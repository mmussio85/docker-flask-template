from flask import Flask 
import json
from flask import Response
app = Flask(__name__)

	
@app.route('/')
def health_check():
    return 'Docker container is up!'

@app.route('/people')
def get_people():
	
	with open('/app/flask_project/people.json') as json_file:
		data = json.load(json_file)
	return Response(json.dumps(data),  mimetype='application/json')


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')