package org.ash.gao.part.param

import grails.converters.JSON
class ParamKindController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paramKindInstanceList: ParamKind.list(params), paramKindInstanceTotal: ParamKind.count()]
    }

    def create = {
        def paramKindInstance = new ParamKind()
        paramKindInstance.properties = params
        return [paramKindInstance: paramKindInstance]
    }

    def save = {
        def paramKindInstance = new ParamKind(params)
        if (paramKindInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paramKind.label', default: 'ParamKind'), paramKindInstance.id])}"
            redirect(action: "show", id: paramKindInstance.id)
        }
        else {
            render(view: "create", model: [paramKindInstance: paramKindInstance])
        }
    }

    def show = {
        def paramKindInstance = ParamKind.get(params.id)
        if (!paramKindInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKind.label', default: 'ParamKind'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paramKindInstance: paramKindInstance]
        }
    }

    def edit = {
        def paramKindInstance = ParamKind.get(params.id)
        if (!paramKindInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKind.label', default: 'ParamKind'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paramKindInstance: paramKindInstance]
        }
    }

    def update = {
        def paramKindInstance = ParamKind.get(params.id)
        if (paramKindInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paramKindInstance.version > version) {
                    
                    paramKindInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paramKind.label', default: 'ParamKind')] as Object[], "Another user has updated this ParamKind while you were editing")
                    render(view: "edit", model: [paramKindInstance: paramKindInstance])
                    return
                }
            }
            paramKindInstance.properties = params
            if (!paramKindInstance.hasErrors() && paramKindInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paramKind.label', default: 'ParamKind'), paramKindInstance.id])}"
                redirect(action: "show", id: paramKindInstance.id)
            }
            else {
                render(view: "edit", model: [paramKindInstance: paramKindInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKind.label', default: 'ParamKind'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paramKindInstance = ParamKind.get(params.id)
        if (paramKindInstance) {
            try {
                paramKindInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paramKind.label', default: 'ParamKind'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paramKind.label', default: 'ParamKind'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKind.label', default: 'ParamKind'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def autoCompleteJSON = {
      def l = ParamKind.findAllByNameIlike('%' + params.term + '%')
      def jsonList = l.collect {[ 
        key:   it.id,
        value: it.name
      ]}
      render jsonList as JSON
    }
}
