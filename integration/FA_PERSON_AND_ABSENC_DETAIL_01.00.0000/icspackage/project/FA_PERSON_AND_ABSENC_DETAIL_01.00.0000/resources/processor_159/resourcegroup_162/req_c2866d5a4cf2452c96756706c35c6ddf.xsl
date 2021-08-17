<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (C) 2021, Oracle and/or its affiliates.  
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
-->
<xsl:stylesheet xmlns:ns2="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetFAPersonAndAbsenceDetails" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:nstrgmpr="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST/types" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:nstrgdfl="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails/types" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns1="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST" xmlns:ignore01="http://www.oracle.com/XSL/Transform/java" xmlns:nsmpr0="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAbsences_REQUEST/types" xmlns:nsmpr1="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST/types" xmlns:nsmpr2="http://www.oracle.com/2014/03/ic/integration/metadata" xmlns:ns22="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAndAbsenceDetails_REQUEST/RESTINREQ" xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd" xmlns:orajs8="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath1616321483" xmlns:ns19="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAndAbsenceDetails_REQUEST/RESTINRES" xmlns:orajs6="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath942231580" xmlns:orajs5="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath711235520" xmlns:ns34="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST/request/types" xmlns:orajs10="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath2039301551" xmlns:ns27="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAbsences_REQUEST/request/types" xmlns:orajs4="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath169588523" xmlns:ns21="http://xml.oracle.com/adapters/extension" xmlns:ns31="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetFAPersonDetails" xmlns:orajs9="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath151171120" xmlns:ns32="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonDetails_REQUEST/RESTOUTREQ" xmlns:ns33="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonDetails_REQUEST/RESTOUTRES" xmlns:ns25="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAbsences/types" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns35="http://xml.oracle.com/types/REST/GetFAPersonDetails_REQUEST" xmlns:ns23="http://xmlns.oracle.com/cloud/generic/rest/fault/REST/GetFAPersonAbsences" xmlns:ns30="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails/types" xmlns:connprop="http://xmlns.oracle.com/cloud/adapter/connectivityproperties" xmlns:orajs0="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath1510397549" xmlns:ns28="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAbsences_REQUEST/RESTOUTREQ" xmlns:ns29="http://xmlns.oracle.com/cloud/adapter/connectivityproperties/REST/GetFAPersonAbsences_REQUEST/RESTOUTRES" xmlns:ns26="http://xml.oracle.com/types/REST/GetFAPersonAbsences_REQUEST" xmlns:orajs3="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath86288" xmlns:orajs1="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath479716033" xmlns:orajs2="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath268782304" xmlns:orajs7="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.JsExecutor_xpath565719231" xmlns:ns3="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.resources.icsxpathfunctions.ICSInstanceTrackingFunctions" xmlns:ns0="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" version="2.0" xml:id="id_1" exclude-result-prefixes=" oraext xsd xp20 ora oracle-xsl-mapper xsi fn xsl ignore01" ignore01:ignorexmlids="true">
  <oracle-xsl-mapper:schema xml:id="id_2">
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources xml:id="id_3">
      <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
        <oracle-xsl-mapper:schema location="../../application_18/outbound_19/resourcegroup_20/GetFAPersonAndAbsenceDetails_REQUEST.wsdl" xml:id="id_5"/>
        <oracle-xsl-mapper:rootElement name="execute" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST/types" xml:id="id_6"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL" xml:id="id_21">
        <oracle-xsl-mapper:schema location="../../application_83/inbound_84/resourcegroup_85/GetFAPersonDetails_REQUEST.wsdl" xml:id="id_22"/>
        <oracle-xsl-mapper:rootElement name="executeResponse" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonDetails_REQUEST/types" xml:id="id_23"/>
        <oracle-xsl-mapper:param name="GetFAPersonDetails" xml:id="id_24"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL" xml:id="id_48">
        <oracle-xsl-mapper:schema location="../../application_135/inbound_136/resourcegroup_137/GetFAPersonAbsences_REQUEST.wsdl" xml:id="id_49"/>
        <oracle-xsl-mapper:rootElement name="executeResponse" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAbsences_REQUEST/types" xml:id="id_50"/>
        <oracle-xsl-mapper:param name="GetFAPersonAbsences" xml:id="id_51"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets xml:id="id_7">
      <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
        <oracle-xsl-mapper:schema location="../../application_18/outbound_19/resourcegroup_20/GetFAPersonAndAbsenceDetails_REQUEST.wsdl" xml:id="id_9"/>
        <oracle-xsl-mapper:rootElement name="executeResponse" namespace="http://xmlns.oracle.com/cloud/adapter/REST/GetFAPersonAndAbsenceDetails_REQUEST/types" xml:id="id_10"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.2.0.0-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="GetFAPersonDetails" xml:id="id_35"/>
  <xsl:param name="GetFAPersonAbsences" xml:id="id_64"/>
  <xsl:template match="/" xml:id="id_11">
    <nstrgmpr:executeResponse xml:id="id_12">
      <nstrgdfl:response-wrapper xml:id="id_42">
        <nstrgdfl:items xml:id="id_43">
          <nstrgdfl:FirstName xml:id="id_44">
            <xsl:value-of xml:id="id_45" select="$GetFAPersonDetails/nsmpr1:executeResponse/ns30:response-wrapper/ns30:items/ns30:FirstName"/>
          </nstrgdfl:FirstName>
          <nstrgdfl:LastName xml:id="id_46">
            <xsl:value-of xml:id="id_47" select="$GetFAPersonDetails/nsmpr1:executeResponse/ns30:response-wrapper/ns30:items/ns30:LastName"/>
          </nstrgdfl:LastName>
          <nstrgdfl:WorkPhoneAreaCode xml:id="id_72">
            <xsl:value-of xml:id="id_73" select="$GetFAPersonDetails/nsmpr1:executeResponse/ns30:response-wrapper/ns30:items/ns30:WorkPhoneAreaCode"/>
          </nstrgdfl:WorkPhoneAreaCode>
          <nstrgdfl:WorkPhoneNumber xml:id="id_74">
            <xsl:value-of xml:id="id_75" select="$GetFAPersonDetails/nsmpr1:executeResponse/ns30:response-wrapper/ns30:items/ns30:WorkPhoneNumber"/>
          </nstrgdfl:WorkPhoneNumber>
          <nstrgdfl:HireDate xml:id="id_76">
            <xsl:value-of xml:id="id_77" select="$GetFAPersonDetails/nsmpr1:executeResponse/ns30:response-wrapper/ns30:items/ns30:HireDate"/>
          </nstrgdfl:HireDate>
          <xsl:for-each xml:id="id_79" select="$GetFAPersonAbsences/nsmpr0:executeResponse/ns25:response-wrapper/ns25:items">
            <nstrgdfl:abscences xml:id="id_80">
              <nstrgdfl:approvalStatusCd xml:id="id_81">
                <xsl:value-of xml:id="id_82" select="ns25:approvalStatusCd"/>
              </nstrgdfl:approvalStatusCd>
              <nstrgdfl:createdBy xml:id="id_83">
                <xsl:value-of xml:id="id_84" select="ns25:createdBy"/>
              </nstrgdfl:createdBy>
              <nstrgdfl:creationDate xml:id="id_85">
                <xsl:value-of xml:id="id_86" select="ns25:creationDate"/>
              </nstrgdfl:creationDate>
              <nstrgdfl:endDate xml:id="id_87">
                <xsl:value-of xml:id="id_88" select="ns25:endDate"/>
              </nstrgdfl:endDate>
              <nstrgdfl:endTime xml:id="id_89">
                <xsl:value-of xml:id="id_90" select="ns25:endTime"/>
              </nstrgdfl:endTime>
              <nstrgdfl:personAbsenceEntryId xml:id="id_91">
                <xsl:value-of xml:id="id_92" select="ns25:personAbsenceEntryId"/>
              </nstrgdfl:personAbsenceEntryId>
              <nstrgdfl:startDate xml:id="id_93">
                <xsl:value-of xml:id="id_94" select="ns25:startDate"/>
              </nstrgdfl:startDate>
              <nstrgdfl:startTime xml:id="id_95">
                <xsl:value-of xml:id="id_96" select="ns25:startTime"/>
              </nstrgdfl:startTime>
              <nstrgdfl:submittedDate xml:id="id_97">
                <xsl:value-of xml:id="id_98" select="ns25:submittedDate"/>
              </nstrgdfl:submittedDate>
            </nstrgdfl:abscences>
          </xsl:for-each>
        </nstrgdfl:items>
      </nstrgdfl:response-wrapper>
    </nstrgmpr:executeResponse>
  </xsl:template>
</xsl:stylesheet>
