
import pyodbc

def connect_to_sql_server():
    server = 'ANTHONY' #Instancia de la base de datos
    database = 'LABORATORIO5'
    username = 'PythonUser'
    password = '12345678'

    #Connection string for SQL Server
    conn_str = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};TrustServerCertificate=yes'


    try:
        #Establish Connection
        connection = pyodbc.connect(conn_str)
        print("Connection established successfully")
        return connection
    except pyodbc.Error as e:
        print("Connection Failed", e)
        return None

connect_to_sql_server()
    #TEST CALL TO THE FUNCTION
#if __name__ == '__main__':
#    conn = connect_to_sql_server()
#    if conn:
#        conn.close()
