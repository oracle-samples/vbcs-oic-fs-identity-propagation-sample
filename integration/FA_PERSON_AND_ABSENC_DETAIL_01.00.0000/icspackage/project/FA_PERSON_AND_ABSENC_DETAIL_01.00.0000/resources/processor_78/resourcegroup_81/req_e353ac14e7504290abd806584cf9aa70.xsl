<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (C) 2021, Oracle and/or its affiliates.  
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
-->
<xsl:stylesheet xmlns:ns2="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetFAPersonAndAbsenceDetails" xmlns:ns1="http://xmlns.oracle.com/cloud/adapter/REST/GetUserAssertionJWT_REQUEST" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:nssrcmpr="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST/types" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:nstrgmpr="http://xmlns.oracle.com/cloud/adapter/REST/GetUserAssertionJWT_REQUEST/types" xmlns:nssrcdfl="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails/types" xmlns:nstrgdfl="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetUserAssertionJWT" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nsmpr0="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST" xmlns:ignore01="http://www.oracle.com/XSL/Transform/java" xmlns:nsmpr1="http://xmlns.oracle.com/cloud/adapter/REST/GetAssertionPayload_REQUEST/types" xmlns:nsmpr2="http://www.oracle.com/2014/03/ic/integration/metadata" xmlns:ns24="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAndAbsenceDetails_REQUEST/RESTINREQ" xmlns:ns31="http://xmlns.oracle.com/cloud/adapter/REST/GetUserAssertionJWT/types" xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd" xmlns:orajs8="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath1616321483" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns21="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAndAbsenceDetails_REQUEST/RESTINRES" xmlns:orajs6="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath942231580" xmlns:connprop="http://xmlns.oracle.com/cloud/adapter/connectivityproperties" xmlns:orajs0="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath1510397549" xmlns:orajs5="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath711235520" xmlns:orajs10="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath2039301551" xmlns:orajs3="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath169588523" xmlns:ns23="http://xml.oracle.com/adapters/extension" xmlns:ns25="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetAssertionPayload" xmlns:ns27="http://xmlns.oracle.com/cloud/adapter/REST/GetAssertionPayload/types" xmlns:orajs9="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath151171120" xmlns:ns32="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetUserAssertionJWT_REQUEST/RESTOUTREQ" xmlns:orajs4="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath86288" xmlns:orajs1="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath479716033" xmlns:orajs2="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath268782304" xmlns:orajs7="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath565719231" xmlns:ns33="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetUserAssertionJWT_REQUEST/RESTOUTRES" xmlns:ns3="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.resources.icsxpathfunctions.ICSInstanceTrackingFunctions" xmlns:ns30="http://xmlns.oracle.com/cloud/ics/binary/v1/types" xmlns:ns0="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:ns28="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetAssertionPayload_REQUEST/RESTOUTREQ" xmlns:ns29="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetAssertionPayload_REQUEST/RESTOUTRES" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns49="http://xmlns.oracle.com/procmon" xmlns:ns50="http://xmlns.oracle.com/ics/tracking/ics_tracking_context.xsd" xmlns:ns51="http://xmlns.oracle.com/cloud/adapter/REST/GetUserAssertionJWT_REQUEST/request/types" version="2.0" xml:id="id_1" exclude-result-prefixes=" ns2 oraext xsd xp20 nssrcmpr nssrcdfl ora oracle-xsl-mapper xsi fn xsl nsmpr0 ignore01" ignore01:ignorexmlids="true">
  <oracle-xsl-mapper:schema xml:id="id_2">
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources xml:id="id_3">
      <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
        <oracle-xsl-mapper:schema location="../../application_18/outbound_19/resourcegroup_20/GetFAPersonAndAbsenceDetails_REQUEST.wsdl" xml:id="id_5"/>
        <oracle-xsl-mapper:rootElement name="execute" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST/types" xml:id="id_6"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL" xml:id="id_13">
        <oracle-xsl-mapper:schema location="../../application_44/inbound_45/resourcegroup_46/GetAssertionPayload_REQUEST.wsdl" xml:id="id_14"/>
        <oracle-xsl-mapper:rootElement name="executeResponse" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetAssertionPayload_REQUEST/types" xml:id="id_15"/>
        <oracle-xsl-mapper:param name="GetAssertionPayload" xml:id="id_16"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets xml:id="id_7">
      <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
        <oracle-xsl-mapper:schema location="../../application_66/inbound_67/resourcegroup_68/GetUserAssertionJWT_REQUEST.wsdl" xml:id="id_9"/>
        <oracle-xsl-mapper:rootElement name="execute" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetUserAssertionJWT_REQUEST/types" xml:id="id_10"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.2.0.0-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="GetAssertionPayload" xml:id="id_25"/>
  <xsl:template match="/" xml:id="id_11">
    <nstrgmpr:execute xml:id="id_12">
      <ns30:streamReference xml:id="id_86">
        <xsl:value-of xml:id="id_87" select="oraext:decodeBase64ToReference (oraext:encodeBase64 ($GetAssertionPayload/nsmpr1:executeResponse/ns27:response-wrapper/ns27:assertion ) )"/>
      </ns30:streamReference>
      <ns32:ConnectivityProperties xml:id="id_82">
        <ns32:RestAPI xml:id="id_83">
          <ns32:BaseURI xml:id="id_84">
            <xsl:value-of xml:id="id_85" select="dvm:lookupValue (&quot;tenant/resources/dvms/IdentityPropagationEndpoints&quot;, &quot;RESTConnection&quot;, &quot;FA_IDCS&quot;, &quot;BaseUri&quot;, &quot;BaseUri Lookup Not Found&quot; )"/>
          </ns32:BaseURI>
        </ns32:RestAPI>
      </ns32:ConnectivityProperties>
    </nstrgmpr:execute>
  </xsl:template>
</xsl:stylesheet>
