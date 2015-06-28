package org.ash.gao.part

import grails.converters.JSON
import org.ash.gao.part.PartType;
import org.hibernate.criterion.IlikeExpression;

class PartTypeController {
  static springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
      //redirect(action: "tree", params: params)
      params.max = Math.min(params.max ? params.int('max') : 10, 100)
      params.sort = "name"
      params.order = "asc"
        [partTypeInstanceList: PartType.list(params), partTypeInstanceTotal: PartType.count()]
    }
    
    
    def autoCompleteJSON = {
      def l = PartType.findAllByNameIlike('%' + params.term + '%')
      def jsonList = l.collect {[ 
        key:   it.id,
        value: it.name
      ]}
      render jsonList as JSON
    }

    def tree = {
      [partTypeInstanceRoot: PartType.findByParentIsNull()]
    }

    def create = {
        def partTypeInstance = new PartType()
        partTypeInstance.properties = params
        return [partTypeInstance: partTypeInstance]
    }

    def save = {
        def partTypeInstance = new PartType(params)
        if (partTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'partType.label', default: 'PartType'), partTypeInstance.id])}"
            redirect(action: "show", id: partTypeInstance.id)
        }
        else {
            render(view: "create", model: [partTypeInstance: partTypeInstance])
        }
    }

    def show = {
        def partTypeInstance = PartType.get(params.id)
        if (!partTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partType.label', default: 'PartType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [partTypeInstance: partTypeInstance]
        }
    }

    def edit = {
        def partTypeInstance = PartType.get(params.id)
        if (!partTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partType.label', default: 'PartType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [partTypeInstance: partTypeInstance]
        }
    }

    def update = {
        def partTypeInstance = PartType.get(params.id)
        if (partTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (partTypeInstance.version > version) {
                    
                    partTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'partType.label', default: 'PartType')] as Object[], "Another user has updated this PartType while you were editing")
                    render(view: "edit", model: [partTypeInstance: partTypeInstance])
                    return
                }
            }
            partTypeInstance.properties = params
            if (!partTypeInstance.hasErrors() && partTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'partType.label', default: 'PartType'), partTypeInstance.id])}"
                redirect(action: "show", id: partTypeInstance.id)
            }
            else {
                render(view: "edit", model: [partTypeInstance: partTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partType.label', default: 'PartType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def partTypeInstance = PartType.get(params.id)
        if (partTypeInstance) {
            try {
                partTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'partType.label', default: 'PartType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'partType.label', default: 'PartType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partType.label', default: 'PartType'), params.id])}"
            redirect(action: "list")
        }
    }
    /**
     * Для модального AJAX диалога
     * @return
     */
    def editDialog() {
        def partTypeInstance = PartType.get(params.id)
        if (!partTypeInstance) {
          partTypeInstance = new PartType(params)
        }
        return [partTypeInstance: partTypeInstance]
    }
    
    def updateAJAX() {
      def partTypeInstance = PartType.get(params.id)
      if (partTypeInstance) {
        if (params.version) {
          def version = params.version.toLong()
          if (partTypeInstance.version > version) {
            partTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'partType.label', default: 'PartType')] as Object[], "Another user has updated this PartType while you were editing")
            render(view: "editDialog", model: [partTypeInstance: partTypeInstance])
            return
          }
        }
        partTypeInstance.properties = params
        if (!partTypeInstance.hasErrors() && partTypeInstance.save(flush: true)) {
          flash.message = "${message(code: 'partType.saved.message')}"
          render(view: "editDialog", model: [partTypeInstance: partTypeInstance, saved: true])
        }
        else {
          render(view: "editDialog", model: [partTypeInstance: partTypeInstance])
        }
      }
      else {
        partTypeInstance = new PartType(params)
        if (partTypeInstance.save(flush: true)) {
          flash.message = "${message(code: 'partType.created.message')}"
          render(view: "editDialog", model: [partTypeInstance: partTypeInstance, saved: true])
        }
        else {
          render(view: "editDialog", model: [partTypeInstance: partTypeInstance])
        }
      }
  }
}
