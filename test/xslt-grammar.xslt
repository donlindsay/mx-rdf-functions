<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" targetNamespace="http://www.w3.org/1999/XSL/Transform" elementFormDefault="qualified" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<xs:annotation>
  <xs:documentation>
  
    This is a schema for XSLT 2.0 stylesheets.
    
    It defines all the elements that appear in the XSLT namespace; it also
    provides hooks that allow the inclusion of user-defined literal result elements,
    extension instructions, and top-level data elements.
    
    The schema is derived (with kind permission) from a schema for XSLT 1.0 stylesheets
    produced by Asir S Vedamuthu of WebMethods Inc.
    
    This schema is available for use under the conditions of the W3C Software License
    published at http://www.w3.org/Consortium/Legal/copyright-software-19980720
    
    The schema is organized as follows:
    
    PART A: definitions of complex types and model groups used as the basis 
            for element definitions
    PART B: definitions of individual XSLT elements
    PART C: definitions for literal result elements
    PART D: definitions of simple types used in attribute definitions
    
    This schema does not attempt to define all the constraints that apply to a valid
    XSLT 2.0 stylesheet module. It is the intention that all valid stylesheet modules 
    should conform to this schema; however, the schema is non-normative and in the event 
    of any conflict, the text of the Recommendation takes precedence.

    This schema does not implement the special rules that apply when a stylesheet
    has sections that use forwards-compatible-mode. In this mode, setting version="3.0"
    allows elements from the XSLT namespace to be used that are not defined in XSLT 2.0.

    Simplified stylesheets (those with a literal result element as the outermost element)
    will validate against this schema only if validation starts in lax mode.
    
    This version is dated 2005-02-11
    Authors: Michael H Kay, Saxonica Limited
             Jeni Tennison, Jeni Tennison Consulting Ltd.
    
  </xs:documentation>
</xs:annotation>   
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
 
<!--
The declaration of xml:space and xml:lang may need to be commented out because
of problems processing the schema using various tools
-->
      
<xs:import namespace="http://www.w3.org/XML/1998/namespace" 
  schemaLocation="http://www.w3.org/2001/xml.xsd"/>

<!-- 
    An XSLT stylesheet may contain an in-line schema within an xsl:import-schema element,
    so the Schema for schemas needs to be imported
-->
  
<xs:import namespace="http://www.w3.org/2001/XMLSchema"
                  schemaLocation="http://www.w3.org/2001/XMLSchema.xsd"/>

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<xs:annotation>
  <xs:documentation>
    PART A: definitions of complex types and model groups used as the basis 
            for element definitions
  </xs:documentation>
</xs:annotation>   
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<xs:complexType name="generic-element-type" mixed="true">
  <xs:attribute name="default-collation" type="xsl:uri-list"/>
  <xs:attribute name="exclude-result-prefixes" type="xsl:prefix-list-or-all"/>
  <xs:attribute name="extension-element-prefixes" type="xsl:prefix-list"/>
  <xs:attribute name="use-when" type="xsl:expression"/>
  <xs:attribute name="xpath-default-namespace" type="xs:anyURI"/>
  <xs:anyAttribute namespace="##other" processContents="lax"/>
</xs:complexType>

<xs:complexType name="versioned-element-type" mixed="true">
  <xs:complexContent>
    <xs:extension base="xsl:generic-element-type">    
      <xs:attribute name="version" type="xs:decimal" use="optional"/>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>

<xs:complexType name="element-only-versioned-element-type" mixed="false">
  <xs:complexContent>
    <xs:restriction base="xsl:versioned-element-type">
      <xs:anyAttribute namespace="##other" processContents="lax"/>
    </xs:restriction>
  </xs:complexContent>
</xs:complexType>

<xs:complexType name="sequence-constructor">
  <xs:complexContent mixed="true">
    <xs:extension base="xsl:versioned-element-type">    
      <xs:group ref="xsl:sequence-constructor-group" minOccurs="0" maxOccurs="unbounded"/>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>

<xs:group name="sequence-constructor-group">
  <xs:choice>
    <xs:element ref="xsl:variable"/>
    <xs:element ref="xsl:instruction"/>
    <xs:group ref="xsl:result-elements"/>
  </xs:choice>
</xs:group>

<xs:element name="declaration" type="xsl:generic-element-type" abstract="true"/>

