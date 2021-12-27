from flask import Flask, render_template, request, redirect, url_for,flash
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
    flash("")
    return redirect(url_for('login'))
    
@app.route('/login')
def login():
    return render_template("login.html")

@app.route('/ingreso',methods=['GET','POST'])
def ingreso():
    usuario=request.form['user']
    contrasena=request.form['contra']
    resul=modelo.inicio_sesion(usuario,contrasena)
    s=int(resul['status'])
    if s==0:
        flash("Error, contraseña y/o usuario incorrecto")
        return redirect(url_for('login'))
    else:
        if s==2:
            codigo_user=resul[0]
            return redirect(url_for('usuario'), c=codigo_user)
        else:
            return redirect(url_for('gerente'))

@app.route('/usuario_actualizar/<string:c>',methods=['POST','GET'])
def usuario_actualizar(c):
    d=int(c)
    return render_template("actualizar.html", e=d)

@app.route('/actualizar_usuario/<string:e>',methods=['POST','GET'])
def actualizar_usuario(e):
    modelo.actualizar_usuario(request,e)
    return redirect(url_for('usuario'))

@app.route('/usuario',methods=['GET'])
def usuario():
    return render_template("usuario.html")

@app.route('/verificar',methods=['POST','GET'])
def verificar():
    d=modelo.registrar_usuario(request)
    if d==0:
        flash("Error, ingreso de datos incorrecto")
        return redirect(url_for('login'))
    else:
        flash("Usuario registrado con exito")
        return redirect(url_for('login'))

@app.route('/gerente/retroceder/<string:id>',methods=['POST','GET'])
def retroceder(id):
    clon=int(id)
    if(clon==0):
        return redirect(url_for('login'))
    elif (clon>0):
        return redirect(url_for('gerente'))

@app.route('/gerente',methods=['GET'])
def gerente():
    return render_template("gerente.html")

@app.route('/gerente/reporte_usuario',methods=['POST','GET'])
def reporte_usuario():
    resul=modelo.busqueda_usuario_gerente(request)
    return render_template("reporte_usuario.html", r=resul)

@app.route('/gerente/reporte_articulo',methods=['POST','GET'])
def reporte_articulo():
    resul=modelo.busqueda_articulo_gerente(request)
    return render_template("reporte_articulo.html", r=resul)


@app.route('/gerente/reporte_venta',methods=['POST','GET'])
def reporte_venta():
    resul=modelo.busqueda_venta_gerente(request)
    return render_template("reporte_venta.html", r=resul)

@app.route('/gerente/anadir_articulo',methods=['POST','GET'])
def añadir_articulo():
    return render_template("anadir_articulo.html")

@app.route('/gerente/registrar_sofa',methods=['POST'])
def registrar_sofa():
    resul,codigo1=modelo.registrar_sofa(request)
    if codigo1==0:
        flash("Error, articulo ya existente")
        return redirect(url_for('reporte_articulo'))
    else:
        flash("Articulo implementado")
        return render_template("cantidad_sofa.html",r=resul, c=codigo1)

@app.route('/gerente/cantidad_sofa/<string:codigo2>',methods=['POST','GET'])
def cantidad_sofa(codigo2):
    modelo.editar_cantidad(request, codigo2)
    flash('Sofa actualizado/añadido')
    return redirect(url_for('reporte_articulo'))

if __name__=='__main__':
    app.run(port=3000,debug=True)