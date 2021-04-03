 -- Get everything interesting.
 SELECT requestdatetime,
        remoteip,
        requester,
        operation,
        key,
        httpstatus,
        errorcode,
        referrer,
        useragent
   FROM "notes_s3_access_logs_db"."access_logs";

 -- Get list of accessors for the last month, excluding CI/CD users.
 SELECT remoteip, 
        useragent, 
        referrer, 
        MIN(requestdatetime) AS FirstAccess, 
        MAX(requestdatetime) AS LastAccess
   FROM "notes_s3_access_logs_db"."access_logs"
  WHERE requester != 'arn:aws:iam::617309595707:user/github-notes-action'
    AND DATE(parse_datetime(requestdatetime,'dd/MMM/yyyy:HH:mm:ss Z'))
BETWEEN date_add('month', -1, DATE(NOW())) AND DATE(NOW())
  GROUP BY remoteip , useragent, referrer;
