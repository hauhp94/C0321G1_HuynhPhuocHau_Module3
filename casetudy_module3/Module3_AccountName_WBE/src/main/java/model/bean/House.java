package model.bean;

public class House extends Service{
    private String standard_room;
    private String description_other_convenience;
    private int number_of_floors;

    public House() {
    }

    public House(int service_id, String service_code, String service_name, int service_area, double service_cost,
                 int service_max_people, int rent_type_id, String rent_type_name, int service_type_id,
                 String service_type_name, String standard_room, String description_other_convenience,
                 int number_of_floors) {
        super(service_id, service_code, service_name, service_area, service_cost, service_max_people,
                rent_type_id, rent_type_name, service_type_id, service_type_name);
        this.standard_room = standard_room;
        this.description_other_convenience = description_other_convenience;
        this.number_of_floors = number_of_floors;
    }

    public String getStandard_room() {
        return standard_room;
    }

    public void setStandard_room(String standard_room) {
        this.standard_room = standard_room;
    }

    public String getDescription_other_convenience() {
        return description_other_convenience;
    }

    public void setDescription_other_convenience(String description_other_convenience) {
        this.description_other_convenience = description_other_convenience;
    }

    public int getNumber_of_floors() {
        return number_of_floors;
    }

    public void setNumber_of_floors(int number_of_floors) {
        this.number_of_floors = number_of_floors;
    }

}
