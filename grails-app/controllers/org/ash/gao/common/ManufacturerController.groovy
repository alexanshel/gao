package org.ash.gao.common

import org.ash.gao.car.CarModel;
import org.ash.gao.common.Manufacturer;

import grails.converters.*

class ManufacturerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [manufacturerInstanceList: Manufacturer.list(params), manufacturerInstanceTotal: Manufacturer.count()]
    }

    def create = {
        def manufacturerInstance = new Manufacturer()
        manufacturerInstance.properties = params
        return [manufacturerInstance: manufacturerInstance]
    }

    def save = {
        def manufacturerInstance = new Manufacturer(params)
        if (manufacturerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), manufacturerInstance.id])}"
            redirect(action: "show", id: manufacturerInstance.id)
        }
        else {
            render(view: "create", model: [manufacturerInstance: manufacturerInstance])
        }
    }

    def show = {
        def manufacturerInstance = Manufacturer.get(params.id)
        if (!manufacturerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), params.id])}"
            redirect(action: "list")
        }
        else {
            [manufacturerInstance: manufacturerInstance]
        }
    }

    def edit = {
        def manufacturerInstance = Manufacturer.get(params.id)
        if (!manufacturerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [manufacturerInstance: manufacturerInstance]
        }
    }

    def update = {
        def manufacturerInstance = Manufacturer.get(params.id)
        if (manufacturerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (manufacturerInstance.version > version) {
                    
                    manufacturerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'manufacturer.label', default: 'Manufacturer')] as Object[], "Another user has updated this Manufacturer while you were editing")
                    render(view: "edit", model: [manufacturerInstance: manufacturerInstance])
                    return
                }
            }
            manufacturerInstance.properties = params
            if (!manufacturerInstance.hasErrors() && manufacturerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), manufacturerInstance.id])}"
                redirect(action: "show", id: manufacturerInstance.id)
            }
            else {
                render(view: "edit", model: [manufacturerInstance: manufacturerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def manufacturerInstance = Manufacturer.get(params.id)
        if (manufacturerInstance) {
            try {
                manufacturerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), params.id])}"
            redirect(action: "list")
        }
    }

    def ajaxGetCarModels = {
        def manufacturer = Manufacturer.get(params.id)
	render CarModel.findAllByManufacturer(manufacturer) as JSON
    }
    
    def autoCompleteJSON = {
      def l = Manufacturer.findAllByNameIlike('%' + params.term + '%')
      def jsonList = l.collect {[ 
        key:   it.id,
        value: it.name
      ]}
      render jsonList as JSON
    }
    
    
}