<xs:element name="instruction" type="xsl:versioned-element-type" abstract="true"/>

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<xs:annotation>
  <xs:documentation>
    PART B: definitions of individual XSLT elements    
    Elements are listed in alphabetical order.    
  </xs:documentation>
</xs:annotation>   
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<xs:element name="analyze-string" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:matching-substring" minOccurs="0"/>
          <xs:element ref="xsl:non-matching-substring" minOccurs="0"/>
          <xs:element ref="xsl:fallback" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="select" type="xsl:expression" use="required"/>
        <xs:attribute name="regex" type="xsl:avt" use="required"/>
        <xs:attribute name="flags" type="xsl:avt" default=""/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="apply-imports" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:with-param" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="apply-templates" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:choice minOccurs="0" maxOccurs="unbounded">
          <xs:element ref="xsl:sort"/>
          <xs:element ref="xsl:with-param"/>
        </xs:choice>
        <xs:attribute name="select" type="xsl:expression" default="child::node()"/>
        <xs:attribute name="mode" type="xsl:mode"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="attribute" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="name" type="xsl:avt" use="required"/>
        <xs:attribute name="namespace" type="xsl:avt"/>
        <xs:attribute name="select" type="xsl:expression"/>
        <xs:attribute name="separator" type="xsl:avt"/>   
        <xs:attribute name="type" type="xsl:QName"/>
        <xs:attribute name="validation" type="xsl:validation-type"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>        

<xs:element name="attribute-set" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:sequence minOccurs="0" maxOccurs="unbounded">
          <xs:element ref="xsl:attribute"/>
        </xs:sequence>
        <xs:attribute name="name" type="xsl:QName" use="required"/>
        <xs:attribute name="use-attribute-sets" type="xsl:QNames" default=""/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="call-template" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:with-param" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="name" type="xsl:QName" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="character-map" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:output-character" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="name" type="xsl:QName" use="required"/>
        <xs:attribute name="use-character-maps" type="xsl:QNames" default=""/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="choose" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:when" maxOccurs="unbounded"/>
          <xs:element ref="xsl:otherwise" minOccurs="0"/>
        </xs:sequence>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="comment" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="select" type="xsl:expression"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="copy" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="copy-namespaces" type="xsl:yes-or-no" default="yes"/>
        <xs:attribute name="inherit-namespaces" type="xsl:yes-or-no" default="yes"/>
        <xs:attribute name="use-attribute-sets" type="xsl:QNames" default=""/>
        <xs:attribute name="type" type="xsl:QName"/>
        <xs:attribute name="validation" type="xsl:validation-type"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="copy-of" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:versioned-element-type">
        <xs:attribute name="select" type="xsl:expression" use="required"/>
        <xs:attribute name="copy-namespaces" type="xsl:yes-or-no" default="yes"/>
        <xs:attribute name="type" type="xsl:QName"/>
        <xs:attribute name="validation" type="xsl:validation-type"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="decimal-format" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:attribute name="name" type="xsl:QName"/>
        <xs:attribute name="decimal-separator" type="xsl:char" default="."/>
        <xs:attribute name="grouping-separator" type="xsl:char" default=","/>
        <xs:attribute name="infinity" type="xs:string" default="Infinity"/>
        <xs:attribute name="minus-sign" type="xsl:char" default="-"/>
        <xs:attribute name="NaN" type="xs:string" default="NaN"/>
        <xs:attribute name="percent" type="xsl:char" default="%"/>
        <xs:attribute name="per-mille" type="xsl:char" default="&#x2030;"/>
        <xs:attribute name="zero-digit" type="xsl:char" default="0"/>
        <xs:attribute name="digit" type="xsl:char" default="#"/>
        <xs:attribute name="pattern-separator" type="xsl:char" default=";"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="element" substitutionGroup="xsl:instruction">
  <xs:complexType mixed="true">
    <xs:complexContent>
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="name" type="xsl:avt" use="required"/>
        <xs:attribute name="namespace" type="xsl:avt"/>
        <xs:attribute name="inherit-namespaces" type="xsl:yes-or-no" default="yes"/>
        <xs:attribute name="use-attribute-sets" type="xsl:QNames" default=""/>
        <xs:attribute name="type" type="xsl:QName"/>
        <xs:attribute name="validation" type="xsl:validation-type"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="fallback" substitutionGroup="xsl:instruction" type="xsl:sequence-constructor"/>

