/*
Copyright (c) 2021, Oracle and/or its affiliates.
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
*/
package com.example.fn.jwt_assertion.utils;

import com.fnproject.fn.api.RuntimeContext;

import java.security.cert.X509Certificate;
import java.security.cert.CertificateException;
import java.security.GeneralSecurityException;
import java.security.interfaces.RSAPrivateKey;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 * It contains the resource server configuration and constants
 * Like a properties file, but simpler
 */
public class ResourceServerConfig {



    public  final String CLIENT_ID;
    public  final String ISSUER_NAME;
    public  final String AUDIENCE;
    public  final X509Certificate SIGNING_CERT;
    public  final RSAPrivateKey PRIVATE_KEY;
    public static final String LOGGER_NAME = "JWT_ASSERTER";

    //INFORMATION ABOUT IDENTITY CLOUD SERVICES
    public final String KMS_ENDPOINT;
    public final String KMS_SECRET_KEY;
    public final String DEBUG_LEVEL;


    /**
     * Gets defaults out of Oracle Functions Configuration
     */
    private  static final Logger LOGGER = Logger.getLogger(LOGGER_NAME);

    public ResourceServerConfig(RuntimeContext ctx)   {
        // Get config variables from Functions Configuration

        CLIENT_ID = ctx.getConfigurationByKey("clientid").orElseThrow();
        AUDIENCE = ctx.getConfigurationByKey("audience").orElseThrow();
        ISSUER_NAME = ctx.getConfigurationByKey("issuer_name").orElseThrow();

        DEBUG_LEVEL = ctx.getConfigurationByKey("debug_level").orElse("INFO");

        // KMS Key for IDCS Client Secret
        KMS_ENDPOINT = ctx.getConfigurationByKey("kms_endpoint").orElseThrow();
        KMS_SECRET_KEY= ctx.getConfigurationByKey("kms_secret_key").orElseThrow();

        DecryptKMS kms = new DecryptKMS(KMS_ENDPOINT);

        try {
            // Decode the cert using KMS
            SIGNING_CERT = kms.decodeCert(KMS_SECRET_KEY,ctx.getConfigurationByKey("encrypted_cert").orElseThrow());
        } catch (CertificateException ce) {
            LOGGER.severe("Invalid certificate");
            throw new IllegalArgumentException(ce.getMessage());
        }

        try {
            // Decode the key using KMS
            PRIVATE_KEY = kms.decodeKey(KMS_SECRET_KEY,ctx.getConfigurationByKey("encrypted_key").orElseThrow());
        } catch (GeneralSecurityException gse) {
            LOGGER.severe("Invalid key");
            throw new IllegalArgumentException(gse.getMessage());
        }

        LOGGER.info("IDCS Configuration Data read : ISSUER_NAME=[" + ISSUER_NAME + "], CLIENT_ID=["+CLIENT_ID+"], AUDIENCE=["+AUDIENCE+"], DEBUG_LEVEL=["+DEBUG_LEVEL+"]");
    }
}
