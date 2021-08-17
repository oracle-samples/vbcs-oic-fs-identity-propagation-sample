/*
Copyright (c) 2021, Oracle and/or its affiliates.
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
*/
package com.example.fn.jwt_assertion.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateEncodingException;
import java.security.cert.X509Certificate;
import java.security.interfaces.RSAPrivateKey;
import java.util.Date;
import java.util.UUID;
import java.util.logging.Logger;
import java.util.logging.Level;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWSHeader;
import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.JWSSigner;
import com.nimbusds.jose.crypto.RSASSASigner;
import com.nimbusds.jose.util.Base64URL;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;

public class JwtAssertion {

    private static final Logger LOGGER = java.util.logging.Logger.getLogger(ResourceServerConfig.LOGGER_NAME);

    private static final String KEY_ALIAS = "testKey";
    private static final long EXPIRY_DURATION = 3600L * 1000;
    private static final String SHA256 = "SHA-256";

    private String tokenIssuer;
    private String audience;
    private String clientId;
    private X509Certificate signingCert;
    private RSAPrivateKey privateKey;

    protected String header;
    protected String payload;
    protected String encodedSignature;
    protected String encodedHeaderPayload;
    protected String assertion;

    protected String stripeName;
    protected String keyStoreName;
    protected String credentialMapName;

    public JwtAssertion() {}

    public JwtAssertion(String clientId, String tokenIssuer, String audience, X509Certificate cert, RSAPrivateKey privateKey) {
        this.clientId = clientId;
        this.tokenIssuer = tokenIssuer;
        this.audience = audience;
        this.signingCert = cert;
        this.privateKey = privateKey;
        this.assertion = buildClientAssertion(null);
    }

    private String buildClientAssertion(String userName) {

        String assertionJWT = null;
        try {
            JWSHeader jwsHeader = null;
            Base64URL base64X5T256Url = base64urlThumbprint(signingCert, SHA256);

            jwsHeader = new JWSHeader.Builder(JWSAlgorithm.RS256)
                        .keyID(KEY_ALIAS)
                        .x509CertSHA256Thumbprint(base64X5T256Url)
                        .build();

            if (LOGGER.isLoggable(Level.FINE)) {
                LOGGER.fine("JWS Header: " + jwsHeader.toString());
            }

            JWTClaimsSet jwtClaimsSet = buildJWTClaimSet(userName);

            if (LOGGER.isLoggable(Level.FINE)) {
                LOGGER.fine("JWT Claims Set: " + jwtClaimsSet.toString()); 
            }

            assertionJWT = this.generateAndSignJWTAssertion(jwsHeader, jwtClaimsSet);

            if (LOGGER.isLoggable(Level.FINE)) {
                LOGGER.fine("JWT Assertion: " + this.assertion);
            }
        } catch (JOSEException e) {
            LOGGER.severe("Exception occurred while building assertion");
        } catch (NoSuchAlgorithmException e) {
            LOGGER.severe("Exception occurred while building assertion, no such algorithm");
        } catch (CertificateEncodingException e) {
            LOGGER.severe("Exception occurred while building assertion");
        }
        return assertionJWT;
    }

    public String getClientAssertion() {
        return this.assertion;
    }

    public String getUserAssertion(String userName) {
        return buildClientAssertion(userName);
    }

    private String generateAndSignJWTAssertion(JWSHeader jwsHeader, JWTClaimsSet claimsSet) throws JOSEException {

        if (LOGGER.isLoggable(Level.FINE)) {
            LOGGER.fine("Generating and signing assertion...");
        }

        JWSSigner signer = new RSASSASigner(privateKey);
        SignedJWT signedJWT = new SignedJWT(jwsHeader, claimsSet);
        signedJWT.sign(signer);
        return signedJWT.serialize();
    }

    private Base64URL base64urlThumbprint(X509Certificate certificate, String hashAlg)
    throws NoSuchAlgorithmException, CertificateEncodingException {
        final byte[] digest;

        byte[] certificateEncoded = certificate.getEncoded();
        MessageDigest msgDigest = MessageDigest.getInstance(hashAlg);
        digest = msgDigest.digest(certificateEncoded);

        return Base64URL.encode(digest);
    }

    private JWTClaimsSet buildJWTClaimSet(String userName) {
        JWTClaimsSet.Builder jwtClaims = new JWTClaimsSet.Builder();
        jwtClaims.issuer(tokenIssuer);
        if (userName != null) {
            jwtClaims.subject(userName);
        } else {
            jwtClaims.subject(clientId);
        }
        jwtClaims.audience(audience);
        jwtClaims.expirationTime(new Date(new Date().getTime() + EXPIRY_DURATION));
        jwtClaims.issueTime(new Date());
        jwtClaims.jwtID(UUID.randomUUID().toString());
        return jwtClaims.build();
    }
}
