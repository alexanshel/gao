package org.ash.gao.part.param

import org.ash.gao.part.param.Param;

class ParamController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paramInstanceList: Param.list(params), paramInstanceTotal: Param.count()]
    }

    def create = {
        def paramInstance = new Param()
        paramInstance.properties = params
        return [paramInstance: paramInstance]
    }

    def save = {
        def paramInstance = new Param(params)
        if (paramInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'param.label', default: 'Param'), paramInstance.id])}"
            redirect(action: "show", id: paramInstance.id)
        }
        else {
            render(view: "create", model: [paramInstance: paramInstance])
        }
    }

    def show = {
        def paramInstance = Param.get(params.id)
        if (!paramInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'param.label', default: 'Param'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paramInstance: paramInstance]
        }
    }

    def edit = {
        def paramInstance = Param.get(params.id)
        if (!paramInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'param.label', default: 'Param'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paramInstance: paramInstance]
        }
    }

    def update = {
        def paramInstance = Param.get(params.id)
        if (paramInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paramInstance.version > version) {
                    
                    paramInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'param.label', default: 'Param')] as Object[], "Another user has updated this Param while you were editing")
                    render(view: "edit", model: [paramInstance: paramInstance])
                    return
                }
            }
            paramInstance.properties = params
            if (!paramInstance.hasErrors() && paramInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'param.label', default: 'Param'), paramInstance.id])}"
                redirect(action: "show", id: paramInstance.id)
            }
            else {
                render(view: "edit", model: [paramInstance: paramInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'param.label', default: 'Param'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paramInstance = Param.get(params.id)
        if (paramInstance) {
            try {
                paramInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'param.label', default: 'Param'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'param.label', default: 'Param'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'param.label', default: 'Param'), params.id])}"
            redirect(action: "list")
        }
    }
}
