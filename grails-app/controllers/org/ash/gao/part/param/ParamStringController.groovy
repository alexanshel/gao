package org.ash.gao.part.param

class ParamStringController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paramStringInstanceList: ParamString.list(params), paramStringInstanceTotal: ParamString.count()]
    }

    def create = {
        def paramStringInstance = new ParamString()
        paramStringInstance.properties = params
        return [paramStringInstance: paramStringInstance]
    }

    def save = {
        def paramStringInstance = new ParamString(params)
        if (paramStringInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paramString.label', default: 'ParamString'), paramStringInstance.id])}"
            redirect(action: "show", id: paramStringInstance.id)
        }
        else {
            render(view: "create", model: [paramStringInstance: paramStringInstance])
        }
    }

    def show = {
        def paramStringInstance = ParamString.get(params.id)
        if (!paramStringInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramString.label', default: 'ParamString'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paramStringInstance: paramStringInstance]
        }
    }

    def edit = {
        def paramStringInstance = ParamString.get(params.id)
        if (!paramStringInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramString.label', default: 'ParamString'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paramStringInstance: paramStringInstance]
        }
    }

    def update = {
        def paramStringInstance = ParamString.get(params.id)
        if (paramStringInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paramStringInstance.version > version) {
                    
                    paramStringInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paramString.label', default: 'ParamString')] as Object[], "Another user has updated this ParamString while you were editing")
                    render(view: "edit", model: [paramStringInstance: paramStringInstance])
                    return
                }
            }
            paramStringInstance.properties = params
            if (!paramStringInstance.hasErrors() && paramStringInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paramString.label', default: 'ParamString'), paramStringInstance.id])}"
                redirect(action: "show", id: paramStringInstance.id)
            }
            else {
                render(view: "edit", model: [paramStringInstance: paramStringInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramString.label', default: 'ParamString'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paramStringInstance = ParamString.get(params.id)
        if (paramStringInstance) {
            try {
                paramStringInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paramString.label', default: 'ParamString'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paramString.label', default: 'ParamString'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paramString.label', default: 'ParamString'), params.id])}"
            redirect(action: "list")
        }
    }
}
