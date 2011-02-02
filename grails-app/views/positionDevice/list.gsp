

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'positionDevice.label', default: 'PositionDevice')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'positionDevice.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'positionDevice.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="idExternal" title="${message(code: 'positionDevice.idExternal.label', default: 'Id External')}" />
                        
                            <th><g:message code="positionDevice.owner.label" default="Owner" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${positionDeviceInstanceList}" status="i" var="positionDeviceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${positionDeviceInstance.id}">${fieldValue(bean: positionDeviceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: positionDeviceInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: positionDeviceInstance, field: "idExternal")}</td>
                        
                            <td>${fieldValue(bean: positionDeviceInstance, field: "owner")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${positionDeviceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
