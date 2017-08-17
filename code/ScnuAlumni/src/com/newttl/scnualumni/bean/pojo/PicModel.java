package com.newttl.scnualumni.bean.pojo;

/**
 * @author jason
 * @time 2017��7��26��
 */
import javax.imageio.ImageIO;
import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics2D;  
import java.awt.image.BufferedImage;  
import java.io.File;  
import java.io.IOException;  
import java.net.URL;  
  
  
public class PicModel {  
  
    private Font font = new Font("宋体", Font.PLAIN, 38);// ����������������  
  
    private Graphics2D g = null;  
  
    private int fontsize = 0;  
  
    private int x = 0;  
  
    private int y = 0;  
  
    /** 
     * ���뱾��ͼƬ�������� 
     */  
    public BufferedImage loadImageLocal(String imgName) {  
        try {  
            return ImageIO.read(new File(imgName));  
        } catch (IOException e) {  
            System.out.println(e.getMessage());  
        }  
        return null;  
    }  
    
    /** 
     * ��������ͼƬ�������� 
     */  
    public BufferedImage loadImageUrl(String imgName) {  
        try {  
            URL url = new URL(imgName);  
            return ImageIO.read(url);  
        } catch (IOException e) {  
            System.out.println(e.getMessage());  
        }  
        return null;  
    }  

    /** 
     * �����ͼƬ������ 
     */  
    public void writeImageLocal(String newImage, BufferedImage img) {  
        if (newImage != null && img != null) {  
            try {  
                File outputfile = new File(newImage);  
                ImageIO.write(img, "jpg", outputfile);  
            } catch (IOException e) {  
                System.out.println(e.getMessage());  
            }  
        }  
    }  
  
    /** 
     * �趨���ֵ������ 
     */  
    public void setFont(String fontStyle, int fontSize) {  
        this.fontsize = fontSize;  
        this.font = new Font(fontStyle, Font.PLAIN, fontSize);  
    }  
  
    /** 
     * �޸�ͼƬ,�����޸ĺ��ͼƬ������ֻ���һ���ı��� 
     */  
    public BufferedImage modifyImage(BufferedImage img, Object content, int x, int y) {  
        try {  
            int w = img.getWidth();  
            int h = img.getHeight();  
            g = img.createGraphics();  
            g.setBackground(Color.WHITE);  
            g.setColor(Color.orange);//����������ɫ  
            if (this.font != null)  
                g.setFont(this.font);  
            // ��֤���λ�õ������ͺ����  
           /* if (x >= h || y >= w) {  
                this.x = h - this.fontsize + 2;  
                this.y = w;  
            } else {  */
                this.x = x;  
                this.y = y;  
            //}  
            if (content != null) {  
                g.drawString(content.toString(), this.x, this.y);  
            }  
            g.dispose();  
        } catch (Exception e) {  
            System.out.println(e.getMessage());  
        }  
        return img;  
    }  
  
    /** 
     * �޸�ͼƬ,�����޸ĺ��ͼƬ������ֻ���һ���ı��� 
     *  
     * ʱ��:2007-10-8 
     *  
     * @param img 
     * @return 
     */  
    public BufferedImage modifyImageYe(BufferedImage img) {  
        try {  
            int w = img.getWidth();  
            int h = img.getHeight();  
            g = img.createGraphics();  
            g.setBackground(Color.black);  
            g.setColor(Color.blue);//����������ɫ  
            if (this.font != null)  
                g.setFont(this.font);  
            g.drawString("reyo.cn", w - 85, h - 5);  
            g.dispose();  
        } catch (Exception e) {  
            System.out.println(e.getMessage());  
        }  
  
        return img;  
    }  
  
    public BufferedImage modifyImagetogeter(BufferedImage b, BufferedImage d) {  
    	  
        try {  
            int w = b.getWidth();  
            int h = b.getHeight();              
            g = d.createGraphics();  
            g.drawImage(b, 110, 620, w, h, null);  
            g.dispose();  
        } catch (Exception e) {  
            System.out.println(e.getMessage());  
        }  
  
        return d;  
    }   
    public BufferedImage modifyImagetogeter2(BufferedImage b, BufferedImage d) {  
  	  
        try {  
            int w = b.getWidth();  
            int h = b.getHeight();              
            g = d.createGraphics();  
            g.drawImage(b, 280, 193, w, h, null);  
            g.dispose();  
        } catch (Exception e) {  
            System.out.println(e.getMessage());  
        }  
  
        return d;  
    } 
  
    /*
     * ƾ��ר����ά�룬���ά��������û���ơ��û�ͷ�񡢴�ζ�ά��
     * nickname Ϊ΢���û��ǳ�
     * path ��ɶ�ά���Ӧ�ı��ص�ַ
     */
    
    public static void MakeImg(String nickname, String img_pic){
   // public static void main(String []args){
    	PicModel tt = new PicModel();  
  
        BufferedImage d = tt.loadImageLocal("G:\\Apache\\webapps\\ROOT\\image\\go2.jpg");  
        //΢�����д��ͼƬ��  ע���Ʒ��������޷�����IO������ͼƬ�޸��޷�ִ�У���ʱ�ڱ��ؽ����޸�
        tt.writeImageLocal("G:\\Apache\\webapps\\ROOT\\image\\go5.jpg",tt.modifyImage(d,nickname,320,350));

        BufferedImage e = tt.loadImageLocal("G:\\Apache\\webapps\\ROOT\\image\\ticket.jpg");  
        //����ɵĶ�ά�� �ϲ���ģ��ͼ
        //��ά��ͼƬ��ַPath
        BufferedImage b = tt.loadImageLocal("G:\\Apache\\webapps\\ROOT\\image\\go5.jpg"); 
        
        //������Ŀ��ͼƬΪfinal_path  modifyImagetogeter(e,b)��ס��e��ǰ b�ں�
        tt.writeImageLocal("G:\\Apache\\webapps\\ROOT\\image\\final.jpg", tt.modifyImagetogeter(e, b));
        
        BufferedImage g = tt.loadImageLocal("G:\\Apache\\webapps\\ROOT\\image\\final.jpg");
        //���ر���ͷ���ַΪk
        BufferedImage k = tt.loadImageLocal(img_pic);
        tt.writeImageLocal("G:\\Apache\\webapps\\ROOT\\image\\great.jpg", tt.modifyImagetogeter2(k, g));
        
    } 
    
    
    public static void MakeActivityImg(String content, String img_pic){
    	PicModel tt = new PicModel();  
        BufferedImage d = tt.loadImageLocal(img_pic);  
        String[] news = content.split("/");
        System.out.println(news[0]+"\n"+news[1]+"\n"+news[2]+"\n"+news[3]+"\n"+news[4]+"\n");
        tt.writeImageLocal("G:\\Apache\\webapps\\ROOT\\image\\activity_invite.jpg",tt.modifyImage(d,news[0],347,556));
        tt.writeImageLocal("G:\\Apache\\webapps\\ROOT\\image\\activity_invite.jpg",tt.modifyImage(d,news[1],160,771));
        tt.writeImageLocal("G:\\Apache\\webapps\\ROOT\\image\\activity_invite.jpg",tt.modifyImage(d,news[2],347,640));
        tt.writeImageLocal("G:\\Apache\\webapps\\ROOT\\image\\activity_invite.jpg",tt.modifyImage(d,news[3],160,912));
        tt.writeImageLocal("G:\\Apache\\webapps\\ROOT\\image\\activity_invite.jpg",tt.modifyImage(d,news[4],555,1391));
        System.out.println("成功！");
        
    }  
  
}  