

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reportLog.label', default: 'ReportLog')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'reportLog.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="what" title="${message(code: 'reportLog.what.label', default: 'What')}" />
                        
                            <g:sortableColumn property="whenReported" title="${message(code: 'reportLog.whenReported.label', default: 'When Reported')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reportLogInstanceList}" status="i" var="reportLogInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reportLogInstance.id}">${fieldValue(bean: reportLogInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: reportLogInstance, field: "what")}</td>
                        
                            <td><g:formatDate date="${reportLogInstance.whenReported}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reportLogInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
