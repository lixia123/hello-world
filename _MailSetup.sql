sp_configure 'show advanced options', 1;
GO
RECONFIGURE
GO
sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE
GO

--Create a New Mail Profile for Notifications
EXECUTE msdb.dbo.sysmail_add_profile_sp
	@profile_name = 'Notifications',
	@description = 'Profile for sending outgoing notifications using Gmail  '
GO


--Set the New Profile as the Default
EXECUTE msdb.dbo.sysmail_add_principalprofile_sp
	@profile_name = 'Notifications',
	@principal_name = 'public',
	@is_default = 1;
GO


--Create an Account for the Notifications
EXECUTE msdb.dbo.sysmail_add_account_sp
	@account_name = 'Gmail',
	@description = 'Account for outgoing notifications',
	@email_address = 'lixia.zhang123@gmail.com',
	@display_name = '70-461 - Triggers',
	@mailserver_name = 'smtp.gmail.com',
	@port = 587,
	@enable_ssl = 1,
	@username = 'lixia.zhang123@gmail.com',
	@password = 'A6228am1'
GO

--Add the Account to the Profile
EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
	@profile_name = 'Notifications',
	@account_name = 'Gmail',
	@sequence_number =1
GO


/*REMOVES Mail Account
EXECUTE msdb.dbo.sysmail_delete_profileaccount_sp @profile_name =  'Notifications'
EXECUTE msdb.dbo.sysmail_delete_principalprofile_sp @profile_name =  'Notifications'
EXECUTE msdb.dbo.sysmail_delete_account_sp @account_name = 'Gmail'
EXECUTE msdb.dbo.sysmail_delete_profile_sp @profile_name = 'Notifications'
*/