<xs:element name="for-each" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:sort" minOccurs="0" maxOccurs="unbounded"/>
          <xs:group ref="xsl:sequence-constructor-group" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="select" type="xsl:expression" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="for-each-group" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:sort" minOccurs="0" maxOccurs="unbounded"/>
          <xs:group ref="xsl:sequence-constructor-group" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="select" type="xsl:expression" use="required"/>
        <xs:attribute name="group-by" type="xsl:expression"/>
        <xs:attribute name="group-adjacent" type="xsl:expression"/>            
        <xs:attribute name="group-starting-with" type="xsl:pattern"/>            
        <xs:attribute name="group-ending-with" type="xsl:pattern"/>            
        <xs:attribute name="collation" type="xs:anyURI"/>            
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="function" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:param" minOccurs="0" maxOccurs="unbounded"/>
          <xs:group ref="xsl:sequence-constructor-group" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="name" type="xsl:QName" use="required"/>
        <xs:attribute name="override" type="xsl:yes-or-no" default="yes"/>
        <xs:attribute name="as" type="xsl:sequence-type" default="item()*"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="if" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="test" type="xsl:expression" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="import">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:attribute name="href" type="xs:anyURI" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="import-schema" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:sequence>
          <xs:element ref="xs:schema" minOccurs="0" maxOccurs="1"/>
        </xs:sequence>
        <xs:attribute name="namespace" type="xs:anyURI"/>
        <xs:attribute name="schema-location" type="xs:anyURI"/>                  
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="include" substitutionGroup="xsl:declaration">
    <xs:complexType>
      <xs:complexContent>
        <xs:extension base="xsl:element-only-versioned-element-type">
          <xs:attribute name="href" type="xs:anyURI" use="required"/>
        </xs:extension>
      </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="key" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="name" type="xsl:QName" use="required"/>
        <xs:attribute name="match" type="xsl:pattern" use="required"/>
        <xs:attribute name="use" type="xsl:expression"/>
        <xs:attribute name="collation" type="xs:anyURI"/>               
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="matching-substring" type="xsl:sequence-constructor"/>

<xs:element name="message" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="select" type="xsl:expression"/>
        <xs:attribute name="terminate" type="xsl:avt" default="no"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="namespace" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="name" type="xsl:avt" use="required"/>
        <xs:attribute name="select" type="xsl:expression"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="namespace-alias" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:attribute name="stylesheet-prefix" type="xsl:prefix-or-default" use="required"/>
        <xs:attribute name="result-prefix" type="xsl:prefix-or-default" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="next-match" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:choice minOccurs="0" maxOccurs="unbounded">
          <xs:element ref="xsl:with-param"/>
          <xs:element ref="xsl:fallback"/>
        </xs:choice>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="non-matching-substring" type="xsl:sequence-constructor"/>

<xs:element name="number" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:versioned-element-type">
        <xs:attribute name="value" type="xsl:expression"/>
        <xs:attribute name="select" type="xsl:expression"/>
        <xs:attribute name="level" type="xsl:level" default="single"/>
        <xs:attribute name="count" type="xsl:pattern"/>
        <xs:attribute name="from" type="xsl:pattern"/>
        <xs:attribute name="format" type="xsl:avt" default="1"/>
        <xs:attribute name="lang" type="xsl:avt"/>
        <xs:attribute name="letter-value" type="xsl:avt"/>
        <xs:attribute name="ordinal" type="xsl:avt"/>        
        <xs:attribute name="grouping-separator" type="xsl:avt"/>
        <xs:attribute name="grouping-size" type="xsl:avt"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="otherwise" type="xsl:sequence-constructor"/>

