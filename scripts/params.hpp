class Params
{
	class RoundDuration{
		title = $STR_PARAM_ROUND_DURATION;
		values[] = {180,300,450,600,900,1200,1800};
		texts[] = {"3 minutes","5 minutes","7.5 minutes","10 minutes","15 minutes","20 minutes","30 minutes"};
		default = 600;
	};
	class DayAndNight{
		title = $STR_PARAM_DAY_AND_NIGHT;
		values[] = {0,1,2};
		texts[] = {$STR_PARAM_DAY_AND_NIGHT1,$STR_PARAM_DAY_AND_NIGHT2,$STR_PARAM_DAY_AND_NIGHT3};
		default = 0;
	};
	class WeatherParam{
		title = $STR_PARAM_WEATHER;
		values[] = {0,1};
		texts[] = {$STR_PARAM_WEATHER1,$STR_PARAM_WEATHER2};
		default = 0;
	};
	class AiGroups{
		title = $STR_AI_GROUPS;
		values[] = {1,2,3,4,5,6,7,8,9,10};
		texts[] = {"1","2","3","4","5","6","7","8","9","10"};
		default = 4;
	};
	class Revive{
		title = $STR_PARAM_REVIVE;
		values[] = {1,0};
		texts[] = {$STR_PARAM_ENABLED,$STR_PARAM_DISABLED};
		default = 1;
	};
	class Deployables{
		title = $STR_PARAM_DEPLOYABLES;
		values[] = {1,0};
		texts[] = {$STR_PARAM_ENABLED,$STR_PARAM_DISABLED};
		default = 0;
	};
	class Stamina{
		title = $STR_PARAM_STAMINA;
		values[] = {1,0};
		texts[] = {$STR_PARAM_ENABLED,$STR_PARAM_DISABLED};
		default = 1;
	};
};

