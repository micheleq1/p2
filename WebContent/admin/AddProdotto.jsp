<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <title>Aggiungi prodotto</title>
</head>
<body>
    <%@ include file="../fragments/header.jsp" %>
    <%@ include file="../fragments/menu.jsp" %>
    
    <div id="main" class="clear">
        <h2>AGGIUNGI PRODOTTO</h2>
        
        <form action="../catalogo" method="post" id="myform" onsubmit="return validateForm()">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="page" value="admin/GestioneCatalogo.jsp"><br><br>
            <div class="tableRow">
                <p>Nome:</p>
                <p><input type="text" name="nome" id="nome" required></p>
            </div>
            <div class="tableRow">
                <p>Descrizione:</p>
                <p><input type="text" name="descrizione" id="descrizione" required></p>
            </div>
            <div class="tableRow">
                <p>Iva:</p>
                <p><input type="text" name="iva" id="iva" required></p>
            </div>
            <div class="tableRow">
                <p>Prezzo:</p>
                <p><input type="text" name="prezzo" id="prezzo" required></p>
            </div>
            <div class="tableRow">
                <p>Data:</p>
                <p><input type="text" name="dataUscita" id="dataUscita" required></p>
            </div>
            <div class="tableRow">
                <p>Quantità:</p>
                <p><input type="number" name="quantita" id="quantita" required></p>
            </div>
            <div class="tableRow">
                <p>Immagine:</p>
                <p><input type="text" name="img" id="img" required></p>
            </div>
            <div class="tableRow">
                <p>Piattaforma:</p>
                <p><input type="text" name="piattaforma" id="piattaforma" required></p>
            </div>
            <div class="tableRow">
                <p>Genere:</p>
                <p><input type="text" name="genere" id="genere" required></p>
            </div>
            <div class="tableRow">    
                <p>Descrizione dettagliata:</p>
                <p><input type="text" name="descDett" id="descDett"></p>
            </div>
            <div class="tableRow">
                <p></p>
                <p><input type="submit" value="aggiungi"></p>
            </div>
        </form>
    </div>

    <%@ include file="../fragments/footer.jsp" %>

    <script>
        function validateForm() {
            var nome = document.getElementById("nome").value.trim();
            var descrizione = document.getElementById("descrizione").value.trim();
            var iva = document.getElementById("iva").value.trim();
            var prezzo = document.getElementById("prezzo").value.trim();
            var dataUscita = document.getElementById("dataUscita").value.trim();
            var quantita = document.getElementById("quantita").value.trim();
            var img = document.getElementById("img").value.trim();
            var piattaforma = document.getElementById("piattaforma").value.trim();
            var genere = document.getElementById("genere").value.trim();

            // Esempio di validazione: Assicurati che i campi non siano vuoti
            if (nome === "" || descrizione === "" || iva === "" || prezzo === "" || dataUscita === "" || quantita === "" || img === "" || piattaforma === "" || genere === "") {
                alert("Assicurati di compilare correttamente tutti i campi.");
                return false; // Blocca l'invio del modulo se la validazione fallisce
            }
            return true; // Permette l'invio del modulo se la validazione è superata
        }
    </script>
</body>
</html>
