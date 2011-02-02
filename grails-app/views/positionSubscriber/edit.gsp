


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'positionSubscriber.label', default: 'PositionSubscriber')}" />
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
            <g:hasErrors bean="${positionSubscriberInstance}">
            <div class="errors">
                <g:renderErrors bean="${positionSubscriberInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${positionSubscriberInstance?.id}" />
                <g:hiddenField name="version" value="${positionSubscriberInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="devices"><g:message code="positionSubscriber.devices.label" default="Devices" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: positionSubscriberInstance, field: 'devices', 'errors')}">
                                    
<ul>
<g:each in="${positionSubscriberInstance?.devices?}" var="d">
    <li><g:link controller="positionDevice" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="positionDevice" action="create" params="['positionSubscriber.id': positionSubscriberInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'positionDevice.label', default: 'PositionDevice')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="receiveNow"><g:message code="positionSubscriber.receiveNow.label" default="Receive Now" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: positionSubscriberInstance, field: 'receiveNow', 'errors')}">
                                    <g:checkBox name="receiveNow" value="${positionSubscriberInstance?.receiveNow}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="receiveOnUrl"><g:message code="positionSubscriber.receiveOnUrl.label" default="Receive On Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: positionSubscriberInstance, field: 'receiveOnUrl', 'errors')}">
                                    <g:textField name="receiveOnUrl" value="${positionSubscriberInstance?.receiveOnUrl}" />
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
