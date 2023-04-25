from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_geek():
   return '''
        <h1>Hello from Flask & Docker premier test de deploiment version 19</h2>
        <img src="Jenkins.png" alt="Jenkins">
    '''
if __name__ == "__main__":
    app.run(debug=True)
