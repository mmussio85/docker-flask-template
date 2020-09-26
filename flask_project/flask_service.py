from flask import Flask, request, render_template, Response
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text

import json

app = Flask(__name__)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://docker:docker@db/docker'
db = SQLAlchemy(app)


def getEmployees():  
        employees = [dict(row) for row in db.engine.execute(text("SELECT * FROM public.employee"))]
        print(employees)
        return employees  
	
@app.route('/')
def health_check():
    return 'Docker container is up! {0}'.format(str(getEmployees()))

@app.route('/people')
def get_people():
	
	with open('/app/flask_project/people.json') as json_file:
		data = json.load(json_file)
	return Response(json.dumps(data),  mimetype='application/json')


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')