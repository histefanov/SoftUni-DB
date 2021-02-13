SELECT 
	i.Id, 
	CONCAT(u.Username, ' : ', i.Title) AS IssueAssignee
FROM Users u
	JOIN Issues i ON u.Id = i.AssigneeId
ORDER BY i.Id DESC, u.Username