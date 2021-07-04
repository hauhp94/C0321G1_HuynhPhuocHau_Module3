package model.bean;

public class Room extends Service{
    private String free_service;

    public Room(String id, String service_code, String service_name, String service_area, double service_cost,
                int service_max_people, int rent_type_id, String rent_type_name, String free_service) {
        super(id, service_code, service_name, service_area, service_cost, service_max_people, rent_type_id, rent_type_name);
        this.free_service = free_service;
    }

    public String getFree_service() {
        return free_service;
    }

    public void setFree_service(String free_service) {
        this.free_service = free_service;
    }

}
