package digitalCanteenSSM.mapper;

import java.util.Date;
import java.util.List;

import digitalCanteenSSM.po.Record;

public interface RecordMapper {
	
	public List<Record> findRecordInCanteen(Integer recordCantID) throws Exception;

	public List<Record> findRecordInCanteenByDate(Integer cantID,Date beginDate,Date endDate) throws Exception;
	
	public List<Record> findRecordInCampus(Integer campusID) throws Exception;
	
	public List<Record> findRecordInCampusByDate(Integer campusID,Date beginDate,Date endDate) throws Exception;
	
	public Integer findRecordID(Record record) throws Exception;
	
	public List<Record> findRecordByDate(Record record) throws Exception;
	
	public Record findRecordInCanteenAndDate(Record reocrd) throws Exception;
	
	public Record findRecordByRecordID(Integer recordID) throws Exception;
	
	public void deleteRecord(Record record) throws Exception;

	public void insertRecord(Record record) throws Exception;
	//录入审核标志位
	public List<Record> findRecordCheck() throws Exception;
	
	public void updateRecordCheck(Record record) throws Exception;
	
	public Record findLatestRecordInCanteen(Integer cantID) throws Exception;
	
}