<xs:element name="output" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:generic-element-type">
        <xs:attribute name="name" type="xsl:QName"/>
        <xs:attribute name="method" type="xsl:method"/>
        <xs:attribute name="byte-order-mark" type="xsl:yes-or-no"/>
        <xs:attribute name="cdata-section-elements" type="xsl:QNames"/>
        <xs:attribute name="doctype-public" type="xs:string"/>
        <xs:attribute name="doctype-system" type="xs:string"/>
        <xs:attribute name="encoding" type="xs:string"/>
        <xs:attribute name="escape-uri-attributes" type="xsl:yes-or-no"/>
        <xs:attribute name="include-content-type" type="xsl:yes-or-no"/>
        <xs:attribute name="indent" type="xsl:yes-or-no"/>
        <xs:attribute name="media-type" type="xs:string"/>
        <xs:attribute name="normalization-form" type="xs:NMTOKEN"/>
        <xs:attribute name="omit-xml-declaration" type="xsl:yes-or-no"/>
        <xs:attribute name="standalone" type="xsl:yes-or-no-or-omit"/>
        <xs:attribute name="undeclare-prefixes" type="xsl:yes-or-no"/>
        <xs:attribute name="use-character-maps" type="xsl:QNames"/>
        <xs:attribute name="version" type="xs:NMTOKEN"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="output-character">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:attribute name="character" type="xsl:char" use="required"/>
        <xs:attribute name="string" type="xs:string" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="param">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="name" type="xsl:QName" use="required"/>
        <xs:attribute name="select" type="xsl:expression"/>
        <xs:attribute name="as" type="xsl:sequence-type"/>
        <xs:attribute name="required" type="xsl:yes-or-no"/>
        <xs:attribute name="tunnel" type="xsl:yes-or-no"/>        
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="perform-sort" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:sort" minOccurs="1" maxOccurs="unbounded"/>
          <xs:group ref="xsl:sequence-constructor-group" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="select" type="xsl:expression"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="preserve-space" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:attribute name="elements" type="xsl:nametests" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="processing-instruction" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="name" type="xsl:avt" use="required"/>
        <xs:attribute name="select" type="xsl:expression"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="result-document" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="format" type="xsl:avt"/>
        <xs:attribute name="href" type="xsl:avt"/>
        <xs:attribute name="type" type="xsl:QName"/>
        <xs:attribute name="validation" type="xsl:validation-type"/>
        <xs:attribute name="method" type="xsl:avt"/>
        <xs:attribute name="byte-order-mark" type="xsl:avt"/>
        <xs:attribute name="cdata-section-elements" type="xsl:avt"/>
        <xs:attribute name="doctype-public" type="xsl:avt"/>
        <xs:attribute name="doctype-system" type="xsl:avt"/>
        <xs:attribute name="encoding" type="xsl:avt"/>
        <xs:attribute name="escape-uri-attributes" type="xsl:avt"/>
        <xs:attribute name="include-content-type" type="xsl:avt"/>
        <xs:attribute name="indent" type="xsl:avt"/>
        <xs:attribute name="media-type" type="xsl:avt"/>
        <xs:attribute name="normalization-form" type="xsl:avt"/>
        <xs:attribute name="omit-xml-declaration" type="xsl:avt"/>
        <xs:attribute name="standalone" type="xsl:avt"/>
        <xs:attribute name="undeclare-prefixes" type="xsl:avt"/>
        <xs:attribute name="use-character-maps" type="xsl:QNames"/>
        <xs:attribute name="output-version" type="xsl:avt"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="sequence" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="select" type="xsl:expression"/>
        <xs:attribute name="as" type="xsl:sequence-type"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="sort">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="select" type="xsl:expression"/>  
        <xs:attribute name="lang" type="xsl:avt"/>        
        <xs:attribute name="data-type" type="xsl:avt" default="text"/>        
        <xs:attribute name="order" type="xsl:avt" default="ascending"/>        
        <xs:attribute name="case-order" type="xsl:avt"/>
        <xs:attribute name="collation" type="xsl:avt"/>
        <xs:attribute name="stable" type="xsl:yes-or-no"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="strip-space" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:element-only-versioned-element-type">
        <xs:attribute name="elements" type="xsl:nametests" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="stylesheet" substitutionGroup="xsl:transform"/>

<xs:element name="template" substitutionGroup="xsl:declaration">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:versioned-element-type">
        <xs:sequence>
          <xs:element ref="xsl:param" minOccurs="0" maxOccurs="unbounded"/>
          <xs:group ref="xsl:sequence-constructor-group" minOccurs="0" maxOccurs="unbounded"/>
        </xs:sequence>
        <xs:attribute name="match" type="xsl:pattern"/>
        <xs:attribute name="priority" type="xs:decimal"/>
        <xs:attribute name="mode" type="xsl:modes"/>
        <xs:attribute name="name" type="xsl:QName"/>
        <xs:attribute name="as" type="xsl:sequence-type" default="item()*"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:complexType name="text-element-base-type">
  <xs:simpleContent>
    <xs:restriction base="xsl:versioned-element-type">
      <xs:simpleType>
        <xs:restriction base="xs:string"/>
      </xs:simpleType>
      <xs:anyAttribute namespace="##other" processContents="lax"/>
    </xs:restriction>
  </xs:simpleContent>
