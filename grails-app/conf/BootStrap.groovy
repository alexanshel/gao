import org.ash.gao.part.Location;
import org.ash.gao.part.PartType;
import org.ash.gao.car.CarModel;
import org.ash.gao.car.FuelType;
import org.ash.gao.car.TransmissionType;
import org.ash.gao.secur.*;

class BootStrap {
  def springSecurityService

  def init = { servletContext ->
    println 'setup database'
    // устанавливаем роль и создаём админа
    def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
    def adminUser = User.findByUsername('admin') ?: new User(
      username: 'admin',
      password: springSecurityService.encodePassword('admin'),
      enabled: true
    ).save(failOnError: true)
    if (!adminUser.authorities.contains(adminRole)) {
      UserRole.create adminUser, adminRole
    }
       /*def root = new Location(name: 'Все').save()
       //l.save()
       new Location(
              name: 'exist', 
              url: 'www.exist.ru', 
              parent: new Location(name: "Internet", parent: root).save())
       def sc = new Location(name: "Склад", parent: root).save()
       new Location(name: "БУ", parent: sc).save()
       new Location(name: "Новые", parent: sc).save()
       root = new PartType(name: "Все типы").save()
       def d = new PartType(name: "Двигатель", parent: root).save()
       new PartType(name: "Система питания", parent: d).save()
       new PartType(name: "Кузов", parent: root).save()
       new PartType(name: "Ходовая", parent: root).save()
       new PartType(name: "Трансмиссия", parent: root).save()
       new Manufacturer(name: 'Koyaba').save()
       def vaz = new Manufacturer(name: 'ВАЗ').save()
       new CarModel(name: "Lada Prira", manufacturer: vaz).save()
       new CarModel(name: "Lada 2110", manufacturer: vaz).save()
       new CarModel(name: "Жигули 2101", manufacturer: vaz).save()
       new CarModel(name: "Жигули 2106", manufacturer: vaz).save()
       new CarModel(name: "Жигули 2107", manufacturer: vaz).save()
       new FuelType(name: "Бензин").save()
       new FuelType(name: "Дизель").save()
       new Country(name: "Россия").save()
       new Country(name: "Япония").save()
       new Country(name: "Германия").save()
       new TransmissionType(name: "Механическая").save()
       new TransmissionType(name: "Автоматическая").save()*/
       
       //def l2 = new Location(name: 'exist', url: 'www.exist.ru').save()
      // l.setParent(l2)
   }
   def destroy = {
   }
} 
