package org.ash.gao.part

import org.ash.gao.part.PartKind;

class PartKindController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [partKindInstanceList: PartKind.list(params), partKindInstanceTotal: PartKind.count()]
    }

    def create = {
        def partKindInstance = new PartKind()
        partKindInstance.properties = params
        return [partKindInstance: partKindInstance]
    }

    def save = {
        def partKindInstance = new PartKind(params)
        if (partKindInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'partKind.label', default: 'PartKind'), partKindInstance.id])}"
            redirect(action: "show", id: partKindInstance.id)
        }
        else {
            render(view: "create", model: [partKindInstance: partKindInstance])
        }
    }

    def show = {
        def partKindInstance = PartKind.get(params.id)
        if (!partKindInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partKind.label', default: 'PartKind'), params.id])}"
            redirect(action: "list")
        }
        else {
            [partKindInstance: partKindInstance]
        }
    }

    def edit = {
        def partKindInstance = PartKind.get(params.id)
        if (!partKindInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partKind.label', default: 'PartKind'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [partKindInstance: partKindInstance]
        }
    }

    def update = {
        def partKindInstance = PartKind.get(params.id)
        if (partKindInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (partKindInstance.version > version) {
                    
                    partKindInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'partKind.label', default: 'PartKind')] as Object[], "Another user has updated this PartKind while you were editing")
                    render(view: "edit", model: [partKindInstance: partKindInstance])
                    return
                }
            }
            partKindInstance.properties = params
            if (!partKindInstance.hasErrors() && partKindInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'partKind.label', default: 'PartKind'), partKindInstance.id])}"
                redirect(action: "show", id: partKindInstance.id)
            }
            else {
                render(view: "edit", model: [partKindInstance: partKindInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partKind.label', default: 'PartKind'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def partKindInstance = PartKind.get(params.id)
        if (partKindInstance) {
            try {
                partKindInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'partKind.label', default: 'PartKind'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'partKind.label', default: 'PartKind'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partKind.label', default: 'PartKind'), params.id])}"
            redirect(action: "list")
        }
    }
}
