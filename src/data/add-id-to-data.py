import json
import uuid

def generar_id():
    """Genera un ID hexadecimal único de 32 caracteres."""
    return uuid.uuid4().hex

def asignar_ids_en_objeto(obj):
    """Asigna un ID si no existe. También recorre objetos anidados (listas o diccionarios)."""
    if isinstance(obj, dict):
        if 'id' not in obj or obj['id'] is None:
            obj['id'] = generar_id()

        for key, value in obj.items():
            if isinstance(value, list):
                for item in value:
                    asignar_ids_en_objeto(item)
            elif isinstance(value, dict):
                asignar_ids_en_objeto(value)

def procesar_lista_json(lista_json):
    """Procesa una lista de objetos principales."""
    for obj in lista_json:
        asignar_ids_en_objeto(obj)
    return lista_json

# === MAIN ===
if __name__ == "__main__":
    # Ruta del archivo JSON que contiene tus datos
    ruta_entrada = "animes-data.json"
    ruta_salida = "animes-data-1.json"

    try:
        # Leer archivo JSON
        with open(ruta_entrada, "r", encoding="utf-8") as archivo:
            datos = json.load(archivo)

        # Procesar datos
        datos_validados = procesar_lista_json(datos)

        # Guardar archivo actualizado
        with open(ruta_salida, "w", encoding="utf-8") as archivo:
            json.dump(datos_validados, archivo, indent=4, ensure_ascii=False)

        print(f"✅ Archivo procesado correctamente. Resultado guardado en '{ruta_salida}'.")

    except FileNotFoundError:
        print(f"❌ No se encontró el archivo '{ruta_entrada}'.")
    except json.JSONDecodeError:
        print("❌ Error al decodificar el JSON. Verifica que el archivo tenga un formato válido.")