</xs:complexType>

<xs:element name="text" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xsl:text-element-base-type">
        <xs:attribute name="disable-output-escaping" type="xsl:yes-or-no" default="no"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>

<xs:complexType name="transform-element-base-type">
  <xs:complexContent>
    <xs:restriction base="xsl:element-only-versioned-element-type">
      <xs:attribute name="version" type="xs:decimal" use="required"/>
      <xs:anyAttribute namespace="##other" processContents="lax"/>
    </xs:restriction>
  </xs:complexContent>
</xs:complexType>

<xs:element name="transform">
  <xs:complexType>
    <xs:complexContent>
      <xs:extension base="xsl:transform-element-base-type">
        <xs:sequence>
          <xs:element ref="xsl:import" minOccurs="0" maxOccurs="unbounded"/>
          <xs:choice minOccurs="0" maxOccurs="unbounded">
            <xs:element ref="xsl:declaration"/>
            <xs:element ref="xsl:variable"/>
            <xs:element ref="xsl:param"/>              
            <xs:any namespace="##other" processContents="lax"/> <!-- weaker than XSLT 1.0 -->
          </xs:choice>
        </xs:sequence>
        <xs:attribute name="id" type="xs:ID"/>
        <xs:attribute name="default-validation" type="xsl:validation-strip-or-preserve" default="strip"/>
        <xs:attribute name="input-type-annotations" type="xsl:input-type-annotations-type" default="unspecified"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="value-of" substitutionGroup="xsl:instruction">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="select" type="xsl:expression"/>
        <xs:attribute name="separator" type="xsl:avt"/>            
        <xs:attribute name="disable-output-escaping" type="xsl:yes-or-no" default="no"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="variable">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="name" type="xsl:QName" use="required"/>
        <xs:attribute name="select" type="xsl:expression" use="optional"/>
        <xs:attribute name="as" type="xsl:sequence-type" use="optional"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="when">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="test" type="xsl:expression" use="required"/>
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<xs:element name="with-param">
  <xs:complexType>
    <xs:complexContent mixed="true">
      <xs:extension base="xsl:sequence-constructor">
        <xs:attribute name="name" type="xsl:QName" use="required"/>
        <xs:attribute name="select" type="xsl:expression"/>
        <xs:attribute name="as" type="xsl:sequence-type"/>
        <xs:attribute name="tunnel" type="xsl:yes-or-no"/>   
      </xs:extension>
    </xs:complexContent>
  </xs:complexType>
</xs:element>

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<xs:annotation>
  <xs:documentation>
    PART C: definition of literal result elements
    
    There are three ways to define the literal result elements
    permissible in a stylesheet.
    
    (a) do nothing. This allows any element to be used as a literal
        result element, provided it is not in the XSLT namespace
    
    (b) declare all permitted literal result elements as members
        of the xsl:literal-result-element substitution group
        
    (c) redefine the model group xsl:result-elements to accommodate
        all permitted literal result elements.
        
    Literal result elements are allowed to take certain attributes
    in the XSLT namespace. These are defined in the attribute group
    literal-result-element-attributes, which can be included in the
    definition of any literal result element.
    
  </xs:documentation>
</xs:annotation>   
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<xs:element name="literal-result-element" abstract="true" type="xs:anyType"/>

<xs:attributeGroup name="literal-result-element-attributes">
  <xs:attribute name="default-collation" form="qualified" type="xsl:uri-list"/>
  <xs:attribute name="extension-element-prefixes" form="qualified" type="xsl:prefixes"/>
  <xs:attribute name="exclude-result-prefixes" form="qualified" type="xsl:prefixes"/>
  <xs:attribute name="xpath-default-namespace" form="qualified" type="xs:anyURI"/>    
  <xs:attribute name="inherit-namespaces" form="qualified" type="xsl:yes-or-no" default="yes"/>
  <xs:attribute name="use-attribute-sets" form="qualified" type="xsl:QNames" default=""/>
  <xs:attribute name="use-when" form="qualified" type="xsl:expression"/>
  <xs:attribute name="version" form="qualified" type="xs:decimal"/>
  <xs:attribute name="type" form="qualified" type="xsl:QName"/>
  <xs:attribute name="validation" form="qualified" type="xsl:validation-type"/>
</xs:attributeGroup>

