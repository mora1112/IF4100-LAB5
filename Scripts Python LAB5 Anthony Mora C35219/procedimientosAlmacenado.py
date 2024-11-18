import pyodbc
from connectionData import connect_to_sql_server

def insertar_prestamo(codigo_usuario, codigo_ejemplar, fecha_prestamo, fecha_devolucion):
    connection = connect_to_sql_server()
    if connection is None:
        print("No Connection available")
        return
    try:
        cursor = connection.cursor()
        call_proc = "{CALL sp_InsertarPrestamo(?, ?, ?, ?)}"
        cursor.execute(call_proc, (codigo_usuario, codigo_ejemplar, fecha_prestamo, fecha_devolucion))
        connection.commit()
        print("Préstamo insertado exitosamente")
    except pyodbc.Error as e:
        print("Error al llamar el procedimiento almacenado:", e)
    finally:
        if connection:
            connection.close()

def consultar_libros(id_libro=None, titulo=None, isbn=None, paginas=None, editorial=None):
    connection = connect_to_sql_server()
    if connection is None:
        print("No Connection available")
        return
    try:
        cursor = connection.cursor()
        call_proc = "{CALL sp_ConsultarLibros(?, ?, ?, ?, ?)}"
        cursor.execute(call_proc, (id_libro, titulo, isbn, paginas, editorial))
        
        rows = cursor.fetchall()
        for row in rows:
            print(row)
    except pyodbc.Error as e:
        print("Error al llamar el procedimiento almacenado:", e)
    finally:
        if connection:
            connection.close()

def actualizar_autor(codigo_autor, nuevo_nombre):
    connection = connect_to_sql_server()
    if connection is None:
        print("No Connection available")
        return
    try:
        cursor = connection.cursor()
        call_proc = "{CALL sp_ActualizarAutor(?, ?)}"
        cursor.execute(call_proc, (codigo_autor, nuevo_nombre))
        connection.commit()
        print("Autor actualizado exitosamente")
    except pyodbc.Error as e:
        print("Error al llamar el procedimiento almacenado:", e)
    finally:
        if connection:
            connection.close()

def borrar_estudiante(codigo_usuario):
    connection = connect_to_sql_server()
    if connection is None:
        print("No Connection available")
        return
    try:
        cursor = connection.cursor()
        call_proc = "{CALL sp_BorrarEstudiante(?)}"
        cursor.execute(call_proc, (codigo_usuario,))
        connection.commit()
        print("Estudiante borrado exitosamente")
    except pyodbc.Error as e:
        print("Error al llamar el procedimiento almacenado:", e)
    finally:
        if connection:
            connection.close()

def mostrar_menu():
    print("\n--- Menú de Opciones ---")
    print("1. Insertar Préstamo")
    print("2. Consultar Libros")
    print("3. Actualizar Autor")
    print("4. Borrar Estudiante")
    print("5. Salir")

if __name__ == "__main__":
    while True:
        mostrar_menu()
        opcion = input("Selecciona una opción: ")

        if opcion == '1':
            codigo_usuario = int(input("Ingrese el código de usuario: "))
            codigo_ejemplar = int(input("Ingrese el código del ejemplar: "))
            fecha_prestamo = input("Ingrese la fecha de préstamo (YYYY-MM-DD HH:MM:SS): ")
            fecha_devolucion = input("Ingrese la fecha de devolución (YYYY-MM-DD): ")
            insertar_prestamo(codigo_usuario, codigo_ejemplar, fecha_prestamo, fecha_devolucion)

        elif opcion == '2':
            # Preguntar todos los parámetros antes de llamar a la función
            id_libro = input("Ingrese el ID del libro (o deje vacío): ")
            titulo = input("Ingrese el título del libro (o deje vacío): ")
            isbn = input("Ingrese el ISBN (o deje vacío): ")
            paginas = input("Ingrese la cantidad de páginas (o deje vacío): ")
            editorial = input("Ingrese la editorial (o deje vacío): ")

            # Llama a la función con todos los parámetros
            consultar_libros(
                id_libro=int(id_libro) if id_libro else None,
                titulo=titulo if titulo else None,
                isbn=isbn if isbn else None,
                paginas=int(paginas) if paginas else None,
                editorial=editorial if editorial else None
            )

        elif opcion == '3':
            codigo_autor = int(input("Ingrese el código del autor: "))
            nuevo_nombre = input("Ingrese el nuevo nombre del autor: ")
            actualizar_autor(codigo_autor, nuevo_nombre)

        elif opcion == '4':
            codigo_usuario = int(input("Ingrese el código de usuario a borrar: "))
            borrar_estudiante(codigo_usuario)

        elif opcion == '5':
            print("Saliendo del programa...")
            break

        else:
            print("Opción no válida, por favor intente nuevamente.")
