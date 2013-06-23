package org.ash.gao.part

import org.ash.gao.part.PartCross;

class PartCrossController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [partCrossInstanceList: PartCross.list(params), partCrossInstanceTotal: PartCross.count()]
    }

    def create = {
        def partCrossInstance = new PartCross()
        partCrossInstance.properties = params
        return [partCrossInstance: partCrossInstance]
    }

    def save = {
        def partCrossInstance = new PartCross(params)
        if (partCrossInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'partCross.label', default: 'PartCross'), partCrossInstance.id])}"
            redirect(action: "show", id: partCrossInstance.id)
        }
        else {
            render(view: "create", model: [partCrossInstance: partCrossInstance])
        }
    }

    def show = {
        def partCrossInstance = PartCross.get(params.id)
        if (!partCrossInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partCross.label', default: 'PartCross'), params.id])}"
            redirect(action: "list")
        }
        else {
            [partCrossInstance: partCrossInstance]
        }
    }

    def edit = {
        def partCrossInstance = PartCross.get(params.id)
        if (!partCrossInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partCross.label', default: 'PartCross'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [partCrossInstance: partCrossInstance]
        }
    }

    def update = {
        def partCrossInstance = PartCross.get(params.id)
        if (partCrossInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (partCrossInstance.version > version) {
                    
                    partCrossInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'partCross.label', default: 'PartCross')] as Object[], "Another user has updated this PartCross while you were editing")
                    render(view: "edit", model: [partCrossInstance: partCrossInstance])
                    return
                }
            }
            partCrossInstance.properties = params
            if (!partCrossInstance.hasErrors() && partCrossInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'partCross.label', default: 'PartCross'), partCrossInstance.id])}"
                redirect(action: "show", id: partCrossInstance.id)
            }
            else {
                render(view: "edit", model: [partCrossInstance: partCrossInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partCross.label', default: 'PartCross'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def partCrossInstance = PartCross.get(params.id)
        if (partCrossInstance) {
            try {
                partCrossInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'partCross.label', default: 'PartCross'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'partCross.label', default: 'PartCross'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partCross.label', default: 'PartCross'), params.id])}"
            redirect(action: "list")
        }
    }
}
