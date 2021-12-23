from flask_mysqldb import MySQL
class Model:
    def __init__(self, app):
        self.mysql=MySQL(app)
        pass    
    def actualizar(self,d):
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