<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (C) 2021, Oracle and/or its affiliates.  
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
-->
<xsl:stylesheet xmlns:ns2="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetFAPersonDetails" xmlns:nsmpr0="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetFAPersonAndAbsenceDetails" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:nssrcmpr="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST/types" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:nstrgdfl="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails/types" xmlns:nstrgmpr="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST/types" xmlns:nssrcdfl="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails/types" xmlns:ns1="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nsmpr1="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST" xmlns:ignore01="http://www.oracle.com/XSL/Transform/java" xmlns:nsmpr2="http://www.oracle.com/2014/03/ic/integration/metadata" xmlns:ns24="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAndAbsenceDetails_REQUEST/RESTINREQ" xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd" xmlns:orajs8="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath1616321483" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns21="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAndAbsenceDetails_REQUEST/RESTINRES" xmlns:orajs6="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath942231580" xmlns:ns29="http://xml.oracle.com/types/REST/GetFAPersonDetails_REQUEST" xmlns:connprop="http://xmlns.oracle.com/cloud/adapter/connectivityproperties" xmlns:orajs0="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath1510397549" xmlns:orajs5="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath711235520" xmlns:ns28="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST/request/types" xmlns:orajs10="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath2039301551" xmlns:orajs4="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath169588523" xmlns:ns23="http://xml.oracle.com/adapters/extension" xmlns:orajs9="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath151171120" xmlns:orajs3="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath86288" xmlns:orajs1="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath479716033" xmlns:orajs2="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath268782304" xmlns:orajs7="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath565719231" xmlns:ns3="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.resources.icsxpathfunctions.ICSInstanceTrackingFunctions" xmlns:ns26="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonDetails_REQUEST/RESTOUTREQ" xmlns:ns27="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonDetails_REQUEST/RESTOUTRES" xmlns:ns0="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns45="http://xmlns.oracle.com/procmon" xmlns:ns46="http://xmlns.oracle.com/ics/tracking/ics_tracking_context.xsd" version="2.0" xml:id="id_1" exclude-result-prefixes=" nsmpr0 oraext xsd xp20 nssrcmpr nssrcdfl ora oracle-xsl-mapper xsi fn xsl nsmpr1 ignore01" ignore01:ignorexmlids="true">
  <oracle-xsl-mapper:schema xml:id="id_2">
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources xml:id="id_3">
      <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
        <oracle-xsl-mapper:schema location="../../application_18/outbound_19/resourcegroup_20/GetFAPersonAndAbsenceDetails_REQUEST.wsdl" xml:id="id_5"/>
        <oracle-xsl-mapper:rootElement name="execute" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST/types" xml:id="id_6"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets xml:id="id_7">
      <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
        <oracle-xsl-mapper:schema location="../../application_83/inbound_84/resourcegroup_85/GetFAPersonDetails_REQUEST.wsdl" xml:id="id_9"/>
        <oracle-xsl-mapper:rootElement name="execute" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST/types" xml:id="id_10"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.2.0.0-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="bearer_token" xml:id="id_29"/>
  <xsl:template match="/" xml:id="id_11">
    <nstrgmpr:execute xml:id="id_12">
      <nstrgmpr:HTTPHeaders xml:id="id_34">
        <ns28:StandardHTTPHeaders xml:id="id_35">
          <ns28:Authorization xml:id="id_36">
            <xsl:value-of xml:id="id_37" select="$bearer_token"/>
          </ns28:Authorization>
        </ns28:StandardHTTPHeaders>
      </nstrgmpr:HTTPHeaders>
      <nstrgmpr:QueryParameters xml:id="id_21">
        <ns29:q xml:id="id_22">
          <xsl:value-of xml:id="id_23" select="concat (&quot;WorkEmail='&quot;, /nssrcmpr:execute/nssrcdfl:request-wrapper/nssrcdfl:workEmail, &quot;'&quot; )"/>
        </ns29:q>
        <ns29:onlyData xml:id="id_24">true</ns29:onlyData>
      </nstrgmpr:QueryParameters>
      <ns26:ConnectivityProperties xml:id="id_46">
        <ns26:RestAPI xml:id="id_47">
          <ns26:BaseURI xml:id="id_48">
            <xsl:value-of xml:id="id_49" select="dvm:lookupValue (&quot;tenant/resources/dvms/IdentityPropagationEndpoints&quot;, &quot;RESTConnection&quot;, &quot;FA_REST&quot;, &quot;BaseUri&quot;, &quot;BaseUri Lookup Not Found&quot; )"/>
          </ns26:BaseURI>
        </ns26:RestAPI>
      </ns26:ConnectivityProperties>
    </nstrgmpr:execute>
  </xsl:template>
</xsl:stylesheet>
