package PasswordEncryption;


import main.model.entity.User;
import main.util.BCryptUtil;
import main.util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * A class that manages authorization. Contains operations such as logging in
 * and registering.
 *
 * @author Krzysztof Bielikowicz
 * @author Iwan Phillips
 */
public class AuthorizationManager {
    /**
     * Private constructor to disallow instantiating the class.
     */
    private AuthorizationManager() {
        throw new IllegalStateException("Manager class.");
    }

    // tracks the currently logged in user
    private static ObjectProperty<User> currentUser =
            new SimpleObjectProperty<>();

    /**
     * Sets currently logged in user.
     *
     * @param usr User.
     */
    public static void setCurrentUser(User usr) {
        currentUser.set(usr);
    }

    /**
     * Returns currently logged in User.
     *
     * @return User
     */
    public static User getCurrentUser() {
        return currentUser.get();
    }

    public static ObjectProperty<User> currentUserProperty() {
        return currentUser;
    }

    /**
     * Attempts to log in a user.
     *
     * @param username Username of the user trying to log in.
     * @param password Password of the user trying to log in.
     * @throws ClassNotFoundException Thrown when an error occurred while
     *                                connecting to the database.
     * @throws SQLException           Thrown when an error occurred while
     *                                querying the database.
     * @throws IllegalStateException  Thrown if the credentials are wrong.
     */
    public static void logIn(String username, String password) throws SQLException, ClassNotFoundException, IllegalStateException {
        User foundUser = UserManager.searchUser(username);

        if (foundUser == null) {
            throw new IllegalStateException("Invalid username");
        }

        if (!BCryptUtil.verifyHash(password, foundUser.getPassword())) {
            throw new IllegalStateException("Invalid password");
        } else {
            AuthorizationManager.setCurrentUser(foundUser);
        }
    }

    /**
     * Registers a new user in the system.
     *
     * @param username        Username of the new user.
     * @param password        Password of the new user.
     * @param firstName       Name of the new user.
     * @param lastName        Surname of the new user.
     * @param mobile          Mobile number of the new user.
     * @param house           House name or number of the new user.
     * @param street          Street name of the new user.
     * @param city            City of the new user.
     * @param postcode        Postcode of the new user.
     * @param profileImageURL URL of the new user's profile image.
     * @throws ClassNotFoundException Thrown when an error occurred while
     *                                connecting to the database.
     * @throws SQLException           Thrown when an error occurred while
     *                                querying the database.
     * @throws IllegalStateException  Thrown if the user already exists.
     */
    public static void register(String username, String password,
                                String firstName,
                                String lastName, String mobile, String house,
                                String street, String city, String postcode,
                                String profileImageURL) throws SQLException,
            ClassNotFoundException, IllegalStateException {
        if (UserManager.existsUser(username)) {
            throw new IllegalStateException("Username already taken!");
        }

        String encryptedPassword = BCryptUtil.hash(password);

        UserManager.addUser(username, encryptedPassword, firstName, lastName,
                mobile, house,
                street, city, postcode, profileImageURL, 0);
    }

    /**
     * Checks if current user is a librarian.
     *
     * @return True if current user is a librarian, false otherwise.
     * @throws ClassNotFoundException Thrown when an error occurred while
     *                                connecting to the database.
     * @throws SQLException           Thrown when an error occurred while
     *                                querying the database.
     */
    public static Boolean isLibrarian() throws ClassNotFoundException,
            SQLException {

        String sqlString =
                "SELECT * FROM Librarian WHERE Username ='" + getCurrentUser().getUsername() + "'";
        try {
            ResultSet rs = DBUtil.dbExecuteQuery(sqlString);
            return rs.next();
        } catch (SQLException e) {
            System.out.println("Could not check if user is a librarian.");
            throw e;
        }
    }

    /**
     * Checks if current user is the first user created.
     *
     * @return True if the current user is the only user in User table, false
     * otherwise.
     * @throws ClassNotFoundException Thrown when an error occurred while
     *                                connecting to the database.
     * @throws SQLException           Thrown when an error occurred while
     *                                querying the database.
     */
    public static Boolean first() throws ClassNotFoundException, SQLException {

        String sqlString = "SELECT * FROM Librarian";
        try {
            ResultSet rs = DBUtil.dbExecuteQuery(sqlString);
            return !rs.next();
        } catch (SQLException e) {
            System.out.println("Could not check if user is first created.");
            throw e;
        }
    }


}