<xs:group name="result-elements">
  <xs:choice>
    <xs:element ref="xsl:literal-result-element"/>
    <xs:any namespace="##other" processContents="lax"/>
    <xs:any namespace="##local" processContents="lax"/>
  </xs:choice>
</xs:group>

<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<xs:annotation>
  <xs:documentation>
    PART D: definitions of simple types used in stylesheet attributes 
  </xs:documentation>
</xs:annotation>   
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<xs:simpleType name="avt">
  <xs:annotation>
    <xs:documentation>
      This type is used for all attributes that allow an attribute value template.
      The general rules for the syntax of attribute value templates, and the specific
      rules for each such attribute, are described in the XSLT 2.0 Recommendation.
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:string"/>
</xs:simpleType>

<xs:simpleType name="char">
  <xs:annotation>
    <xs:documentation>
      A string containing exactly one character.
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:string">
    <xs:length value="1"/>
  </xs:restriction>
</xs:simpleType>

<xs:simpleType name="expression">
  <xs:annotation>
    <xs:documentation>
      An XPath 2.0 expression.
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:token">
    <xs:pattern value=".+"/>
  </xs:restriction>
</xs:simpleType>

<xs:simpleType name="input-type-annotations-type">
  <xs:annotation>
    <xs:documentation>
      Describes how type annotations in source documents are handled.
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:token">
    <xs:enumeration value="preserve"/>
    <xs:enumeration value="strip"/>   
    <xs:enumeration value="unspecified"/>        
  </xs:restriction>
</xs:simpleType>

<xs:simpleType name="level">
  <xs:annotation>
    <xs:documentation>
      The level attribute of xsl:number: 
      one of single, multiple, or any.
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:NCName">
    <xs:enumeration value="single"/>
    <xs:enumeration value="multiple"/>
    <xs:enumeration value="any"/>
  </xs:restriction>
</xs:simpleType>

<xs:simpleType name="mode">
  <xs:annotation>
    <xs:documentation>
      The mode attribute of xsl:apply-templates: 
      either a QName, or #current, or #default.
    </xs:documentation>
  </xs:annotation>
  <xs:union memberTypes="xsl:QName">
    <xs:simpleType>
      <xs:restriction base="xs:token">
        <xs:enumeration value="#default"/>
        <xs:enumeration value="#current"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:union>
</xs:simpleType>

<xs:simpleType name="modes">
  <xs:annotation>
    <xs:documentation>
      The mode attribute of xsl:template: 
      either a list, each member being either a QName or #default;
      or the value #all
    </xs:documentation>
  </xs:annotation>
  <xs:union>
    <xs:simpleType>
      <xs:list>
        <xs:simpleType>
          <xs:union memberTypes="xsl:QName">
            <xs:simpleType>
              <xs:restriction base="xs:token">
                <xs:enumeration value="#default"/>
              </xs:restriction>
            </xs:simpleType>
          </xs:union>
        </xs:simpleType>
      </xs:list>
    </xs:simpleType>
    <xs:simpleType>
      <xs:restriction base="xs:token">
        <xs:enumeration value="#all"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:union>
</xs:simpleType>

<xs:simpleType name="nametests">
  <xs:annotation>
    <xs:documentation>
      A list of NameTests, as defined in the XPath 2.0 Recommendation.
      Each NameTest is either a QName, or "*", or "prefix:*", or "*:localname"
    </xs:documentation>
  </xs:annotation>
  <xs:list>
    <xs:simpleType>
      <xs:union memberTypes="xsl:QName">
        <xs:simpleType>
          <xs:restriction base="xs:token">
            <xs:enumeration value="*"/>
          </xs:restriction>
        </xs:simpleType>
        <xs:simpleType>
          <xs:restriction base="xs:token">
            <xs:pattern value="\i\c*:\*"/>
            <xs:pattern value="\*:\i\c*"/>            
          </xs:restriction>
        </xs:simpleType>
      </xs:union>
    </xs:simpleType>
  </xs:list>
</xs:simpleType>

<xs:simpleType name="prefixes">
  <xs:list itemType="xs:NCName"/>
</xs:simpleType>

<xs:simpleType name="prefix-list-or-all">
  <xs:union memberTypes="xsl:prefix-list">
    <xs:simpleType>
      <xs:restriction base="xs:token">
        <xs:enumeration value="#all"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:union>
</xs:simpleType>
      
<xs:simpleType name="prefix-list">
  <xs:list itemType="xsl:prefix-or-default"/>
