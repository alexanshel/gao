<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <title>GAO Grails Auto Orders</title>
    <meta name="layout" content="main" />
    <style type="text/css" media="screen">
      #nav {
              margin-top:20px;
              margin-left:30px;
              width:228px;
              float:left;

      }
      .homePagePanel * {
              margin:0px;
      }
      .homePagePanel .panelBody ul {
              list-style-type:none;
              margin-bottom:10px;
      }
      .homePagePanel .panelBody h1 {
              text-transform:uppercase;
              font-size:1.1em;
              margin-bottom:10px;
      }
      .homePagePanel .panelBody {
          background: url(images/leftnav_midstretch.png) repeat-y top;
              margin:0px;
              padding:15px;
      }
      .homePagePanel .panelBtm {
          background: url(images/leftnav_btm.png) no-repeat top;
              height:20px;
              margin:0px;
      }
      .homePagePanel .panelTop {
          background: url(images/leftnav_top.png) no-repeat top;
              height:11px;
              margin:0px;
      }
      h2 {
              margin-top:15px;
              margin-bottom:15px;
              font-size:1.2em;
      }
      #pageBody {
              margin-left:280px;
              margin-right:20px;
      }
    </style>
  </head>
  <body>
    <div id="nav">
      <h2><g:message code="index.controllers.label"/></h2>
      <div class="homePagePanel">
        <div class="panelTop"></div>
        <div class="panelBody">
          <div id="controllerList" class="dialog">
            <ul>
              <li class="controller">
                <g:link controller="part">
                  <g:message code="org.ash.gao.part.PartController.label" default="part"/>
                </g:link>
              </li>
              <li class="controller">
                <g:link controller="partLocation">
                  <g:message code="org.ash.gao.part.PartLocationController.label" default="Part Location"/>
                </g:link>
              </li>
            </ul>
            <ul>
              <li class="controller">
                <g:link controller="partType">
                  <g:message code="org.ash.gao.part.PartTypeController.label" default="part type"/>
                </g:link>
              </li>
              <li class="controller">
                <g:link controller="partKind">
                  <g:message code="org.ash.gao.part.PartKindController.label" default="part kind"/>
                </g:link>
              </li>
              <li class="controller">
                <g:link controller="paramKind">
                  <g:message code="org.ash.gao.part.param.ParamKindController.label" default="param_kind"/>
                </g:link>
              </li>
              <li class="controller">
                <g:link controller="location">
                  <g:message code="org.ash.gao.part.LocationController.label" default="param location"/>
                </g:link>
              </li>
              <li class="controller">
                <g:link controller="manufacturer">
                  <g:message code="org.ash.gao.common.ManufacturerController.label" default="Manufacturer"/>
                </g:link>
              </li>
              <li class="controller">
                <g:link controller="client">
                  <g:message code="org.ash.gao.client.Client.label" default="Client"/>
                </g:link>
              </li>
              <li class="controller">
                <g:link controller="image">
                  <g:message code="org.ash.gao.common.Image.label" default="Image"/>
                </g:link>
              </li>
            </ul>
<%--            <ul>--%>
<%--              <g:each var="c" in="${grailsApplication.controllerClasses}">--%>
<%--                <!--div>{c.class.getInterfaces().contains(Serializable)}</div-->--%>
<%--                <!--g:if test="{c instanceof Serializable}"-->--%>
<%--                  <li class="controller"><g:link controller="${c.logicalPropertyName}"><g:message code="${c.fullName}.label" defaule="${c.fullName}"/></g:link></li>--%>
<%--                <!--/g:if-->--%>
<%--              </g:each>--%>
<%--            </ul>--%>
            <ul>
              <li class="controller">
                <g:link controller="logout">
                  <g:message code="logout.label" defaule="Exit"/>
                </g:link>
              </li>
            </ul>
          </div>
        </div>
        <div class="panelBtm">
        </div>
        <div>
          
          <ul>
            <li>App version: <g:meta name="app.version"></g:meta></li>
            <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
            <li>JVM version: ${System.getProperty('java.version')}</li>
          </ul>
          <!-- ${grailsApplication.getArtefacts("Domain")*.fullName}-->
        </div>
      </div>
    </div>
  </body>
</html>
