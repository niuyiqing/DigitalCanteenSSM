package digitalCanteenSSM.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.RecordMapper;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.service.RecordService;


@Service
public class RecordServiceImpl implements RecordService{

	@Autowired
	private RecordMapper recordMapper;
	
	@Override
	public List<Record> findRecordInCampus(Integer campusID) throws Exception{
		
		return recordMapper.findRecordInCampus(campusID);
	}
	
	@Override
	public List<Record> findRecordInCanteenByDate(Integer cantID,
			Date beginDate, Date endDate) throws Exception {
		
		return recordMapper.findRecordInCanteenByDate(cantID, beginDate, endDate);
	}
	
	@Override
	public List<Record> findRecordInCampusByDate(Integer campusID,Date beginDate,Date endDate) throws Exception {
		
		return recordMapper.findRecordInCampusByDate(campusID, beginDate, endDate);
	}
	
	@Override
	public Integer findRecordID(Record record) throws Exception {
		return recordMapper.findRecordID(record);
	}
	
	@Override
	public Record findRecordInCanteenAndDate(Record reocrd) throws Exception{
		
		return recordMapper.findRecordInCanteenAndDate(reocrd);
	}
	
	@Override
	public Record findRecordByRecordID(Integer recordID) throws Exception{
		return recordMapper.findRecordByRecordID(recordID);
	}
	
	@Override
	public void deleteRecord(Record record) throws Exception{
		
		recordMapper.deleteRecord(record);
	}
	@Override
	public void insertRecord(Record record) throws Exception{
		
		recordMapper.insertRecord(record);
	}

	@Override
	public List<Record> findRecordByDate(Record record) throws Exception {
		
		return recordMapper.findRecordByDate(record);
	}

	@Override
	public List<Record> findRecordInCanteen(Integer recordCantID)
			throws Exception {
		
		return recordMapper.findRecordInCanteen(recordCantID);
	}

	@Override
	public List<Record> findRecordCheck() throws Exception {

		return recordMapper.findRecordCheck();
	}

	@Override
	public void updateRecordCheck(Record record) throws Exception {
		
		recordMapper.updateRecordCheck(record);
	}

	@Override
	public Record findLatestRecordInCanteen(Integer cantID) throws Exception{
		
		return recordMapper.findLatestRecordInCanteen(cantID);
		
	}

}



