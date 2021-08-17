/*
Copyright (c) 2021, Oracle and/or its affiliates.
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
*/
package com.example.fn.jwt_assertion;


import com.example.fn.jwt_assertion.utils.JwtAssertion;
import com.example.fn.jwt_assertion.utils.ResourceServerConfig;
import com.fnproject.fn.api.FnConfiguration;
import com.fnproject.fn.api.RuntimeContext;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class AssertionCreator {

    private  static final Logger LOGGER = Logger.getLogger(ResourceServerConfig.LOGGER_NAME);
    private static ResourceServerConfig rsc;

    /**
     * @param ctx : Runtime context passed in by Fn, used to set default parameters
     */
    @FnConfiguration
    public void config(RuntimeContext ctx) {
        rsc = new ResourceServerConfig(ctx);
        LOGGER.setLevel(Level.parse(rsc.DEBUG_LEVEL));

    }


    public static class Input {
        private String principal;
        private String[] scopes;

        public String getPrincipal() {
            return principal;
        }

        public void setPrincipal(String principal) {
            this.principal = principal;
        }

        public String[] getScopes() {
            return scopes;
        }

        public void setScopes(String[] scopes) {
            this.scopes = scopes;
        }
    }
    public static class Result {
        // required
        private String assertion;

        public String getAssertion() {
            return assertion;
        }

        public void setAssertion(String assertion) {
            this.assertion = assertion;
        }

    }


    /**
     *  Main function called to authenticate user
     * @param input
     * @return
     */
    public Result handleRequest(Input input) {

        String userid = null;
        String[] requestedScopes = null;

        if (input==null) {
            throw new IllegalArgumentException ("userid input required");
        }
        userid = input.getPrincipal();
        if (userid == null) {
            throw new IllegalArgumentException ("userid input required");
        }
        if (LOGGER.isLoggable(Level.FINE)) {
            LOGGER.fine("Assertion requested for " + userid);
        }

        requestedScopes = input.getScopes();

        if (LOGGER.isLoggable(Level.FINE)) {
            LOGGER.fine("Requested scopes: ");
        }

        String scopeStr = "";
        int i = 0;
        for (String scope : requestedScopes) {
            if (LOGGER.isLoggable(Level.FINE)) {
                LOGGER.fine(scope);
            }
            scopeStr += scope;
            if (++i < requestedScopes.length) {
                scopeStr += "%20";
            }

        }

        JwtAssertion jwtAssertion = new JwtAssertion(rsc.CLIENT_ID, rsc.ISSUER_NAME, rsc.AUDIENCE, rsc.SIGNING_CERT, rsc.PRIVATE_KEY);
        String userAssertion = jwtAssertion.getUserAssertion(userid);
        String postBody = "grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&" + 
                          "assertion=" + userAssertion + "&" +
                          "client_id=" + rsc.CLIENT_ID + "&" +
                          "client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer&" +
                          "client_assertion=" + jwtAssertion.getClientAssertion();

        if (!scopeStr.equals("")) {
            postBody += "&scope="+scopeStr;
        }

        Result result = new Result();
        result.setAssertion(postBody);
        return result;
    }

}