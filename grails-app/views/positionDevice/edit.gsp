


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'positionDevice.label', default: 'PositionDevice')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${positionDeviceInstance}">
            <div class="errors">
                <g:renderErrors bean="${positionDeviceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${positionDeviceInstance?.id}" />
                <g:hiddenField name="version" value="${positionDeviceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="positionDevice.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: positionDeviceInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${positionDeviceInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="currentLongitude"><g:message code="positionDevice.currentLongitude.label" default="Current Longitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: positionDeviceInstance, field: 'currentLongitude', 'errors')}">
                                    <g:textField name="currentLongitude" value="${fieldValue(bean: positionDeviceInstance, field: 'currentLongitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="currentLatitude"><g:message code="positionDevice.currentLatitude.label" default="Current Latitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: positionDeviceInstance, field: 'currentLatitude', 'errors')}">
                                    <g:textField name="currentLatitude" value="${fieldValue(bean: positionDeviceInstance, field: 'currentLatitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="idExternal"><g:message code="positionDevice.idExternal.label" default="Id External" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: positionDeviceInstance, field: 'idExternal', 'errors')}">
                                    <g:textField name="idExternal" value="${positionDeviceInstance?.idExternal}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="positionDevice.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: positionDeviceInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${PositionSubscriber.list()}" optionKey="id" value="${positionDeviceInstance?.owner?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
