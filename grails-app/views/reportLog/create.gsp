


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reportLog.label', default: 'ReportLog')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reportLogInstance}">
            <div class="errors">
                <g:renderErrors bean="${reportLogInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="subscriber"><g:message code="reportLog.subscriber.label" default="Subscriber" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportLogInstance, field: 'subscriber', 'errors')}">
                                    <g:select name="subscriber.id" from="${PositionSubscriber.list()}" optionKey="id" value="${reportLogInstance?.subscriber?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="what"><g:message code="reportLog.what.label" default="What" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportLogInstance, field: 'what', 'errors')}">
                                    <g:textField name="what" value="${reportLogInstance?.what}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="when"><g:message code="reportLog.when.label" default="When" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportLogInstance, field: 'when', 'errors')}">
                                    <g:datePicker name="when" precision="day" value="${reportLogInstance?.when}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
