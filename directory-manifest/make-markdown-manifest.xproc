<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
    xmlns:x3f="http://csrc.nist.gov/ns/xslt3-functions"
    type="x3f:markdown-manifest" name="markdown-manifest">
    
    <!-- Purpose: Produce a directory manifest in Markdown, called `manifest.md` -->
    <!-- Description: This is a wrapper XProc around 'directory-manifest.xproc' hiding its ports and writing to (named) file output -->
    <!-- Option: provide 'path' as a URI e.g. file:///my/directory/ -->
    <!-- Output: a Markdown file 'manifest.md' in the current directory -->
    
    <p:input port="parameters" kind="parameter"/>
    
    <p:option name="path" select="'.'"/>
    
    <!-- :::::    :::::     :::::    :::::     :::::    :::::     :::::    :::::     :::::    :::::     :::::   -->
    
    <p:import href="directory-manifest.xproc"/>

    <x3f:directory-manifest name="manifest">
        <p:with-option name="path" select="$path"/>
    </x3f:directory-manifest>
    
    <p:store method="text">
        <p:with-option name="href" select="$path || '/manifest.md'"/>
    </p:store>
    
</p:declare-step>