package model.service.common;

public class Validate {
    public static String validateName(String name) {
        String message = null;
        String regex = "([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
        if (!name.matches(regex)) {
            message = "Not OK. Student name invalid";
        }
        return message;
    }

    public static String validatePoint(int point) {
        String message = null;
        if (point < 0 || point > 100) {
            message = "Not OK. Student point invalid";
        }
        return message;
    }

    public static String validateCustomerCode(String code) {
        String message = null;
        String regex = "^KH-\\d{4}$";
        if (!code.matches(regex)) {
            message = "Not OK. Customer code invalid KH-1234";
        }
        return message;
    }

    public static String validateServiceCode(String code) {
        String message = null;
        String regex = "^DV-\\d{4}$";
        if (!code.matches(regex)) {
            message = "Not OK. Customer code invalid DV-1234";
        }
        return message;
    }

    public static String validatePhoneNumber(String phone) {
        String message = null;
        String regex = "^\\(84\\)\\+\\d{9}$";
        if (!phone.matches(regex)) {
            message = "Not OK. Phone number invalid (84)+123456789";
        }
        return message;
    }

    public static String validateIdCard(String idCard) {
        String message = null;
        String regex = "^\\d{9}$";
        if (!idCard.matches(regex)) {
            message = "Not OK. Id card invalid - 9 numbers";
        }
        return message;
    }

    public static String validateEmail(String email) {
        String message = null;
        String regex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        if (!email.matches(regex)) {
            message = "Not OK. Email invalid";
        }
        return message;
    }

    public static String validateIntegerNumbers(int number) {
        String message = null;
        String regex = "^\\d+$";
        if (!(String.valueOf(number)).matches(regex)) {
            message = "Not OK. Number >=0 ";
        }
        return message;
    }

    public static String validatePositiveNumbers(double number) {
        String message = null;
        if (number < 0) {
            message = "Not OK. Number >=0 ";
        }
        return message;
    }

    public static boolean validateNumber(String num) {
        String regex = "^\\d$";
        return num.matches(regex);
    }
}
