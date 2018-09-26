package hs.bm.control;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import hs.bm.bean.SysUsrUsrInfo;

public class ShiroRealm extends AuthorizingRealm{

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken arg0) throws AuthenticationException {
		String username = (String)arg0.getPrincipal();
		SysUsrUsrInfo user = ShiroServices.getUserByName(username);
		if(user == null) {
            throw new UnknownAccountException();//没找到帐号
        }
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getUsr_name(), //用户名
                user.getUsr_pwd(), //密码
                getName()  //realm name
        );
        return authenticationInfo;
	}
	
	

}
