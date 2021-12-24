from flask_mysqldb import MySQL
class Model:
    def __init__(self, app):
        self.mysql=MySQL(app)
        pass    

    def busqueda_usuario_gerente(self,request):
        cur=self.mysql.connection.cursor()
        query="CALL busqueda_usuario_gerente(%(nombre)s,%(primer_apellido)s,%(segundo_apellido)s,%(genero)s,%(direccion)s)"
        if not request.form:
            actualizador={'nombre': '','primer_apellido': ''
            ,'segundo_apellido': '','genero': '',
            'direccion': ''}
        else:
            actualizador={'nombre': request.form['nombre'],'primer_apellido': request.form['primer_apellido']
            ,'segundo_apellido': request.form['segundo_apellido'],'genero': request.form['genero'],
            'direccion': request.form['direccion']}
        cur.execute(query,actualizador)
        data = []
        contenido = {}
        resultados=cur.fetchall()
        
        for resultado in resultados:
            contenido={'codigo':resultado[0],'nombre':resultado[1], 'primer_apellido':resultado[2], 
            'segundo_apellido':resultado[3], 'fecha_de_nacimiento':resultado[4], 'genero':resultado[5],
            'direccion':resultado[6]}
            data.append(contenido)
        contenido={}
        return data

    def busqueda_articulo_gerente(self,request):
        actualizador={}
        cur=self.mysql.connection.cursor()
        query="CALL busqueda_articulo_gerente(%(nombre)s,%(precio_mayor)s,%(precio_menor)s,%(material)s,%(proveedor)s,%(proveedor_direccion)s,%(cantidad_mayor)s,%(cantidad_menor)s)"
        if not request.form:
            print("hola amigo")
            actualizador={'nombre': None,'precio_mayor': 0.0,'precio_menor': 1000000.00,'material': None
            ,'proveedor': None,'proveedor_direccion': None,
            'cantidad_mayor': -1,'cantidad_menor': 1000000}
        else:
            actualizador={'nombre': request.form['nombre'],'precio_mayor': request.form['precio_mayor'],'precio_menor': request.form['precio_menor'],'material': request.form['material']
            ,'proveedor': request.form['proveedor'],'proveedor_direccion': request.form['proveedor_direccion'],
            'cantidad_mayor': request.form['cantidad_mayor'],'cantidad_menor': request.form['cantidad_menor']}
            if not request.form['precio_mayor']:
                actualizador['precio_mayor']=0.0

            if not request.form['precio_menor']:
                actualizador['precio_menor']=1000000.00

            if not request.form['cantidad_mayor']:
                actualizador['cantidad_mayor']=-1

            if not request.form['cantidad_menor']:
                actualizador['cantidad_menor']=1000000
        cur.execute(query,actualizador)
        data = []
        contenido = {}
        resultados=cur.fetchall()
        print(actualizador)
        print(resultados)
        for resultado in resultados:
            contenido={'codigo':resultado[0],'nombre':resultado[1],'precio':resultado[2], 'material':resultado[3],
            'proveedor_codigo':resultado[4], 'proveedor_nombre':resultado[5], 'proveedor_direccion':resultado[6], 
            'cantidad':resultado[7]}
            data.append(contenido)
        contenido={}
        return data

    
    def busqueda_venta_gerente(self,request):
        cur=self.mysql.connection.cursor()
        query="CALL busqueda_venta_gerente(%(nombre)s,%(primer_apellido)s,%(segundo_apellido)s,%(genero)s,%(direccion)s)"
        if not request:
            actualizador={'nombre': '*','primer_apellido': '*'
            ,'segundo_apellido': '*','genero': '*',
            'direccion': '*'}
        else:
            actualizador={'nombre': request.form['nombre'],'primer_apellido': request.form['primer_apellido']
            ,'segundo_apellido': request.form['segundo_apellido'],'genero': request.form['genero'],
            'direccion': request.form['direccion']}
        cur.execute(query,actualizador)
        data = []
        contenido = {}
        resultados=cur.fetchall()
        for resultado in resultados:
            contenido={'codigo':resultado[0],'nombre':resultado[1], 'primer_apellido':resultado[2], 
            'segundo_apellido':resultado[3], 'fecha_de_nacimiento':resultado[4], 'genero':resultado[5],
            'direccion':resultado[6]}
            data.append(contenido)
        contenido={}
        return data
            
    def busqueda_usuario(self,d):
        cur=self.mysql.connection.cursor()
        actualizador={'palabra': d}
        query="CALL busqueda(%(palabra)s)"
        cur.execute(query,actualizador)
        data = []
        contenido = {}
        resultados=cur.fetchall()
        for resultado in resultados:
            contenido={'codigo':resultado[0],'nombre':resultado[1], 'primer_apellido':resultado[2], 'segundo_apellido':resultado[3]}
            data.append(contenido)
        contenido={}
        return data 

    def inicio_sesion(self,usuario,contrasena):
        cur=self.mysql.connection.cursor()
        verificador={'usuario': usuario, 'contrasena':contrasena}
        query="CALL existencia(%(usuario)s,%(contrasena)s)"
        cur.execute(query,verificador)
        resultados=cur.fetchall()
        if not resultados:
            resul={'status':0}
            return resul
        else:
            for resultado in resultados:
                resul={'codigo':resultado[0],'nombre':resultado[1], 'primer_apellido':resultado[2], 'segundo_apellido':resultado[3], 'status':resultado[4]}
            return resul 