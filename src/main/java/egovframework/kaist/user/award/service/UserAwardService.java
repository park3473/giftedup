package egovframework.kaist.user.award.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.award.model.UserAwardRequireVo;
import egovframework.kaist.user.award.model.UserAwardVo;

public interface UserAwardService {

	public ModelMap getAllList(UserAwardVo userAwardVo);

	public ModelMap getAwardDataView(UserAwardVo userAwardVo);

	public List<?> getRequireAllList(UserAwardRequireVo userAwardRequireVo);

}
