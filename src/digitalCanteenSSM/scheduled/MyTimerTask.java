package digitalCanteenSSM.scheduled;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import digitalCanteenSSM.exception.ResultInfo;
import digitalCanteenSSM.po.Detail;
import digitalCanteenSSM.po.Log;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.service.DetailService;
import digitalCanteenSSM.service.LogService;
import digitalCanteenSSM.service.MUserService;
import digitalCanteenSSM.service.RecordService;

@Component
public class MyTimerTask {
	
	@Autowired
	private MUserService mUserService;
	
	@Autowired
	private RecordService recordService;
	
	@Autowired
	private DetailService detailService;
	
	@Scheduled(cron="59 59 23  * * ? ") 
    public void myTask() throws ParseException{
		
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");  
		String dateString=simpleDateFormat.format(new Date());
		Date date=simpleDateFormat.parse(dateString);
		System.out.println(date);
		
		//获得前一天的日期
		Calendar c = Calendar.getInstance();
		int day=c.get(Calendar.DATE);
		c.set(Calendar.DATE,day-1);
		String dayBefore=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()); 
		Date datePre=simpleDateFormat.parse(dayBefore);
		System.out.println(datePre);
		
		List<MUserItems> muserItems;
		try {
			//muserItems = mUserService.findAllMUser();
			muserItems = mUserService.findMUserStyle();
			for(int i = 0; i < muserItems.size(); i++){
				Record record = new Record(); 
				record.setRecordCampusID(muserItems.get(i).getCampusID());
				record.setRecordCantID(muserItems.get(i).getCantID());
				record.setRecordMUserID(0);//默认为系统提交
				record.setRecordCampusName(muserItems.get(i).getCampusName());
				record.setRecordCantName(muserItems.get(i).getCantName());
				record.setRecordMUserName("系统提交");
				record.setRecordDate(date);
				record.setRecordSubmitState("已提交");
				record.setReplenishFlag(0);
				record.setRecordCheck(0);
				
				//到数据库中用食堂和日期信息查询今日是否已经生成过记录表，
				//如果没有生成，则生成一个新表；否则跳转到修改页面
				Record rec = recordService.findRecordInCanteenAndDate(record);
				if(rec == null){
					//将数据表存入数据库并获取表的id
					recordService.insertRecord(record);
					int recordid= recordService.findRecordID(record);
					
					Record recordPre = new Record();
					recordPre.setRecordDate(datePre);
					recordPre.setRecordCantName(muserItems.get(i).getCantName());
					Record recordpre = recordService.findRecordInCanteenAndDate(recordPre);
					if(recordpre != null){
						//根据前一天的记录表ID找到菜品
						List<Detail> detailList = detailService.findDetailByRecordID(recordpre.getRecordID());
						
						//将菜品添加到明细表中
						for(Detail detail:detailList){
							detail.setDetailRecordID(recordid);
							detailService.insertDetail(detail);
						}
					}else{
						System.out.println("前一天没有录入菜品");	
					}
					System.out.println("今日记录表创建成功");	
				}else{
					
					System.out.println("今日已生成过记录表");			
				}
			}
			
		} catch (Exception e) {
			System.out.println("解析异常"); 
			e.printStackTrace();
		}
		
		 
    }  
}
