package coinweb.dao;

import java.util.ArrayList;

import coinweb.vo.bbsVO;

public interface bbsDAO {

	// Constructor
 /* ��ü ī��Ʈ �������� */
	/*public int execTotalCount(); */
	public String getDate();
	public int getNext();
	public int execTotalCount();

	/* �۾��� */
	public int write(bbsVO vo);
/*��ü����Ʈ
*/	public ArrayList<bbsVO> getResultList(int startCount, int endCount, int userID);

   /*�б�*/
	public bbsVO getResultVO(String bbsID);
	/*������Ʈ*/
	public int getUpdateResult(bbsVO vo);
	
	/* �Խ��Ǳۻ��� */
	public int getDeleteResult(String BbsID);

	}
