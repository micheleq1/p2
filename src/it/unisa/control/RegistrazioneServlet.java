package it.unisa.control;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import it.unisa.model.*;

/**
 * Servlet implementation class RegistraziomeServlet
 */
@WebServlet("/Registrazione")
public class RegistrazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDao dao = new UserDao();
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String email = request.getParameter("email");
		String dataNascita = request.getParameter("nascita");
		String username = request.getParameter("us");
		String pwd = request.getParameter("pw");

        String[] parti = dataNascita.split("-");
        dataNascita = parti[2] + "-" + parti[1] + "-" + parti[0];
		
        try {
            UserBean user = new UserBean();
            user.setNome(nome);
            user.setCognome(cognome);
            user.setEmail(email);
            user.setDataDiNascita(Date.valueOf(dataNascita));
            user.setUsername(username);
            
            // Crittografa la password utilizzando SHA-256
            String passwordHash = hashPassword(pwd);
            user.setPassword(passwordHash);
            
            user.setAmministratore(false);
            user.setCap(null);
            user.setIndirizzo(null);
            user.setCartaDiCredito(null);
            
            dao.doSave(user);
        } catch(SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }}

        // Metodo per l'hashing della password utilizzando SHA-256
        private String hashPassword(String password) {
            try {
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hash = digest.digest(password.getBytes());
                
                // Converti l'array di byte in una stringa esadecimale
                StringBuilder hexString = new StringBuilder();
                for (byte b : hash) {
                    String hex = Integer.toHexString(0xff & b);
                    if (hex.length() == 1) {
                        hexString.append('0');
                    }
                    hexString.append(hex);
                }
                return hexString.toString();
            } catch (NoSuchAlgorithmException e) {
                // Gestisci eventuali errori nell'ottenere l'algoritmo di hashing
                e.printStackTrace();
                return null;
            }
        }

}
