public class Student {
    /**���ԣ�private��static���Σ�����Ϊ��ǰ�����ͣ����ȳ�ʼ����ֻ������ */
    private static Student student;

    /**
     * ���췽������˽��
     */
    private  Student() {
        System.out.println("����������ģʽ��˽�й��췽����");
    }
    
     /**
     * public��ͨ��get��ǰ��Ķ���(�״�ʹ����Ҫʵ����)
     * @return student
     */
    public static Student getStudentInstence() {
        if(student == null)
            student = new Student();
        return student;
    }  
}

//������
class TestStudent {
    public static void main(String[] args) {
   	//static������ֱ��ͨ������ý��ж����ʼ��
        Student stu1 = Student.getStudentInstence();
        Student stu2 = Student.getStudentInstence();
        
        //����ͬһ������
        System.out.println(stu1 == stu2);
    }
}