</xs:simpleType>

<xs:simpleType name="method">
  <xs:annotation>
    <xs:documentation>
      The method attribute of xsl:output:
      Either one of the recognized names "xml", "xhtml", "html", "text",
      or a QName that must include a prefix.
    </xs:documentation>
  </xs:annotation>
  <xs:union>
    <xs:simpleType>
      <xs:restriction base="xs:NCName">
        <xs:enumeration value="xml"/>
        <xs:enumeration value="xhtml"/>
        <xs:enumeration value="html"/>
        <xs:enumeration value="text"/>
      </xs:restriction>
    </xs:simpleType>
    <xs:simpleType>
      <xs:restriction base="xsl:QName">
        <xs:pattern value="\c*:\c*"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:union>
</xs:simpleType>

<xs:simpleType name="pattern">
  <xs:annotation>
    <xs:documentation>
      A match pattern as defined in the XSLT 2.0 Recommendation.
      The syntax for patterns is a restricted form of the syntax for
      XPath 2.0 expressions.
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xsl:expression"/>
</xs:simpleType>

<xs:simpleType name="prefix-or-default">
  <xs:annotation>
    <xs:documentation>
      Either a namespace prefix, or #default.
      Used in the xsl:namespace-alias element.
    </xs:documentation>
  </xs:annotation>
  <xs:union memberTypes="xs:NCName">
    <xs:simpleType>
      <xs:restriction base="xs:token">
        <xs:enumeration value="#default"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:union>
</xs:simpleType>

<xs:simpleType name="QNames">
  <xs:annotation>
    <xs:documentation>
      A list of QNames.
      Used in the [xsl:]use-attribute-sets attribute of various elements,
      and in the cdata-section-elements attribute of xsl:output
    </xs:documentation>
  </xs:annotation>
  <xs:list itemType="xsl:QName"/>          
</xs:simpleType>

<xs:simpleType name="QName">
  <xs:annotation>
    <xs:documentation>
      A QName.
      This schema does not use the built-in type xs:QName, but rather defines its own
      QName type. Although xs:QName would define the correct validation on these attributes,
      a schema processor would expand unprefixed QNames incorrectly when constructing the PSVI,
      because (as defined in XML Schema errata) an unprefixed xs:QName is assumed to be in
      the default namespace, which is not the correct assumption for XSLT.
      The data type is defined as a restriction of the built-in type Name, restricted
      so that it can only contain one colon which must not be the first or last character.
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:Name">
    <xs:pattern value="([^:]+:)?[^:]+"/>      
  </xs:restriction>        
</xs:simpleType>

<xs:simpleType name="sequence-type">
  <xs:annotation>
    <xs:documentation>
      The description of a data type, conforming to the
      SequenceType production defined in the XPath 2.0 Recommendation
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:token">
    <xs:pattern value=".+"/>      
  </xs:restriction>
</xs:simpleType>

<xs:simpleType name="uri-list">
  <xs:list itemType="xs:anyURI"/>
</xs:simpleType>

<xs:simpleType name="validation-strip-or-preserve">
  <xs:annotation>
    <xs:documentation>
      Describes different ways of type-annotating an element or attribute.
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xsl:validation-type">
    <xs:enumeration value="preserve"/>
    <xs:enumeration value="strip"/>    
  </xs:restriction>
</xs:simpleType>

<xs:simpleType name="validation-type">
  <xs:annotation>
    <xs:documentation>
      Describes different ways of type-annotating an element or attribute.
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:token">
    <xs:enumeration value="strict"/>
    <xs:enumeration value="lax"/>
    <xs:enumeration value="preserve"/>
    <xs:enumeration value="strip"/>    
  </xs:restriction>
</xs:simpleType>

<xs:simpleType name="yes-or-no">
  <xs:annotation>
    <xs:documentation>
      One of the values "yes" or "no".
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:token">
    <xs:enumeration value="yes"/>
    <xs:enumeration value="no"/>
  </xs:restriction>
</xs:simpleType>

<xs:simpleType name="yes-or-no-or-omit">
  <xs:annotation>
    <xs:documentation>
      One of the values "yes" or "no" or "omit".
    </xs:documentation>
  </xs:annotation>
  <xs:restriction base="xs:token">
    <xs:enumeration value="yes"/>
    <xs:enumeration value="no"/>
    <xs:enumeration value="omit"/>
  </xs:restriction>
</xs:simpleType>

</xs:schema>