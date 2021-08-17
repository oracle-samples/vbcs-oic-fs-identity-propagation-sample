<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (C) 2021, Oracle and/or its affiliates.  
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
-->
<xsl:stylesheet xmlns:nstrgdfl="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAbsences/types" xmlns:ns2="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetFAPersonAndAbsenceDetails" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:nssrcmpr="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST/types" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns1="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAbsences_REQUEST" xmlns:nsmpr0="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetFAPersonAbsences" xmlns:nssrcdfl="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails/types" xmlns:nstrgmpr="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAbsences_REQUEST/types" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nsmpr1="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST" xmlns:ignore01="http://www.oracle.com/XSL/Transform/java" xmlns:nsmpr2="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST/types" xmlns:nsmpr3="http://www.oracle.com/2014/03/ic/integration/metadata" xmlns:ns25="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAndAbsenceDetails_REQUEST/RESTINREQ" xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd" xmlns:orajs8="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath1616321483" xmlns:ns22="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAndAbsenceDetails_REQUEST/RESTINRES" xmlns:orajs6="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath942231580" xmlns:orajs5="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath711235520" xmlns:ns31="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST/request/types" xmlns:orajs10="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath2039301551" xmlns:ns34="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAbsences_REQUEST/request/types" xmlns:orajs4="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath169588523" xmlns:ns24="http://xml.oracle.com/adapters/extension" xmlns:ns28="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetFAPersonDetails" xmlns:orajs9="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath151171120" xmlns:ns29="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonDetails_REQUEST/RESTOUTREQ" xmlns:ns30="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonDetails_REQUEST/RESTOUTRES" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns32="http://xml.oracle.com/types/REST/GetFAPersonDetails_REQUEST" xmlns:ns26="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails/types" xmlns:connprop="http://xmlns.oracle.com/cloud/adapter/connectivityproperties" xmlns:orajs0="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath1510397549" xmlns:ns35="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAbsences_REQUEST/RESTOUTREQ" xmlns:ns36="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAbsences_REQUEST/RESTOUTRES" xmlns:ns33="http://xml.oracle.com/types/REST/GetFAPersonAbsences_REQUEST" xmlns:orajs3="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath86288" xmlns:orajs1="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath479716033" xmlns:orajs2="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath268782304" xmlns:orajs7="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath565719231" xmlns:ns3="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.resources.icsxpathfunctions.ICSInstanceTrackingFunctions" xmlns:ns0="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns52="http://xmlns.oracle.com/procmon" xmlns:ns53="http://xmlns.oracle.com/ics/tracking/ics_tracking_context.xsd" version="2.0" xml:id="id_1" exclude-result-prefixes=" ns2 oraext xsd xp20 nssrcmpr nssrcdfl ora oracle-xsl-mapper xsi fn xsl nsmpr1 ignore01" ignore01:ignorexmlids="true">
  <oracle-xsl-mapper:schema xml:id="id_2">
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources xml:id="id_3">
      <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
        <oracle-xsl-mapper:schema location="../../application_18/outbound_19/resourcegroup_20/GetFAPersonAndAbsenceDetails_REQUEST.wsdl" xml:id="id_5"/>
        <oracle-xsl-mapper:rootElement name="execute" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST/types" xml:id="id_6"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL" xml:id="id_13">
        <oracle-xsl-mapper:schema location="../../application_83/inbound_84/resourcegroup_85/GetFAPersonDetails_REQUEST.wsdl" xml:id="id_14"/>
        <oracle-xsl-mapper:rootElement name="executeResponse" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST/types" xml:id="id_15"/>
        <oracle-xsl-mapper:param name="GetFAPersonDetails" xml:id="id_16"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets xml:id="id_7">
      <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
        <oracle-xsl-mapper:schema location="../../application_135/inbound_136/resourcegroup_137/GetFAPersonAbsences_REQUEST.wsdl" xml:id="id_9"/>
        <oracle-xsl-mapper:rootElement name="execute" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAbsences_REQUEST/types" xml:id="id_10"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.2.0.0-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="GetFAPersonDetails" xml:id="id_25"/>
  <xsl:param name="bearer_token" xml:id="id_27"/>
  <xsl:template match="/" xml:id="id_11">
    <nstrgmpr:execute xml:id="id_12">
      <nstrgmpr:HTTPHeaders xml:id="id_32">
        <ns34:StandardHTTPHeaders xml:id="id_33">
          <ns34:Authorization xml:id="id_34">
            <xsl:value-of xml:id="id_35" select="$bearer_token"/>
          </ns34:Authorization>
        </ns34:StandardHTTPHeaders>
      </nstrgmpr:HTTPHeaders>
      <nstrgmpr:QueryParameters xml:id="id_36">
        <ns33:q xml:id="id_37">
          <xsl:value-of xml:id="id_38" select="concat (&quot;personId ='&quot;, $GetFAPersonDetails/nsmpr2:executeResponse/ns26:response-wrapper/ns26:items/ns26:PersonId, &quot;'&quot; )"/>
        </ns33:q>
      </nstrgmpr:QueryParameters>
      <ns35:ConnectivityProperties xml:id="id_52">
        <ns35:RestAPI xml:id="id_53">
          <ns35:BaseURI xml:id="id_54">
            <xsl:value-of xml:id="id_55" select="dvm:lookupValue (&quot;tenant/resources/dvms/IdentityPropagationEndpoints&quot;, &quot;RESTConnection&quot;, &quot;FA_REST&quot;, &quot;BaseUri&quot;, &quot;BaseUri Lookup Not Found&quot; )"/>
          </ns35:BaseURI>
        </ns35:RestAPI>
      </ns35:ConnectivityProperties>
    </nstrgmpr:execute>
  </xsl:template>
</xsl:stylesheet>
