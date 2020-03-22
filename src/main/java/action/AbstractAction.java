package action;


import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.*;


import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class AbstractAction extends ActionSupport implements RequestAware, SessionAware, ApplicationAware, ServletResponseAware {

    protected Map request;
    protected Map session;
    protected Map application;
    protected HttpServletResponse response;
    // 获得HttpServletResponse对象


    @Override
    public String execute() throws Exception {
        return "SUCCESS";
    }

    @Override
    public void setApplication(Map<String, Object> application) {
        this.application=application;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request=request;

    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session=session;
    }

    @Override
    public void setServletResponse(HttpServletResponse response)
    {
        this.response = response;
    }


}
