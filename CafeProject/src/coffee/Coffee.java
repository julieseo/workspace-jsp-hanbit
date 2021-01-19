package coffee;

public class Coffee {
	private int cafeid; 		//아이디
	private String kind;		//종류
	private String name;		//이름
	private String beans;		//생두 or 영어이름
	private String regist_day;		//날짜 수확시기 or 등록날짜
	private String explan;		//설명 or 재배고도
	private String variety;		//품종 품종or 아이스 or 핫
	private String level;		//등급 or 사이즈
	private String fileName;		//아미지파일
	
	public int getCafeid() {
		return cafeid;
	}
	public void setCafeid(int cafeid) {
		this.cafeid = cafeid;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBeans() {
		return beans;
	}
	public void setBeans(String beans) {
		this.beans = beans;
	}
	public String getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}
	public String getExplan() {
		return explan;
	}
	public void setExplan(String explan) {
		this.explan = explan;
	}
	public String getVariety() {
		return variety;
	}
	public void setVariety(String variety) {
		this.variety = variety;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
