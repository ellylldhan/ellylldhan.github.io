#!/usr/bin/env python

import random
import sqlite3

# Connexion à la base de données SQLite
conn = sqlite3.connect('qcm.sqlite')
cursor = conn.cursor()

# Génération de 30 nombres aléatoires entre 1 et 59
query = cursor.execute("SELECT count(*) FROM qcm")
row = cursor.fetchone()
random_numbers = random.sample(range(1, row[0]), 30)
sql = "SELECT numero, qui, theme, question, reponse FROM qcm WHERE id = ? and actif = 1 and qui not like 'fred'"

# Ouvrir le fichier pour écrire les questions
with open('tirage_au_sort.html', 'w') as file:
    # Requête pour récupérer les lignes correspondantes dans la table 'qcm' et écrire dans le fichier
    
    body = '<!DOCTYPE html>\n<html lang="en">\n<head>\n\t<meta charset="UTF-8">\n\t<title>QCM</title>\n</head>\n<body>\n\t<ol>'

    file.write(body)
    for number in random_numbers:
        cursor.execute("SELECT numero, qui, theme, question FROM qcm WHERE id = ?", (number,))
        row = cursor.fetchone()
        if row:
            numero, qui, theme, question = row
            file.write(f"<li><b>Thème :</b> {theme} ({qui} {numero})<br>\n")
            file.write(f"<b>Question :</b> {question}<br>\n\n")
            file.write(f"<textarea type='text' rows='10' cols='50'></textarea>")
            file.write(f"</li>\n\n")  # Séparateur entre les questions
    endbody = '</ol></body></html>'
    file.write(endbody)
# Fermeture de la connexion à la base de données
conn.close()
