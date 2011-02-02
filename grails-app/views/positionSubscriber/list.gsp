

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'positionSubscriber.label', default: 'PositionSubscriber')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'positionSubscriber.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="receiveNow" title="${message(code: 'positionSubscriber.receiveNow.label', default: 'Receive Now')}" />
                        
                            <g:sortableColumn property="receiveOnUrl" title="${message(code: 'positionSubscriber.receiveOnUrl.label', default: 'Receive On Url')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${positionSubscriberInstanceList}" status="i" var="positionSubscriberInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${positionSubscriberInstance.id}">${fieldValue(bean: positionSubscriberInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${positionSubscriberInstance.receiveNow}" /></td>
                        
                            <td>${fieldValue(bean: positionSubscriberInstance, field: "receiveOnUrl")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${positionSubscriberInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
