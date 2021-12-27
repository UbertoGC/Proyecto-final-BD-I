from flask_mysqldb import MySQL
class Model:
    def __init__(self, app):
        self.mysql=MySQL(app)
        pass  
    def actualizar_sofa(self, request, codigo2):
        cur=self.mysql.connection.cursor()
        query="CALL actualizar_sofa(%(codigo)s,%(nombre)s,%(precio)s,%(material)s,%(proveedor)s)"
        registrador={'codigo':codigo2,'nombre':request.form['nombre'],'precio':request.form['precio'] 
        ,'material':request.form['material'],'proveedor':request.form['proveedor']}
        cur.execute(query,registrador)
        self.mysql.connection.commit()
        cur.execute("SELECT * FROM oficina")
        data = []
        contenido = {}
        resultados=cur.fetchall()
        for resultado in resultados:
            contenido={'codigo':resultado[0],'pais':resultado[1], 'direccion':resultado[2], 
            'departamento':resultado[3]}
            data.append(contenido)
        return data



    def comprar(self, request, codigo):
        cur=self.mysql.connection.cursor()
        query="CALL comprar_sofa(%(codigo)s,%(sofa)s,%(cantidad)s,%(oficina)s)"
        actualizador={'codigo': codigo, 'sofa': request.form['sofa'], 'cantidad': request.form['cantidad'],'oficina': request.form['oficina']}
        cur.execute(query,actualizador)
        self.mysql.connection.commit()
    def actualizar_usuario(self, request, codigo):
        cur=self.mysql.connection.cursor()
        query="CALL actualizar_usuario(%(codigo)s,%(nombre)s,%(primer_apellido)s,%(segundo_apellido)s,%(usuario)s,%(clave)s, %(pais)s,%(departamento)s,%(genero)s,%(direccion)s,%(fecha_de_nacimiento)s)"
        actualizador={'codigo': codigo, 'nombre': request.form['nombre'],'primer_apellido': request.form['primer_apellido']
            ,'segundo_apellido': request.form['segundo_apellido'],'genero': request.form['genero'],
            'usuario':request.form['usuario'], 'clave':request.form['clave'],'direccion': request.form['direccion'], 
            'pais':request.form['pais'], 'departamento':request.form['departamento'], 'fecha_de_nacimiento':request.form['fecha_de_nacimiento']}
        cur.execute(query,actualizador)
        self.mysql.connection.commit()

    def registrar_usuario(self, request):
        cur=self.mysql.connection.cursor()
        data=0
        cur.execute("select max(n.codigo_persona) as 'maximo' from nombre n")
        resultados=cur.fetchall()
        for resultado in resultados:
            data=resultado[0]
        query="CALL registrar_usuario(%(nombre)s,%(primer_apellido)s,%(segundo_apellido)s,%(usuario)s,%(clave)s, %(pais)s,%(departamento)s,%(genero)s,%(direccion)s,%(fecha_de_nacimiento)s)"
        registrador={'nombre': request.form['nombre'],'primer_apellido': request.form['primer_apellido']
            ,'segundo_apellido': request.form['segundo_apellido'],'genero': request.form['genero'],
            'usuario':request.form['usuario'], 'clave':request.form['clave'],'direccion': request.form['direccion'], 
            'pais':request.form['pais'], 'departamento':request.form['departamento'], 'fecha_de_nacimiento':request.form['fecha_de_nacimiento']}
        cur.execute(query,registrador)
        self.mysql.connection.commit()
        data2=0
        cur.execute("select max(n.codigo_persona) as 'maximo' from nombre n")
        resultados=cur.fetchall()
        for resultado in resultados:
            data2=resultado[0]
        if data2>data:
            return 1
        else:
            return 0

    def busqueda_usuario_gerente(self,request):
        cur=self.mysql.connection.cursor()
        query="CALL busqueda_usuario_gerente(%(nombre)s,%(primer_apellido)s,%(segundo_apellido)s,%(genero)s,%(direccion)s, %(pais)s,%(departamento)s)"
        if not request.form:
            actualizador={'nombre': None,'primer_apellido': None
            ,'segundo_apellido': None,'genero': None,
            'direccion': None, 'pais':None, 'departamento':None}
        else:
            actualizador={'nombre': request.form['nombre'],'primer_apellido': request.form['primer_apellido']
            ,'segundo_apellido': request.form['segundo_apellido'],'genero': request.form['genero'],
            'direccion': request.form['direccion'],'pais':request.form['pais'], 'departamento':request.form['departamento']}
        cur.execute(query,actualizador)
        data = []
        contenido = {}
        resultados=cur.fetchall()
        
        for resultado in resultados:
            contenido={'codigo':resultado[0],'nombre':resultado[1], 'primer_apellido':resultado[2], 
            'segundo_apellido':resultado[3], 'genero':resultado[4], 'direccion':resultado[5], 'fecha_de_nacimiento':resultado[6],
            'pais':resultado[7],'departamento':resultado[8]}
            data.append(contenido)
        contenido={}
        return data

    def busqueda_articulo_gerente(self,request):
        actualizador={}
        cur=self.mysql.connection.cursor()
        query="CALL busqueda_articulo_gerente(%(nombre)s,%(precio_mayor)s,%(precio_menor)s,%(material)s,%(proveedor)s,%(proveedor_direccion)s,%(proveedor_pais)s,%(proveedor_departamento)s,%(cantidad_mayor)s,%(cantidad_menor)s)"
        if not request.form:
            actualizador={'nombre': None,'precio_mayor': 0.0,'precio_menor': 1000000.00,'material': None
            ,'proveedor': None,'proveedor_direccion': None,
            'proveedor_pais':None, 'proveedor_departamento':None,
            'cantidad_mayor': -1,'cantidad_menor': 1000000}
        else:
            actualizador={'nombre': request.form['nombre'],'precio_mayor': request.form['precio_mayor'],'precio_menor': request.form['precio_menor'],'material': request.form['material']
            ,'proveedor': request.form['proveedor'],'proveedor_direccion': request.form['proveedor_direccion']
            ,'proveedor_pais':request.form['proveedor_pais'], 'proveedor_departamento':request.form['proveedor_departamento'],
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
        for resultado in resultados:
            contenido={'codigo':resultado[0],'nombre':resultado[1],'precio':resultado[2], 'material':resultado[3],
            'proveedor_codigo':resultado[4], 'proveedor_nombre':resultado[5], 'proveedor_direccion':resultado[6], 
            'proveedor_pais':resultado[7], 'proveedor_departamento':resultado[8],
            'cantidad':resultado[9]}
            data.append(contenido)
        contenido={}
        return data

    
    def busqueda_venta_gerente(self,request):
        cur=self.mysql.connection.cursor()
        actualizador={}
        query="CALL busqueda_venta_gerente(%(nombre)s,%(primer_apellido)s,%(segundo_apellido)s,%(sofa_nombre)s,%(material)s,%(precio_mayor)s,%(precio_menor)s,%(cantidad_mayor)s,%(cantidad_menor)s,%(total_mayor)s,%(total_menor)s)"
        if not request.form:
            actualizador={'nombre': None,'primer_apellido':None,'segundo_apellido':None,
            'sofa_nombre':None,'material':None,'precio_mayor':0.0,'precio_menor':1000000.0,'total_mayor':0.0,
            'total_menor':1000000.0,'cantidad_mayor':-1,'cantidad_menor':1000000}
        else:
            actualizador={'nombre': request.form['comprador_nombre'],'primer_apellido': request.form['primer_apellido']
            ,'segundo_apellido': request.form['segundo_apellido'],'sofa_nombre':request.form['sofa_nombre']
            ,'material':request.form['material']
            ,'precio_mayor':request.form['precio_mayor'],'precio_menor':request.form['precio_menor']
            ,'total_mayor':request.form['total_mayor'],'total_menor':request.form['total_menor']
            ,'cantidad_mayor':request.form['cantidad_mayor'],'cantidad_menor':request.form['cantidad_menor']}
            if not request.form['precio_mayor']:
                actualizador['precio_mayor']=0.0

            if not request.form['precio_menor']:
                actualizador['precio_menor']=1000000.00

            if not request.form['total_mayor']:
                actualizador['total_mayor']=0.0

            if not request.form['total_menor']:
                actualizador['total_menor']=10000000.00

            if not request.form['cantidad_mayor']:
                actualizador['cantidad_mayor']=-1

            if not request.form['cantidad_menor']:
                actualizador['cantidad_menor']=1000000
        cur.execute(query,actualizador)
        data = []
        contenido = {}
        resultados=cur.fetchall()
        for resultado in resultados:
            contenido={'codigo':resultado[0],'nombre':resultado[1], 'primer_apellido':resultado[2], 
            'segundo_apellido':resultado[3], 'sofa_codigo':resultado[4], 'sofa_nombre':resultado[5], 
            'sofa_material':resultado[6], 
            'precio_unitario':resultado[7],'cantidad':resultado[8],'total':resultado[9]}
            data.append(contenido)
        contenido={}
        return data

    def registrar_sofa(self, request):
        codigo=0
        cur=self.mysql.connection.cursor()
        query="CALL registrar_sofa(%(nombre)s,%(precio)s,%(material)s,%(proveedor)s)"
        registrador={'nombre':request.form['nombre'],'precio':request.form['precio'] 
        ,'material':request.form['material'],'proveedor':request.form['proveedor']}
        cur.execute(query,registrador)
        self.mysql.connection.commit()
        cur.execute("SELECT max(s.codigo) as 'maximo' from sofas s")
        resultados=cur.fetchall()
        for resultado in resultados:
            codigo=resultado[0]
        cur.execute("SELECT * FROM oficina")
        data = []
        contenido = {}
        resultados=cur.fetchall()
        for resultado in resultados:
            contenido={'codigo':resultado[0],'pais':resultado[1], 'direccion':resultado[2], 
            'departamento':resultado[3]}
            data.append(contenido)
        print(codigo)
        return data, codigo

    def editar_cantidad(self, request, codigo):
        for i in range(1,15):
            ba ='cantidad'+str(i)
            print(i)
            if request.form[ba]:
                cur=self.mysql.connection.cursor()
                query="CALL actualizar_cantidad(%(oficina)s, %(sofas)s,%(cantidad)s)"
                actualizador={ 'oficina':i, 'sofas':codigo ,'cantidad':request.form[ba]}
                cur.execute(query,actualizador)
                self.mysql.connection.commit()
        
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