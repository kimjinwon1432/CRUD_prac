/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.87
 * Generated at: 2023-04-05 04:54:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.CRUD;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class agreement_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(7);
    _jspx_dependants.put("jar:file:/C:/eGovFrameDev-3.8.0-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/exam/WEB-INF/lib/standard-1.1.2.jar!/META-INF/c.tld", Long.valueOf(1098678690000L));
    _jspx_dependants.put("/WEB-INF/lib/egovframework.rte.ptl.mvc-3.8.0.jar", Long.valueOf(1679892811153L));
    _jspx_dependants.put("jar:file:/C:/eGovFrameDev-3.8.0-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/exam/WEB-INF/lib/egovframework.rte.ptl.mvc-3.8.0.jar!/META-INF/taglib.tld", Long.valueOf(1539665194000L));
    _jspx_dependants.put("jar:file:/C:/eGovFrameDev-3.8.0-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/exam/WEB-INF/lib/spring-webmvc-4.3.16.RELEASE.jar!/META-INF/spring.tld", Long.valueOf(1523252374000L));
    _jspx_dependants.put("jar:file:/C:/eGovFrameDev-3.8.0-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/exam/WEB-INF/lib/spring-webmvc-4.3.16.RELEASE.jar!/META-INF/spring-form.tld", Long.valueOf(1523252374000L));
    _jspx_dependants.put("/WEB-INF/lib/standard-1.1.2.jar", Long.valueOf(1679892821028L));
    _jspx_dependants.put("/WEB-INF/lib/spring-webmvc-4.3.16.RELEASE.jar", Long.valueOf(1679892817196L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("<link type=\"text/css\" rel=\"stylesheet\" href=\"");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("\"/>\n");
      out.write("<style>\n");
      out.write("	html,body{\n");
      out.write("		margin: auto 0;\n");
      out.write("	}\n");
      out.write("	ul{\n");
      out.write("		padding: 0;\n");
      out.write("		list-style-type:none;\n");
      out.write("	}\n");
      out.write("	.terms_list{\n");
      out.write("		margin: auto;\n");
      out.write("	}\n");
      out.write("	.article{\n");
      out.write("		margin: auto;\n");
      out.write("		border: solid 1px;\n");
      out.write("		border-color: gray;\n");
      out.write("		overflow:scroll;\n");
      out.write("		width: 70%;\n");
      out.write("		height: 200px;\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	.terms_box{\n");
      out.write("		<!--  상, 하  -->\n");
      out.write("		padding: 10px 10px;\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	.btn_span{\n");
      out.write("		margin :auto ;\n");
      out.write("	}\n");
      out.write("	.terms_list > li > span > h3{\n");
      out.write("		padding: 3px 3px;\n");
      out.write("	}\n");
      out.write("	.title > span > h3{\n");
      out.write("		text-align:center;\n");
      out.write("	}\n");
      out.write("	.btn_ag_div{\n");
      out.write("		text-align:center;\n");
      out.write("		display: flex;\n");
      out.write("		justify-content: center;\n");
      out.write("	}\n");
      out.write("	.btn_ag_div > span{\n");
      out.write("		margin: 2em 0.5em 2em 0.5em;\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("	.btn_ag{\n");
      out.write("		display: block;\n");
      out.write("		width: 3em;\n");
      out.write("		font-size: 1.3rem;\n");
      out.write("		margin: 5px;\n");
      out.write("		background-color: #bdd7ee;\n");
      out.write("		text-decoration: none;\n");
      out.write("		padding: 10px;\n");
      out.write("	}\n");
      out.write("	.btn_ag:hover{\n");
      out.write("		background-color: #1a4a70;\n");
      out.write("   		color: white;\n");
      out.write("	}\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<!-- 헤더 -->\n");
      out.write("	<div id=\"header\">\n");
      out.write("		<span>CRUD</span>\n");
      out.write("		<a class=\"btn_top\" href=\"boardList.do\">게시판 목록</a>\n");
      out.write("		<a class=\"btn_top\" href=\"userList.do\">회원목록</a>		\n");
      out.write("		<a class=\"btn_top\" href=\"agreement.do\">회원가입</a>\n");
      out.write("		<a class=\"btn_top\" href=\"login.do\">로그인</a>\n");
      out.write("	</div>\n");
      out.write("	\n");
      out.write("<!-- 본문 -->\n");
      out.write("<div id=\"wrap_cont\">\n");
      out.write("	<div class=\"terms_title\">\n");
      out.write("		\n");
      out.write("	<ul class=\"terms_list\">\n");
      out.write("		<li><div class=\"title\"><span><h3>회원가입 약관</h3></span></div></li>\n");
      out.write("		<li>\n");
      out.write("			<div class=\"terms_box\">\n");
      out.write("				<div class=\"article\">\n");
      out.write("					<h3 class=\"article_title\">환영합니다.</h3>\n");
      out.write("					<p class=\"article_text\">\n");
      out.write("						1개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						2개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						3개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						4개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						5개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						1개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						3개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						5개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						7개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						9개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						1개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						3개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						4개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						6개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("						개인정보 제공 동의 내용~~~~~~개인정보 제공 동의 내용~~~~~~<br/>\n");
      out.write("					</p>\n");
      out.write("				</div>\n");
      out.write("			</div>\n");
      out.write("		</li>\n");
      out.write("		<li>\n");
      out.write("			<div class=\"btn_ag_div\">\n");
      out.write("			<span>\n");
      out.write("				<a class=\"btn_ag\" href=\"join.do\">동의</a>\n");
      out.write("			</span>\n");
      out.write("			<span>\n");
      out.write("				<a class=\"btn_ag\" href=\"mainPage.do\">비동의</a>\n");
      out.write("			</span>\n");
      out.write("			</div>\n");
      out.write("		</li>\n");
      out.write("	</ul>\n");
      out.write("	</div>\n");
      out.write("	\n");
      out.write("		\n");
      out.write("</div>\n");
      out.write("	\n");
      out.write("<!-- 푸터 -->\n");
      out.write("	<div id=\"footer\">\n");
      out.write("		<span>김진원</span>\n");
      out.write("		<span>CRUD_project</span>\n");
      out.write("	</div>\n");
      out.write("	\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005furl_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    boolean _jspx_th_c_005furl_005f0_reused = false;
    try {
      _jspx_th_c_005furl_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005furl_005f0.setParent(null);
      // /CRUD/agreement.jsp(12,45) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005furl_005f0.setValue("/css/egovframework/crudform.css");
      int _jspx_eval_c_005furl_005f0 = _jspx_th_c_005furl_005f0.doStartTag();
      if (_jspx_th_c_005furl_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
      _jspx_th_c_005furl_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005furl_005f0, _jsp_getInstanceManager(), _jspx_th_c_005furl_005f0_reused);
    }
    return false;
  }
}
