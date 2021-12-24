from flask import Flask, render_template, session, request, redirect, url_for,flash
from modelo import *

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'Hardware+10'
app.config['MYSQL_DB'] = 'venta_sofas'

modelo=Model(app)

app.secret_key='mysecretkey'

@app.route('/')
def home():
    return redirect(url_for('login'))
    
@app.route('/login')
def login():
    return render_template("login.html")

@app.route('/ingreso',methods=['POST'])
def ingreso():
    usuario=request.form['user']
    contrasena=request.form['contra']
    resul=modelo.inicio_sesion(usuario,contrasena)
    s=int(resul['status'])
    if s==2:
        session['nombre']=resul['nombre']
        session['apellido1']=resul['primer_apellido']
        session['apellido2']=resul['segundo_apellido']
        return redirect(url_for('usuario'))
    elif s==1:
        session['nombre']=resul['nombre']
        session['apellido1']=resul['primer_apellido']
        session['apellido2']=resul['segundo_apellido']
        return redirect(url_for('gerente'))
    else:
        flash("Error, contraseña y/o usuario incorrecto")
        return redirect(url_for('login'))

@app.route('/usuario',methods=['GET'])
def usuario():
    return render_template("usuario.html",user=session)

@app.route('/gerente',methods=['GET'])
def gerente():
    return render_template("gerente.html",user=session)

@app.route('/gerente/reporte_usuario',methods=['POST','GET'])
def reporte_usuario():
    resul=modelo.busqueda_usuario_gerente(request)
    return render_template("reporte_usuario.html", r=resul)

@app.route('/gerente/reporte_articulo',methods=['POST','GET'])
def reporte_articulo():
    resul=modelo.busqueda_articulo_gerente(request)
    return render_template("reporte_articulo.html", r=resul)


@app.route('/gerente/reporte_venta',methods=['POST'])
def reporte_venta():
    resul=modelo.busqueda_venta_gerente(request)
    return render_template("reporte_venta.html", r=resul)
if __name__=='__main__':
    app.run(port=3000,debug=True)