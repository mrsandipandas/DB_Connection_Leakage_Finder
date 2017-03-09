package com.pwc.in.aapl.app.business.facadeImpl.quartzjob;

import com.pwc.in.aapl.app.connection.util.MySqlDataSourceUtil;
import org.apache.commons.io.FileUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: sakuh657
 * Date: May 26, 2010
 * Time: 12:01:57 PM
 * To change this template use File | Settings | File Templates.
 */
public class AmazanScheduleJob extends QuartzJobBean {
    private MySqlDataSourceUtil connectionFactory;

    public void setConnectionFactory(MySqlDataSourceUtil connectionFactory) {
        this.connectionFactory = connectionFactory;
    }

    protected void executeInternal(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //Do the main job here
            System.out.println(String.format("Started executing the job at %s", Calendar.getInstance().getTime().toString()));
            dumpOpenConnection();
        }
        catch (Exception ex) {
            ex.printStackTrace();
            throw new JobExecutionException(ex);
        }
        finally {
            System.out.println(String.format("Finished executing the job at %s", Calendar.getInstance().getTime().toString()));
        }
    }

    private void dumpOpenConnection() throws Exception {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd_MMM_yyyy");
            String fileName = String.format("%s_OpenConnection.txt", sdf.format(new Date()));
            File fileToDumpOpenConnection = new File(String.format("D:%s%s", System.getProperty("file.separator"), fileName));
            FileUtils.writeStringToFile(fileToDumpOpenConnection, ro.kifs.diagnostic.Connection.getStillOpenedConnsStackTraces(), null);
        }
        catch (Exception ex) {
            ex.printStackTrace();
            throw ex;
        }
    }
}

