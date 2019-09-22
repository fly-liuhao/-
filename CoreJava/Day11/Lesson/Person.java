public class Person {
    /**���ԣ�private��static���Σ�����Ϊ��ǰ�����ͣ���������ʼ�� */
    private static Person person = new Person();
    
    /**
     * ���췽������˽��
     */
    private Person() {
        System.out.println(" �����Ƕ���ʽ��˽�й��췽����");
    }
    
    /**
     * public��ͨ��get��ǰ��Ķ���
     * @return
     */
    public static Person getPerson() {
        return person;
    }
}

//������
class TestPerson {
    public static void main(String[] args) {
        //static������ֱ��ͨ������ý��ж����ʼ��
        Person person1 = Person.getPerson();
        Person person2 = Person.getPerson();
        
        //����ͬһ������
        System.out.println(person1 == person2);
    }
