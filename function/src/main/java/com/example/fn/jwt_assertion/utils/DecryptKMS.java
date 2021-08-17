/*
Copyright (c) 2021, Oracle and/or its affiliates.
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
*/
package com.example.fn.jwt_assertion.utils;


import java.io.ByteArrayInputStream;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.interfaces.RSAPrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;
import java.util.logging.Logger;
import java.util.logging.Level;

import com.oracle.bmc.auth.AbstractAuthenticationDetailsProvider;
import com.oracle.bmc.auth.ResourcePrincipalAuthenticationDetailsProvider;
import com.oracle.bmc.keymanagement.KmsCryptoClient;
import com.oracle.bmc.keymanagement.model.DecryptDataDetails;
import com.oracle.bmc.keymanagement.requests.DecryptRequest;
import com.oracle.bmc.keymanagement.responses.DecryptResponse;

public class DecryptKMS {
    private  static final Logger LOGGER = Logger.getLogger(ResourceServerConfig.LOGGER_NAME);

    private KmsCryptoClient cryptoClient;
    public DecryptKMS(String kmsEndpoint){
        AbstractAuthenticationDetailsProvider provider = null;
        provider = ResourcePrincipalAuthenticationDetailsProvider.builder().build();
        cryptoClient = KmsCryptoClient.builder().endpoint(kmsEndpoint).build(provider);
    }

    public String decodeKMSString(String kmsKeyOCID,String encryptedText)  {

        if (LOGGER.isLoggable(Level.FINEST)) {
            LOGGER.finest("Decrypting string");
        }
        DecryptDataDetails decryptDataDetails = DecryptDataDetails.builder().keyId(kmsKeyOCID).ciphertext(encryptedText).build();
        DecryptRequest decryptRequest = DecryptRequest.builder().decryptDataDetails(decryptDataDetails).build();
        DecryptResponse decryptResponse = cryptoClient.decrypt(decryptRequest);
        String decryptedDEK = decryptResponse.getDecryptedData().getPlaintext();
        String plainText=  new String (Base64.getDecoder().decode(decryptedDEK.getBytes()));
        if (LOGGER.isLoggable(Level.FINEST)) {
            LOGGER.finest("String decrypted");
        }
        return plainText;
    }

    public X509Certificate decodeCert(String kmsKeyOCID,String encryptedCert) throws CertificateException {

        if (LOGGER.isLoggable(Level.FINEST)) {
            LOGGER.finest("Decrypting Cert");
        }
        DecryptDataDetails decryptDataDetails = DecryptDataDetails.builder().keyId(kmsKeyOCID).ciphertext(encryptedCert).build();
        DecryptRequest decryptRequest = DecryptRequest.builder().decryptDataDetails(decryptDataDetails).build();
        DecryptResponse decryptResponse = cryptoClient.decrypt(decryptRequest);
        String decryptedDEK = decryptResponse.getDecryptedData().getPlaintext();
        if (LOGGER.isLoggable(Level.FINEST)) {
            LOGGER.finest("Encoded cert string:" + decryptedDEK);
        }
        // The decrypted bytes have to be Base64 decoded because the Cert PEM file had to be encoded to load it to the vault
        byte[] certBytes = Base64.getDecoder().decode(decryptedDEK.getBytes());
        ByteArrayInputStream fis = new ByteArrayInputStream(certBytes);
        CertificateFactory cf = CertificateFactory.getInstance("X.509");
        X509Certificate cert = (X509Certificate) cf.generateCertificate(fis);
        if (LOGGER.isLoggable(Level.FINEST)) {
            LOGGER.finest("Cert Decrypted");
        }
        return cert;
    }

    public RSAPrivateKey decodeKey(String kmsKeyOCID,String encryptedKey) throws GeneralSecurityException {

        DecryptDataDetails decryptDataDetails = DecryptDataDetails.builder().keyId(kmsKeyOCID).ciphertext(encryptedKey).build();
        DecryptRequest decryptRequest = DecryptRequest.builder().decryptDataDetails(decryptDataDetails).build();
        DecryptResponse decryptResponse = cryptoClient.decrypt(decryptRequest);
        String decryptedDEK = decryptResponse.getDecryptedData().getPlaintext();
        if (LOGGER.isLoggable(Level.FINEST)) {
            LOGGER.finest("Encoded key string:" + decryptedDEK);
        }
        // The decrypted bytes have to be Base64 decoded because the key PEM file had to be encoded to load it to the vault
        byte[] keyBytes = Base64.getDecoder().decode(decryptedDEK);
        RSAPrivateKey key = getPrivateKey(keyBytes);
        if (LOGGER.isLoggable(Level.FINEST)) {
            LOGGER.finest("Key Decrypted");
        }
        return key;
    }

    private static RSAPrivateKey getPrivateKey(byte[] key) throws GeneralSecurityException {
        // First, the begin and end lines have to be removed
        final String PEM_PRIVATE_START = "-----BEGIN PRIVATE KEY-----";
        final String PEM_PRIVATE_END = "-----END PRIVATE KEY-----";
        String keyString = new String(key);
        if (LOGGER.isLoggable(Level.FINEST)) {
            LOGGER.finest("key string: " + keyString);
        }
        keyString = keyString.replace(PEM_PRIVATE_START, "").replace(PEM_PRIVATE_END, "");
        keyString = keyString.replaceAll("\\s", "");
        // Now decode the key itself back into binary
        byte[] encoded = Base64.getDecoder().decode(keyString);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(encoded);
        return(RSAPrivateKey) kf.generatePrivate(keySpec);
    }

}