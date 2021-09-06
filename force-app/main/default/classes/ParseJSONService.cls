public with sharing class ParseJSONService {
    public ParseJSONService() {

    }

    public String getContactFromJson(String jsonString) {

        Map<String, Object> attrMap = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
        System.debug(attrMap);
        Map<String, String> attributeToValueMap = new Map<String, String>();
        //system.debug(attributeToValueMap);
        Contact contact = new Contact();
        attributeToValueMap.put('FirstName', String.valueOf(attrMap.get('FirstName')));
        attributeToValueMap.put('LastName', String.valueOf(attrMap.get('LastName')));
        attributeToValueMap.put('Email', String.valueOf(attrMap.get('Email')));
        return String.valueOf(JSON.serialize(attributeToValueMap));
    }
}
