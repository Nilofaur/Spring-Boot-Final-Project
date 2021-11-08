package PasswordEncryption;

import org.mindrot.jbcrypt.BCrypt;

/**
 * A utility class which is used to hash password using BCrypt algorithm.
 */
public final class BCryptUtil {
  
    /**
     * Encrypts a given password.
     *
     * @param password Password to encrypt.
     * @return Hashed version of the password.
     */
    public static String hash(String password) {

        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    /**
     * Verifies that the given password matches the given hash.
     *
     * @param password Password to verify.
     * @param hash     Hash to compare the password to.
     * @return True if the password matches the given hash; false otherwise.
     */
    public static boolean verifyHash(String password, String hash) {
        
        return BCrypt.checkpw(password, hash);
    }
}
