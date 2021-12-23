from flask import Flask, render_template, session, request, redirect, url_for,flash
from modelo import *

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123456'
app.config['MYSQL_DB'] = 'busqueda'

modelo=Model(app)

app.secret_key='mysecretkey'

@app.route('/')
def home():
    return redirect(url_for('login'))
    
@app.route('/Intro')
def login():
    return render_template("Intro.html")

@app.route('/Intro',methods=['POST'])
def busqueda():
    d=request.form['busqueda']
    resul=modelo.actualizar(d)
    return render_template("Intro.html",r=resul)
    
if __name__=='__main__':
    app.run(port=3000,debug=True)