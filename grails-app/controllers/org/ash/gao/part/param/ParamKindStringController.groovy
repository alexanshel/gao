package org.ash.gao.part.param

class ParamKindStringController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paramKindStringInstanceList: ParamKindString.list(params), paramKindStringInstanceTotal: ParamKindString.count()]
    }

    def create = {
        def paramKindStringInstance = new ParamKindString()
        paramKindStringInstance.properties = params
        return [paramKindStringInstance: paramKindStringInstance]
    }

    def save = {
        def paramKindStringInstance = new ParamKindString(params)
        if (paramKindStringInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paramKindString.label', default: 'ParamKindString'), paramKindStringInstance.id])}"
            redirect(action: "show", id: paramKindStringInstance.id)
        }
        else {
            render(view: "create", model: [paramKindStringInstance: paramKindStringInstance])
        }
    }

    def show = {
        def paramKindStringInstance = ParamKindString.get(params.id)
        if (!paramKindStringInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKindString.label', default: 'ParamKindString'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paramKindStringInstance: paramKindStringInstance]
        }
    }

    def edit = {
        def paramKindStringInstance = ParamKindString.get(params.id)
        if (!paramKindStringInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKindString.label', default: 'ParamKindString'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paramKindStringInstance: paramKindStringInstance]
        }
    }

    def update = {
        def paramKindStringInstance = ParamKindString.get(params.id)
        if (paramKindStringInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paramKindStringInstance.version > version) {
                    
                    paramKindStringInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paramKindString.label', default: 'ParamKindString')] as Object[], "Another user has updated this ParamKindString while you were editing")
                    render(view: "edit", model: [paramKindStringInstance: paramKindStringInstance])
                    return
                }
            }
            paramKindStringInstance.properties = params
            if (!paramKindStringInstance.hasErrors() && paramKindStringInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paramKindString.label', default: 'ParamKindString'), paramKindStringInstance.id])}"
                redirect(action: "show", id: paramKindStringInstance.id)
            }
            else {
                render(view: "edit", model: [paramKindStringInstance: paramKindStringInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKindString.label', default: 'ParamKindString'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paramKindStringInstance = ParamKindString.get(params.id)
        if (paramKindStringInstance) {
            try {
                paramKindStringInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paramKindString.label', default: 'ParamKindString'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paramKindString.label', default: 'ParamKindString'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramKindString.label', default: 'ParamKindString'), params.id])}"
            redirect(action: "list")
        }
    }
}
