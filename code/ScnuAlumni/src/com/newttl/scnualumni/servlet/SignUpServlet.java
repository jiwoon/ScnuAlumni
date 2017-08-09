package com.newttl.scnualumni.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newttl.scnualumni.bean.pojo.SNSUserInfo;
import com.newttl.scnualumni.bean.pojo.WeiXinOauth2Token;
import com.newttl.scnualumni.util.AdvancedUtil;
import com.newttl.scnualumni.weixin.WeiXinCommon;
/**
 * 用户注册接口
 * @author lgc
 *
 * 2017年8月2日 上午11:58:57
 */
public class SignUpServlet extends HttpServlet {

	/**
	 * add generated serial Version ID
	 */
	private static final long serialVersionUID = -2714335254760543111L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("SignUpServlet doGet");
		
		//设置编码格式，防止中文出现乱码
		req.setCharacterEncoding("gb2312");
		resp.setCharacterEncoding("gb2312");
		
		//用户同意授权后，能够获得 code
		String code=req.getParameter("code");
		
		System.out.println("code::"+code);
		
		//用户同意授权
		if (!(code.equals("authdeny"))) {
			//获取网页授权凭证 access_token
			AdvancedUtil advancedUtil=new AdvancedUtil();
			WeiXinOauth2Token weiXinOauth2Token=advancedUtil.getAdvancedMethod().getOauth2AccessToken(WeiXinCommon.appID, WeiXinCommon.appsecret, code);
			if (null != weiXinOauth2Token) {
				String accessToken=weiXinOauth2Token.getAccessToken();
				//获得用户的标志
				String openID=weiXinOauth2Token.getOpenId();
				//拉取用户信息
				SNSUserInfo snsUserInfo=advancedUtil.getAdvancedMethod().getSNSUserInfo(accessToken, openID, "zh_CN");
				
				//设置要传递的信息 ,将用户信息放到 request 对象中，这样可以传递到目标页面,
				req.setAttribute("snsUserInfo", snsUserInfo);
				//跳转到目标页面
				req.getRequestDispatcher("signUp.jsp").forward(req, resp);
			}else {
				//将未获取到授权的信息传递到目标页面
				String erro="未授权!";
				req.setAttribute("snsUserInfo", erro);
				//跳转到目标页面
				req.getRequestDispatcher("myIndex.jsp").forward(req, resp);
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName=req.getParameter("userName");
		System.out.println(userName);
	}
	
}
