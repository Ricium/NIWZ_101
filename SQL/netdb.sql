USE [master]
GO
/****** Object:  Database [netinmlf_netint]    Script Date: 2015/02/12 08:36:24 AM ******/
CREATE DATABASE [netinmlf_netint]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'netinmlf_netint', FILENAME = N'd:\sites\DATA\netinmlf_netint.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'netinmlf_netint_log', FILENAME = N'd:\sites\DATA\netinmlf_netint.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [netinmlf_netint] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [netinmlf_netint].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [netinmlf_netint] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [netinmlf_netint] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [netinmlf_netint] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [netinmlf_netint] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [netinmlf_netint] SET ARITHABORT OFF 
GO
ALTER DATABASE [netinmlf_netint] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [netinmlf_netint] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [netinmlf_netint] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [netinmlf_netint] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [netinmlf_netint] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [netinmlf_netint] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [netinmlf_netint] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [netinmlf_netint] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [netinmlf_netint] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [netinmlf_netint] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [netinmlf_netint] SET  DISABLE_BROKER 
GO
ALTER DATABASE [netinmlf_netint] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [netinmlf_netint] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [netinmlf_netint] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [netinmlf_netint] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [netinmlf_netint] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [netinmlf_netint] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [netinmlf_netint] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [netinmlf_netint] SET RECOVERY FULL 
GO
ALTER DATABASE [netinmlf_netint] SET  MULTI_USER 
GO
ALTER DATABASE [netinmlf_netint] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [netinmlf_netint] SET DB_CHAINING OFF 
GO
ALTER DATABASE [netinmlf_netint] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [netinmlf_netint] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [netinmlf_netint]
GO
/****** Object:  User [netin_1]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE USER [netin_1] FOR LOGIN [netin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [db_owner] ADD MEMBER [netin_1]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END

GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END


GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Advertisement]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Insert_Advertisement]
@PictureId int,
@Title varchar(100),
@Body varchar(max),
@Number varchar(20),
@Email varchar(100),
@WebSiteUrl varchar(300),
@ClientId int
		
AS
INSERT INTO [Advertisement]
		([ClientId]
		,[PictureId]
		,[Title]
		,[Body]
		,[Number]
		,[Email]
		,[WebSiteUrl])
		
	VALUES
		(@ClientId,
		 @PictureId ,
@Title,
@Body,
@Number,
@Email,
@WebSiteUrl)
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Audit]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

create	 PROCEDURE [dbo].[f_Admin_Insert_Audit]
		         @UsersId   int        
                ,@TableId        int            
                ,@TaskId int
                ,@WorkingId int
				,@Dates date
          
		
AS
INSERT INTO Audit
		([UsersId]
		,[TableId]
		,[TaskId]
		,[WorkingId]
		,[Dates]
		
		)
		
	VALUES
		(  @UsersId           
                ,@TableId                    
                ,@TaskId 
                ,@WorkingId
				,@Dates
              
                )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Category]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Insert_Category]
		@Title varchar(50)
		,@Body varchar(max)
		
AS
INSERT INTO [Category]
		([Title]
		,[Body])
		
	VALUES
		(@Title
		,@Body)
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Insert_Client]
		@Name varchar(50)
		,@APIKey varchar(max)
		
AS
INSERT INTO [Client]
		([Name]
		,APIKey)
		
		
	VALUES
		(@Name
		,@APIKey)
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_ClientNotes]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

cREATE	 PROCEDURE [dbo].[f_Admin_Insert_ClientNotes]
		         @NotesId int,
				 @ClientId int        
            
				
		
AS
INSERT INTO ClientNote
		([NotesId],
		[ClientId]
		)
		
	VALUES
		( @NotesId,
		@ClientId
                
                )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Contact]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Insert_Contact]
		@Name varchar(50)
		,@Surname varchar(50)
		,@Number varchar(20)
		,@Body varchar(max)
		,@Email varchar(100)
		,@ClientId int
		
AS
INSERT INTO [Contacts]
		([Name]
		,[Surname]
		,[Number]
		,[Body]
		,[Email]
		,[ClientId])
		
		
	VALUES
		(@Name
		,@Surname
		,@Number
		,@Body
		,@Email
		,@ClientId)
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_DeviceRegister]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Insert_DeviceRegister]
		@ClientId int,
		@RegId varchar(250)
		
AS
INSERT INTO Registration
		([DeviceReg]
      ,[ClientId])
		
	VALUES
		(@RegId, @ClientId)
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_DeviceUser]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[f_Admin_Insert_DeviceUser]
@ClientId int 
           ,@DeviceId varchar(max) 
           ,@Name varchar(50) 
           ,@Surname varchar(50) 
           ,@Phone varchar(15) 
           ,@Email varchar(250) 
           ,@Password varchar(500) 
           ,@Approved bit 
		   ,@Address varchar(500)
		
AS
INSERT INTO [dbo].[DeviceUsers]
           ([ClientId]
           ,[DeviceId]
           ,[Name]
           ,[Surname]
           ,[Phone]
           ,[Email]
           ,[Password]
           ,[Approved]
		   ,[Address])
		
	VALUES
(  @ClientId  
           ,@DeviceId  
           ,@Name 
           ,@Surname  
           ,@Phone 
           ,@Email 
           ,@Password 
           ,@Approved
		   ,@Address )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);

	SET NOCOUNT ON
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Document]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[f_Admin_Insert_Document]
           @DocumentName varchar(100) 
           ,@PathUrl varchar(250) 
		   ,@ClientId int
		
AS
INSERT INTO [dbo].[Documents]
           ([DocumentName]
           ,[PathUrl]
		   ,[ClientId])
		
	VALUES
(  @DocumentName 
           ,@PathUrl
		   ,@ClientId  )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Events]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE	 PROCEDURE [dbo].[f_Admin_Insert_Events]
		         @ClientId   int        
                ,@CategoryId        int            
                ,@SubCategoryId int
                ,@PictureId int
				,@Title varchar(100)
                ,@Body varchar(max)
                ,@StartDate datetime
                ,@EndDate datetime
                ,@AllDay bit
		
AS
INSERT INTO [Events]
		([ClientId]
		,[CategoryId]
		,[SubCategoryId]
		,[PictureId]
		,[Title]
		,[Body]
		,[StartDate]
		,[EndDate]
		,[AllDay])
		
	VALUES
		(  @ClientId           
                ,@CategoryId                    
                ,@SubCategoryId 
                ,@PictureId 
				,@Title
                ,@Body
                ,@StartDate 
                ,@EndDate 
                ,@AllDay )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_News]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE	 PROCEDURE [dbo].[f_Admin_Insert_News]
		         @ClientId   int        
                ,@CategoryId        int            
                ,@SubCategoryId int
                ,@PictureId int
				,@Title varchar(50)
                ,@Body varchar(max)
				,@PostDate date
          
		
AS
INSERT INTO [News]
		([ClientId]
		,[CategoryId]
		,[SubCategoryId]
		,[PictureId]
		,[Title]
		,[Body]
		,[PostDate]
		)
		
	VALUES
		(  @ClientId           
                ,@CategoryId                    
                ,@SubCategoryId 
                ,@PictureId
				,@Title
                ,@Body
				,@PostDate
                )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Notes]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

cREATE	 PROCEDURE [dbo].[f_Admin_Insert_Notes]
		         @UsersId   int        
                ,@Note varchar(max)
				,@Dates datetime
				
		
AS
INSERT INTO Notes
		([UsersId]
		,[Note]
		,[Dates]
		)
		
	VALUES
		(  @UsersId           
                ,@Note                    
                ,@Dates 
                
                )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_NotificationGroup]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Insert_NotificationGroup]
@ClientId int 
,@GroupName varchar(100)
		
AS
INSERT INTO [dbo].[NotificationGroups]
           ([ClientId]
           ,[GroupName])
		
	VALUES
		(@ClientId  
,@GroupName )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_NotificationGroupLink]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Insert_NotificationGroupLink]
( @ClientId int 
            ,@DeviceUserId int 
            ,@NotifcationGroupId int )
		
AS
INSERT INTO [dbo].[NotifactionGroupLinks]
           ([ClientId]
           ,[DeviceUserId]
           ,[NotifcationGroupId])
		
	VALUES
( @ClientId  
            ,@DeviceUserId  
            ,@NotifcationGroupId  )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Notifications]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE	 PROCEDURE [dbo].[f_Admin_Insert_Notifications]
		         @ClientId   int        
                ,@CategoryId        int            
                ,@SubCategoryId int
				,@Title varchar(50)
                ,@Body varchar(max)
				,@PostDate date
          
		
AS
INSERT INTO [Notifications]
		([ClientId]
		,[CategoryId]
		,[SubCategoryId]
		,[Title]
		,[Body]
		,[PostDate]
		)
		
	VALUES
		(  @ClientId           
                ,@CategoryId                    
                ,@SubCategoryId 
				,@Title
                ,@Body
				,@PostDate
                )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Picture]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Insert_Picture]
		@PicUrl varchar(max),
		@ClientId int
		
AS
INSERT INTO Picture
		(PicUrl, ClientId)
		
	VALUES
		(@PicUrl, @ClientId)
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Service]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Insert_Service]
@ClientId int 
,@Service varchar(250) 
,@Query varchar(max) 
,@DeviceUserId int 
,@ModifiedDate datetime 
		
AS
INSERT INTO [dbo].[Services]
           ([ClientId]
           ,[Service]
           ,[Query]
           ,[DeviceUserId]
           ,[ModifiedDate])
		
	VALUES
		(@ClientId  
,@Service 
,@Query 
,@DeviceUserId 
,@ModifiedDate )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Setting]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Insert_Setting]
@Setting varchar(100)
,@Value varchar(500)
,@ClientId int
		
AS
INSERT INTO [dbo].[Settings]
           ([Setting]
           ,[Value]
           ,[ClientId])
		
	VALUES
		(@Setting 
		,@Value 
		,@ClientId )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_SubCategory]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Insert_SubCategory]
		@CategoryId int
		,@Title varchar(50)
		,@Body varchar(max)
		
AS
INSERT INTO [SubCategory]
		([CategoryId]
		,[Title]
		,[Body])
		
	VALUES
		(@CategoryId
		,@Title
		,@Body)
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Support]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

cREATE	 PROCEDURE [dbo].[f_Admin_Insert_Support]
		         @UsersId   int        
                ,@Quary varchar(max)
				,@Dates datetime
				
		
AS
INSERT INTO Support
		([UsersId]
		,[Quary]
		,[Dates]
		)
		
	VALUES
		(  @UsersId           
                ,@Quary                    
                ,@Dates 
                
                )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_TabelNames]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

cREATE	 PROCEDURE [dbo].[f_Admin_Insert_TabelNames]
		         @TableName   varchar(50)        
            
				
		
AS
INSERT INTO TabelNames
		([TableName]
		)
		
	VALUES
		( @TableName 
                
                )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Insert_Task]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

cREATE	 PROCEDURE [dbo].[f_Admin_Insert_Task]
		         @TaskName   varchar(50)        
            
				
		
AS
INSERT INTO Task
		([TaskName]
		)
		
	VALUES
		( @TaskName 
                
                )
	
	SELECT CAST(SCOPE_IDENTITY() AS int);
	
SET NOCOUNT ON
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Log_Error]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Log_Error]
		@ErrorMessage varchar(1000),
		@ErrorDate datetime
		
AS
INSERT INTO ErrorLog
		(ErrorMessage,ErrorDate)
		
	VALUES
		(@ErrorMessage, @ErrorDate)

SELECT CAST(1 AS int);

SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Advertisement]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_Advertisement] 
	@AdvertisementId int
   
AS
DELETE FROM [Advertisement]
		   WHERE AdvertisementId=@AdvertisementId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Advertisement_Per_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_Advertisement_Per_Client] 
	@ClientId int
   
AS
DELETE FROM [Advertisement]
		   WHERE ClientId=@ClientId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Category]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_Category] 
	@CategoryId int
   
AS
DELETE FROM [Category]
		   WHERE @CategoryId=@CategoryId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_Client] 
	@ClientId int
   
AS
DELETE FROM [Client]
		   WHERE ClientId=@ClientId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_ClientNotes]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_ClientNotes] 
	@ClientNotesId int
   
AS
DELETE FROM ClientNotes
		   WHERE ClientNotesId=@ClientNotesId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Contact]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_Contact] 
	@ContactId int
   
AS
DELETE FROM Contacts
		   WHERE ContactsId=@ContactId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Contact_Per_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_Contact_Per_Client] 
	@ClientId int
   
AS
DELETE FROM Contacts
		   WHERE ClientId=@ClientId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Event_Per_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_Event_Per_Client] 
	@ClientId int
   
AS
DELETE FROM [Events]
		   WHERE EventsId=@ClientId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Events]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_Events] 
	@EventsId int
   
AS
DELETE FROM [Events]
		   WHERE EventsId=@EventsId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_News]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_News] 
	@NewsId int
   
AS
DELETE FROM [News]
		   WHERE NewsId=@NewsId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_News_Per_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_News_Per_Client] 
	@ClientId int
   
AS
DELETE FROM [News]
		   WHERE ClientId =@ClientId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Notes]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_Notes] 
	@NotesId int
   
AS
DELETE FROM Notes
		   WHERE NotesId=@NotesId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Notifications]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_Notifications] 
	@NotificationsId int
   
AS
DELETE FROM [Notifications]
		   WHERE NotificationsId=@NotificationsId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Notifications_Per_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_Notifications_Per_Client] 
	@ClientId int
   
AS
DELETE FROM [Notifications]
		   WHERE ClientId =@ClientId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Picture]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_Picture] 
	@PictureId int
   
AS
DELETE FROM [Picture]
		   WHERE PictureId=@PictureId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Picture_Per_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_Picture_Per_Client] 
	@ClientId int
   
AS
DELETE FROM [Picture]
		   WHERE ClientId =@ClientId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_SubCategory]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_SubCategory] 
	@SubCategoryId int
   
AS
DELETE FROM [SubCategory]
		   WHERE SubCategoryId=@SubCategoryId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_SubCategory_Per_Category]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Remove_SubCategory_Per_Category] 
	@CategoryId int
   
AS
DELETE FROM [SubCategory]
		   WHERE CategoryId =@CategoryId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Support]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_Support] 
	@SupportId int
   
AS
DELETE FROM Support
		   WHERE SupportId=@SupportId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_TableNames]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_TableNames] 
	@TableId int
   
AS
DELETE FROM TableNames
		   WHERE TableId=@TableId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Remove_Task]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Remove_Task] 
	@TaskId int
   
AS
DELETE FROM Task
		   WHERE TaskId=@TaskId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Advertisement]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_Advertisement] 
@AdvertisementId int,
	@PictureId int,
@Title varchar(100),
@Body varchar(max),
@Number varchar(20),
@Email varchar(100),
@WebSiteUrl varchar(300)
 
   
AS
UPDATE [Advertisement]
           SET
			PictureId = @PictureId,
           Title = @Title,
		   Body = @Body,
		   Number = @Number,
		   Email = @Email,
		   WebSiteUrl = @WebSiteUrl
		   WHERE AdvertisementId=@AdvertisementId
	
SET NOCOUNT ON 
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Category]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_Category] 
	@CategoryId int
    ,@Title varchar(50)
    ,@Body varchar(max)
 
   
AS
UPDATE [Category]
           SET
           Title = @Title,
		   Body = @Body
		   WHERE CategoryId=@CategoryId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_Client] 
	@ClientId int
    ,@Name varchar(50)
    ,@APIKey varchar(50)
   
AS
UPDATE [Client]
           SET
           Name = @Name,
		 APIKey=@APIKey

		   WHERE ClientId=@ClientId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_ClientNotes]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_ClientNotes] 
	@ClientNoteId int
     ,@NotesId   int
	 ,@ClientId int
	         
               
              
   
AS
UPDATE ClientNotes
           SET
           NotesId = @NotesId,
		   ClientId=@ClientId
		
	
		
		   WHERE ClientNoteId=@ClientNoteId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Contact]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_Contact] 
	@ContactId int
    ,@Name varchar(50)
    ,@Surname varchar(50)
    ,@Number varchar(25)
	,@Body varchar(max)
	,@Email varchar(100)
	,@ClientId int
   
AS
UPDATE [Contacts]
           SET
           Name = @Name,
		   Surname = @Surname,
		   Number = @Number,
		   Body = @Body,
		   Email =@Email,
		   ClientId=@ClientId
		   WHERE ContactsId=@ContactId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_DeviceUser]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_DeviceUser]
@DeviceUserId int
,@ClientId int 
           ,@DeviceId varchar(max) 
           ,@Name varchar(50) 
           ,@Surname varchar(50) 
           ,@Phone varchar(15) 
           ,@Email varchar(250) 
           ,@Password varchar(500) 
           ,@Approved bit   
               
              
   
AS
UPDATE [dbo].[DeviceUsers]
           SET
		   [ClientId] = @ClientId
           ,[DeviceId] = @DeviceId
           ,[Name] = @Name
           ,[Surname] = @Surname
           ,[Phone] = @Phone
           ,[Email] = @Email
           ,[Password] = @Password
           ,[Approved] =@Approved
		
		   WHERE DeviceUserId = @DeviceUserId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Document]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_Document]
	@DocId int
,@DocumentName varchar(100) 
           ,@PathUrl varchar(250)    
               
              
   
AS
UPDATE [dbo].[Documents]
           SET
		   DocumentName = @DocumentName
      ,PathUrl  = @PathUrl
		
		   WHERE DocId = @DocId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Events]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_Events] 
	@EventsId int
     ,@ClientId   int        
                ,@CategoryId        int            
                ,@SubCategoryId int
                ,@PictureId int
				,@Title varchar(100)
                ,@Body varchar(max)
                ,@StartDate datetime
                ,@EndDate datetime
                ,@AllDay bit
   
AS
UPDATE [Events]
           SET
           ClientId = @ClientId,
		   CategoryId = @CategoryId,
		   SubCategoryId = @SubCategoryId,
		   PictureId = @PictureId,
		   Title =@Title,
		   Body = @Body,
		   StartDate = @StartDate,
		      EndDate = @EndDate,
		   AllDay = @AllDay
		   WHERE EventsId=@EventsId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_News]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_News] 
	@NewsId int
				,@ClientId   int        
                ,@CategoryId        int            
                ,@SubCategoryId int
                ,@PictureId int
				,@Title varchar(50)
                ,@Body varchar(max)
				,@PostDate date
          
          
              
   
AS
UPDATE News
           SET
           ClientId = @ClientId,
		   CategoryId = @CategoryId,
		   SubCategoryId = @SubCategoryId,
		   PictureId = @PictureId,
		   Title =@Title,
		   Body=@Body,
		   PostDate=@PostDate
		
		
		   WHERE NewsId=@NewsId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Notes]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_Notes] 
	@NotesId int
     ,@UsersId   int        
                    ,@Note varchar(max)
				,@Dates datetime
              
   
AS
UPDATE Notes
           SET
           UsersId = @UsersId,
		   Note = @Note,
		   Dates = @Dates
	
		
		   WHERE NotesId=@NotesId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_NotificationGroup]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_NotificationGroup]
@NotificationGroupId int
,@ClientId int 
,@GroupName varchar(100)  
               
              
   
AS
UPDATE [dbo].[NotificationGroupIs]
           SET
		   [ClientId] = @ClientId
           ,[GroupName] = @GroupName
		
		   WHERE NotificationGroupId = @NotificationGroupId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_NotificationGroupLink]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_NotificationGroupLink]
@LinkId int
,@NotifcationGroupId int
,@ClientId int 
,@DeviceUserId int  
               
              
   
AS
UPDATE [dbo].[NotifactionGroupLinks]
           SET
		   [ClientId] = @ClientId
      ,[DeviceUserId] = @DeviceUserId
      ,[NotifcationGroupId] = @NotifcationGroupId
		
		   WHERE LinkId = @LinkId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Notifications]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_Notifications] 
	@NotificationsId int
     ,@ClientId   int        
                ,@CategoryId        int            
                ,@SubCategoryId int
				,@Title varchar(50)
                ,@Body varchar(max)
				,@PostDate date
              
   
AS
UPDATE [Notifications]
           SET
           ClientId = @ClientId,
		   CategoryId = @CategoryId,
		   SubCategoryId = @SubCategoryId,
		   Title =@Title,
		   Body = @Body,
		   PostDate =@PostDate
		
		   WHERE NotificationsId=@NotificationsId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Service]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_Service]
@ServiceId int
,@ClientId int 
,@Service varchar(250) 
,@Query varchar(max) 
,@DeviceUserId int 
,@ModifiedDate datetime  
               
              
   
AS
UPDATE [dbo].[Services]
           SET
		   [ClientId] = @ClientId
           ,[Service] = @Service
           ,[Query] =@Query
           ,[DeviceUserId] = @DeviceUserId
           ,[ModifiedDate] = @ModifiedDate
		
		   WHERE ServiceId = @ServiceId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Setting]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_Admin_Update_Setting]
@SettingId int
,@Setting varchar(100)
,@Value varchar(500)
,@ClientId int
		
AS
UPDATE [dbo].[Settings]
   SET [Setting] = @Setting
      ,[Value] = @Value
      ,[ClientId] = @ClientId
 WHERE SettingId = @Setting
	
SET NOCOUNT ON
	RETURN






GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_SubCategory]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_SubCategory] 
	@SubCategoryId int
	,@CategoryId int
    ,@Title varchar(50)
    ,@Body varchar(max)
 
   
AS
UPDATE [SubCategory]
           SET
		   CategoryId =@CategoryId,
           Title = @Title,
		   Body = @Body
		   WHERE SubCategoryId=@SubCategoryId
	
SET NOCOUNT ON 
	RETURN







GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Support]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_Support] 
	@SupportId int
     ,@UsersId   int        
                    ,@Quary varchar(max)
				,@Dates datetime
              
   
AS
UPDATE Support
           SET
           UsersId = @UsersId,
		   Quary = @Quary,
		   Dates = @Dates
	
		
		   WHERE SupportId=@SupportId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_TableNames]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_TableNames] 
	@TableId int
     ,@TableName   varchar(50)        
               
              
   
AS
UPDATE TableNames
           SET
           TableName = @TableName
		
	
		
		   WHERE TableId=@TableId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_Admin_Update_Task]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

Create PROCEDURE [dbo].[f_Admin_Update_Task] 
	@TaskId int
     ,@TaskName   varchar(50)        
               
              
   
AS
UPDATE Task
           SET
           TaskName = @TaskName
		
	
		
		   WHERE TaskId=@TaskId
	
SET NOCOUNT ON 
	RETURN








GO
/****** Object:  StoredProcedure [dbo].[f_News_Remove_Event_Per_Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[f_News_Remove_Event_Per_Client] 
	@ClientId int
   
AS
DELETE FROM [Events]
		   WHERE ClientId = @ClientId

SELECT CAST(1 AS int);
	
SET NOCOUNT ON 
	RETURN






GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Advertisement](
	[AdvertisementId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[PictureId] [int] NULL,
	[Title] [varchar](100) NULL,
	[Body] [varchar](max) NULL,
	[Number] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[WebSiteUrl] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertisementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Audit]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit](
	[AuditId] [int] IDENTITY(1,1) NOT NULL,
	[UsersId] [int] NULL,
	[TableId] [int] NULL,
	[TaskId] [int] NULL,
	[WorkingId] [int] NULL,
	[Dates] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](150) NULL,
	[Body] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[APIKey] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientNote]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientNote](
	[ClientNoteId] [int] IDENTITY(1,1) NOT NULL,
	[NotesId] [int] NULL,
	[ClientId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactsId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[Number] [varchar](20) NULL,
	[Body] [varchar](max) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeviceUsers]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeviceUsers](
	[DeviceUserId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[DeviceId] [varchar](max) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[Approved] [bit] NULL,
	[Address] [varchar](250) NULL,
 CONSTRAINT [PK_DeviceUsers] PRIMARY KEY CLUSTERED 
(
	[DeviceUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Documents](
	[DocId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [varchar](100) NOT NULL,
	[PathUrl] [varchar](250) NOT NULL,
	[ClientId] [int] NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[DocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogId] [int] NULL,
	[ErrorMessage] [varchar](1000) NULL,
	[ErrorDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Events]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Events](
	[EventsId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[CategoryId] [int] NULL,
	[SubCategoryId] [int] NULL,
	[PictureId] [int] NULL,
	[Title] [varchar](max) NULL,
	[Body] [varchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[AllDay] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[News]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[CategoryId] [int] NULL,
	[SubCategoryId] [int] NULL,
	[PictureId] [int] NULL,
	[Title] [varchar](max) NULL,
	[Body] [varchar](max) NULL,
	[PostDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notes](
	[NotesId] [int] IDENTITY(1,1) NOT NULL,
	[UsersId] [int] NULL,
	[Note] [varchar](max) NULL,
	[Dates] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotifactionGroupLinks]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotifactionGroupLinks](
	[LinkId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[DeviceUserId] [int] NOT NULL,
	[NotifcationGroupId] [int] NOT NULL,
 CONSTRAINT [PK_NotifactionGroupLinks] PRIMARY KEY CLUSTERED 
(
	[LinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NotificationGroups]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NotificationGroups](
	[NotificationGroupId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[GroupName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_NotificationGroups] PRIMARY KEY CLUSTERED 
(
	[NotificationGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationsId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[CategoryId] [int] NULL,
	[SubCategoryId] [int] NULL,
	[Title] [varchar](max) NULL,
	[Body] [varchar](max) NULL,
	[PostDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Picture](
	[PictureId] [int] IDENTITY(1,1) NOT NULL,
	[PicUrl] [varchar](max) NULL,
	[ClientId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PictureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration](
	[RegistrationId] [int] IDENTITY(1,1) NOT NULL,
	[DeviceReg] [varchar](250) NULL,
	[ClientId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Services]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Service] [varchar](250) NOT NULL,
	[Query] [varchar](max) NOT NULL,
	[DeviceUserId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Settings](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[Setting] [varchar](100) NOT NULL,
	[Value] [varchar](500) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Title] [varchar](150) NULL,
	[Body] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Support]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Support](
	[SupportId] [int] IDENTITY(1,1) NOT NULL,
	[UsersId] [int] NULL,
	[Query] [varchar](max) NULL,
	[Dates] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SupportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TableNames]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TableNames](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Task]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[UsersId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  






GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  






GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  






GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  






GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  






GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  






GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  






GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  






GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 2015/02/12 08:36:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  






GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Applications_Index]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Membership_index]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Paths_index]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_index1]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Roles_index1]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aspnet_Users_Index]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Advertisement] ON 

INSERT [dbo].[Advertisement] ([AdvertisementId], [ClientId], [PictureId], [Title], [Body], [Number], [Email], [WebSiteUrl]) VALUES (1, 1, 0, N'Net Intercom', N'Get the Net Intercom service today!', N'0724600709', N'mc.vanderbank@gmail.com', N'www.netintercom.co.za')
INSERT [dbo].[Advertisement] ([AdvertisementId], [ClientId], [PictureId], [Title], [Body], [Number], [Email], [WebSiteUrl]) VALUES (1001, 21, 0, N'Net Intercom', N'Net Intercom communication service.', N'0724600709', N'netintercom.systems@gmail.com ', N'www.netintercom.co.za')
SET IDENTITY_INSERT [dbo].[Advertisement] OFF
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'8658729c-bcc1-4feb-be3c-a90225178105', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'wf7VQzCGF7fh/W9vGC5hiuAuGV8=', 1, N'16d+0PRwynmJcV+0Zm18Fg==', NULL, N'allen@4dtech.co.za', N'allen@4dtech.co.za', NULL, NULL, 1, 0, CAST(N'2014-11-18 12:58:38.000' AS DateTime), CAST(N'2015-01-26 09:49:55.280' AS DateTime), CAST(N'2014-11-18 12:58:38.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'dfc919a0-b161-4a29-bf02-ab7047772006', N'akHSEuFWEr20JRL3o+eeA/ZZNig=', 1, N'InHQT1y82hkHcFOz2tx72g==', NULL, N'mc.vanderbank@gmail.com', N'mc.vanderbank@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-09-19 20:29:04.000' AS DateTime), CAST(N'2014-11-18 13:22:35.770' AS DateTime), CAST(N'2014-09-19 20:29:04.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'93897cc2-f104-444e-ac44-432827a86150', N'UPi6cSO9dsx9KTfvs3zWMK6VB9Q=', 1, N'Y59VOsGoagOVSUwEvz1k5A==', NULL, N'mc.vanderbank@gmail.com', N'mc.vanderbank@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-09-29 21:07:21.000' AS DateTime), CAST(N'2014-11-04 08:54:58.703' AS DateTime), CAST(N'2014-09-29 21:07:21.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'bcAHc8Jv7r/fCKMm7u9BplbLEiA=', 1, N'viD7sbGRlyRhOnEByiH+OQ==', NULL, N'mc.vanderbank@gmail.com', N'mc.vanderbank@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-11-04 09:53:24.000' AS DateTime), CAST(N'2014-11-06 09:02:41.440' AS DateTime), CAST(N'2014-11-04 09:53:24.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'6579043c-e685-49b1-b5d4-be8433db631a', N'CryoPdV+w8B8BYrG7sEU/9SvAAc=', 1, N'Hj0DfOOm31Bb6vjaKxfb+Q==', NULL, N'mc.vanderbank@gmail.com', N'mc.vanderbank@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-11-18 13:16:09.000' AS DateTime), CAST(N'2014-11-18 13:25:44.397' AS DateTime), CAST(N'2014-11-18 13:16:09.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'71eb1a6b-834f-411f-bd99-586bdf0e417e', N'900fpY2/WWMdeSK96KZ3XNDeOQA=', 1, N'zv1ostwGHMiNrC+lz5gHrA==', NULL, N'mc.vanderbank@gmail.com', N'mc.vanderbank@gmail.com', NULL, NULL, 1, 0, CAST(N'2015-01-06 16:25:30.000' AS DateTime), CAST(N'2015-01-06 16:25:52.890' AS DateTime), CAST(N'2015-01-06 16:25:30.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'8a484f66-e07b-4a90-a623-1e940cd925b3', N'EzLFnsxIJzhR6FN0TFwh/Z08x98=', 1, N'H3Xf8texGr4SccjLm+Khpw==', NULL, N'rm.awsum@gmail.com', N'rm.awsum@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-08-25 17:16:35.000' AS DateTime), CAST(N'2015-02-03 07:51:54.703' AS DateTime), CAST(N'2014-08-25 17:16:35.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'334fdc8c-df33-4944-b30d-0095db96deb8', N'Pk9NAwYuADcn/tPcpFEDXdXPu78=', 1, N'zwAMhWgONoPz4MsCpbhgbg==', NULL, N'rm.awsum@gmail.com', N'rm.awsum@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-10-29 13:17:41.000' AS DateTime), CAST(N'2014-12-12 17:07:17.100' AS DateTime), CAST(N'2014-10-29 13:17:41.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'64c17f9f-25cc-4071-b742-71762c3d4531', N'V7z15YUoKMnfMTWkSyQCoAobPQ4=', 1, N'JJTFcmAFpNbMef8AFMdaGA==', NULL, N'rm.awsum@gmail.com', N'rm.awsum@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-10-29 13:41:43.000' AS DateTime), CAST(N'2014-10-29 14:11:16.793' AS DateTime), CAST(N'2014-10-29 13:41:43.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'P3KvnOm1uGPwkzMaFbV/qLnlZis=', 1, N'r2pFuG789sZvPdvWnSpO8g==', NULL, N'rm.awsum@gmail.com', N'rm.awsum@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-10-29 14:15:01.000' AS DateTime), CAST(N'2014-11-18 12:37:10.130' AS DateTime), CAST(N'2014-10-29 14:15:01.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'2KII/4fWAC02e0cRX5ityNCt4Xw=', 1, N'h1yOViuW4jRaD714OCkRhw==', NULL, N'rm.awsum@gmail.com', N'rm.awsum@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-11-18 13:01:58.000' AS DateTime), CAST(N'2015-01-29 07:33:04.750' AS DateTime), CAST(N'2014-11-18 13:01:58.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'kLDoMr+LUfbDZEeOqDq/udRBJY0=', 1, N'ZvrwZmnTjx+uxeDgzvJ7Mw==', NULL, N'rm.awsum@gmail.com', N'rm.awsum@gmail.com', NULL, NULL, 1, 0, CAST(N'2014-12-04 12:49:20.000' AS DateTime), CAST(N'2014-12-04 12:49:20.000' AS DateTime), CAST(N'2014-12-04 12:49:20.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 2, CAST(N'2015-01-29 07:34:14.063' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'9H65n38EK/dgOm7f0olb0SV2T+s=', 1, N'1tdiCgRsli0cfVOvHbwsaQ==', NULL, N'rm.awsum@gmail.com', N'rm.awsum@gmail.com', NULL, NULL, 1, 0, CAST(N'2015-01-29 07:36:03.000' AS DateTime), CAST(N'2015-01-29 08:25:55.843' AS DateTime), CAST(N'2015-01-29 07:36:03.000' AS DateTime), CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'c8f689d8-13f6-4197-8c30-866368120943', N'admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'bc145390-017a-45a4-a186-7bb464111f5e', N'advertisements', N'advertisements', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802', N'client', N'client', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74', N'contacts', N'contacts', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'0dcae484-be0e-4ce9-a657-594518783839', N'deviceusers', N'deviceusers', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'10f03954-c97e-443a-a809-1aafe3e6ab39', N'documents', N'documents', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'424dd782-72cb-4174-800e-ff4cffb4b1cc', N'email', N'email', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656', N'events', N'events', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1', N'facebook', N'facebook', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'987d14d5-5f88-40a2-95d6-f9a9326d43e4', N'groups', N'groups', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'd2608269-0baf-4a15-84b2-f31da710dad5', N'news', N'news', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0', N'notifications', N'notifications', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b', N'services', N'services', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'6c744f05-4e1b-46ae-b7fa-ae6d79f3adf3', N'sms', N'sms', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'a16daef6-dfed-4dd5-8b74-bd6814912cae', N'twitter', N'twitter', NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'8a484f66-e07b-4a90-a623-1e940cd925b3', N'admin', N'admin', NULL, 0, CAST(N'2015-02-03 07:51:54.703' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'anton', N'anton', NULL, 0, CAST(N'2015-01-29 08:25:55.843' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'brinant', N'brinant', NULL, 0, CAST(N'2014-12-04 12:49:20.000' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'Brinant_6', N'brinant_6', NULL, 0, CAST(N'2014-11-06 09:02:41.440' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'71eb1a6b-834f-411f-bd99-586bdf0e417e', N'DemoIntercom', N'demointercom', NULL, 0, CAST(N'2015-01-06 16:25:52.890' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'dfc919a0-b161-4a29-bf02-ab7047772006', N'Framework', N'framework', NULL, 0, CAST(N'2014-11-18 13:22:35.770' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'6579043c-e685-49b1-b5d4-be8433db631a', N'Framework_MC', N'framework_mc', NULL, 0, CAST(N'2014-11-18 13:25:44.397' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'93897cc2-f104-444e-ac44-432827a86150', N'MC_Brinant', N'mc_brinant', NULL, 0, CAST(N'2014-11-04 08:54:58.703' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'rm_1', N'rm_1', NULL, 0, CAST(N'2015-01-29 07:33:04.750' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'64c17f9f-25cc-4071-b742-71762c3d4531', N'Rm_5', N'rm_5', NULL, 0, CAST(N'2014-10-29 14:11:16.793' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'RM_5_Hometest', N'rm_5_hometest', NULL, 0, CAST(N'2014-11-18 12:37:10.130' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'334fdc8c-df33-4944-b30d-0095db96deb8', N'RM_Brinant', N'rm_brinant', NULL, 0, CAST(N'2014-12-12 17:07:17.100' AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'8658729c-bcc1-4feb-be3c-a90225178105', N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'voetspore', N'voetspore', NULL, 0, CAST(N'2015-01-26 09:49:55.280' AS DateTime))
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93897cc2-f104-444e-ac44-432827a86150', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'71eb1a6b-834f-411f-bd99-586bdf0e417e', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dfc919a0-b161-4a29-bf02-ab7047772006', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6579043c-e685-49b1-b5d4-be8433db631a', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'370d4f8c-0b0a-4fe4-8f88-1a39a766bb74')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'10f03954-c97e-443a-a809-1aafe3e6ab39')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'10f03954-c97e-443a-a809-1aafe3e6ab39')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93897cc2-f104-444e-ac44-432827a86150', N'10f03954-c97e-443a-a809-1aafe3e6ab39')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'10f03954-c97e-443a-a809-1aafe3e6ab39')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'10f03954-c97e-443a-a809-1aafe3e6ab39')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'10f03954-c97e-443a-a809-1aafe3e6ab39')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'10f03954-c97e-443a-a809-1aafe3e6ab39')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'10f03954-c97e-443a-a809-1aafe3e6ab39')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93897cc2-f104-444e-ac44-432827a86150', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dfc919a0-b161-4a29-bf02-ab7047772006', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6579043c-e685-49b1-b5d4-be8433db631a', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'62bf3300-3fd4-405b-9c72-57cf850f5b6b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'0dcae484-be0e-4ce9-a657-594518783839')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93897cc2-f104-444e-ac44-432827a86150', N'0dcae484-be0e-4ce9-a657-594518783839')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'0dcae484-be0e-4ce9-a657-594518783839')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'0dcae484-be0e-4ce9-a657-594518783839')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'0dcae484-be0e-4ce9-a657-594518783839')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dfc919a0-b161-4a29-bf02-ab7047772006', N'0dcae484-be0e-4ce9-a657-594518783839')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6579043c-e685-49b1-b5d4-be8433db631a', N'0dcae484-be0e-4ce9-a657-594518783839')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'0dcae484-be0e-4ce9-a657-594518783839')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'0dcae484-be0e-4ce9-a657-594518783839')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93897cc2-f104-444e-ac44-432827a86150', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'71eb1a6b-834f-411f-bd99-586bdf0e417e', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dfc919a0-b161-4a29-bf02-ab7047772006', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6579043c-e685-49b1-b5d4-be8433db631a', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'fd181f33-a5be-40ba-b243-7b6ca7a8f802')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'bc145390-017a-45a4-a186-7bb464111f5e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93897cc2-f104-444e-ac44-432827a86150', N'bc145390-017a-45a4-a186-7bb464111f5e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'71eb1a6b-834f-411f-bd99-586bdf0e417e', N'bc145390-017a-45a4-a186-7bb464111f5e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'bc145390-017a-45a4-a186-7bb464111f5e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'bc145390-017a-45a4-a186-7bb464111f5e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dfc919a0-b161-4a29-bf02-ab7047772006', N'bc145390-017a-45a4-a186-7bb464111f5e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6579043c-e685-49b1-b5d4-be8433db631a', N'bc145390-017a-45a4-a186-7bb464111f5e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'bc145390-017a-45a4-a186-7bb464111f5e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'bc145390-017a-45a4-a186-7bb464111f5e')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8a484f66-e07b-4a90-a623-1e940cd925b3', N'c8f689d8-13f6-4197-8c30-866368120943')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'6c744f05-4e1b-46ae-b7fa-ae6d79f3adf3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'6c744f05-4e1b-46ae-b7fa-ae6d79f3adf3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'6c744f05-4e1b-46ae-b7fa-ae6d79f3adf3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'6c744f05-4e1b-46ae-b7fa-ae6d79f3adf3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'6c744f05-4e1b-46ae-b7fa-ae6d79f3adf3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'6c744f05-4e1b-46ae-b7fa-ae6d79f3adf3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'6c744f05-4e1b-46ae-b7fa-ae6d79f3adf3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93897cc2-f104-444e-ac44-432827a86150', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'5e851a8a-6276-4a54-87ef-b2b4a545d5e1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'a16daef6-dfed-4dd5-8b74-bd6814912cae')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'a16daef6-dfed-4dd5-8b74-bd6814912cae')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'a16daef6-dfed-4dd5-8b74-bd6814912cae')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'a16daef6-dfed-4dd5-8b74-bd6814912cae')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'a16daef6-dfed-4dd5-8b74-bd6814912cae')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'a16daef6-dfed-4dd5-8b74-bd6814912cae')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93897cc2-f104-444e-ac44-432827a86150', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'71eb1a6b-834f-411f-bd99-586bdf0e417e', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dfc919a0-b161-4a29-bf02-ab7047772006', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6579043c-e685-49b1-b5d4-be8433db631a', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'ae2aa9eb-7694-4d5c-847c-d04c1ebdc656')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93897cc2-f104-444e-ac44-432827a86150', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'71eb1a6b-834f-411f-bd99-586bdf0e417e', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dfc919a0-b161-4a29-bf02-ab7047772006', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6579043c-e685-49b1-b5d4-be8433db631a', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'daba9d07-70a6-4535-a3b0-d1fa62f7b6c0')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'71eb1a6b-834f-411f-bd99-586bdf0e417e', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dfc919a0-b161-4a29-bf02-ab7047772006', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6579043c-e685-49b1-b5d4-be8433db631a', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27ba3893-00db-47c3-97c0-cec0333f0c3b', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'd2608269-0baf-4a15-84b2-f31da710dad5')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'987d14d5-5f88-40a2-95d6-f9a9326d43e4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'987d14d5-5f88-40a2-95d6-f9a9326d43e4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'987d14d5-5f88-40a2-95d6-f9a9326d43e4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'987d14d5-5f88-40a2-95d6-f9a9326d43e4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'987d14d5-5f88-40a2-95d6-f9a9326d43e4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'987d14d5-5f88-40a2-95d6-f9a9326d43e4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'334fdc8c-df33-4944-b30d-0095db96deb8', N'424dd782-72cb-4174-800e-ff4cffb4b1cc')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', N'424dd782-72cb-4174-800e-ff4cffb4b1cc')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', N'424dd782-72cb-4174-800e-ff4cffb4b1cc')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae48b980-8ad2-44a9-95e2-7026421f428f', N'424dd782-72cb-4174-800e-ff4cffb4b1cc')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64c17f9f-25cc-4071-b742-71762c3d4531', N'424dd782-72cb-4174-800e-ff4cffb4b1cc')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', N'424dd782-72cb-4174-800e-ff4cffb4b1cc')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', N'424dd782-72cb-4174-800e-ff4cffb4b1cc')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Title], [Body]) VALUES (1, N'General', N'General')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (1, N'Framework', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (2, N'Dev Client 2', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (3, N'Dev Client 3', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (4, N'Dev Client 4', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (5, N'Dev Client 5', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (6, N'Dev Client 6', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (7, N'Dev Client 7', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (8, N'Dev Client 8', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (9, N'Dev Client 9', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (10, N'Dev Client 10', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (11, N'Dev Client 11', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (12, N'Dev Client 12', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (13, N'Dev Client 13', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (14, N'Dev Client 14', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (15, N'Dev Client 15', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (16, N'Dev Client 16', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (17, N'Dev Client 17', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (18, N'Dev Client 18', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (19, N'Dev Client 19', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (20, N'Dev Client 20', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (21, N'Net Intercom Demo', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (22, N'Brinant Mobile', N'')
INSERT [dbo].[Client] ([ClientId], [Name], [APIKey]) VALUES (23, N'Voetspore', N'')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([ContactsId], [ClientId], [Name], [Surname], [Number], [Body], [Email]) VALUES (1, 1, N'MC', N'van der Bank', N'0724600709', N'Android Developer', N'mc.vanderbank@gmail.com')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[DeviceUsers] ON 

INSERT [dbo].[DeviceUsers] ([DeviceUserId], [ClientId], [DeviceId], [Name], [Surname], [Phone], [Email], [Password], [Approved], [Address]) VALUES (1, 1, N'APA91bEnlPqhf1cqxhQ58m2hRP7qHGY9cgto542o6LD8XdQlykq3Mx2Dntegt6yHJj72xFTWAz-JuZ995RsWARQFzT47I3KvG_WObu9us0BoAmMN-Nx-DLaEybp8_535UnM18nWZqa-PdiDoktd9gNYz-UjOH0T_jZc8t6ffiAMs3UvL4EFXgiU', N'MC', N'Van Der Bank ', N'0724600709', N'mc.vanderbank@gmail.com', N'05e1d15e4df140e3c0b4978e5f1adc66a89cd851ea2e1bdd74c8c6707c836bcd', 1, N'Hatfield ')
INSERT [dbo].[DeviceUsers] ([DeviceUserId], [ClientId], [DeviceId], [Name], [Surname], [Phone], [Email], [Password], [Approved], [Address]) VALUES (1001, 22, N'APA91bFSCOZFslrRP9CbNwqlbt4V5_5c_FdhqKKWxtJyrBSFYcamLugK_wayxAvYkljtsDVgfFVlhuwg2C0SliqZcr8edABu3I26D5ge_80KAONoMjQyVcigUKUGtP3SukdGnHt8-FVwxyXf3m-zX-OMTbAsEOJ3INMWchh6kmbLJ-DigXHp_YQ', N'Eric', N'van der Watt', N'0716736692', N'technical@brinant.co.za', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 0, N'10 Eros Villas, Eros str, Olympus')
INSERT [dbo].[DeviceUsers] ([DeviceUserId], [ClientId], [DeviceId], [Name], [Surname], [Phone], [Email], [Password], [Approved], [Address]) VALUES (2001, 22, N'APA91bEwgItQR5T-7fO2W9qIFqCY4ajxsqgCJsD4t7MdyAfG5AutvY2bni0y2VOQgEYPzileHZKJZ73k8H5GjpEFDErFVx785GgbfhvhsMmZxojb0Bc7bHKGuQEGp2ct5QlA0EsPBPR_Xg_tyJKJbz-Si2i716zDRmES3qKo9XDahekmfz-p7IA', N'Hawken', N'McEwan', N'0606010203', N'hjmcewan@me.com', N'9f82104f7cb7464782ea7f1fe8b6462804137e7d2270ee201b000e601f8b2623', 0, N'532 Brenda St, The Meadows, 0081')
INSERT [dbo].[DeviceUsers] ([DeviceUserId], [ClientId], [DeviceId], [Name], [Surname], [Phone], [Email], [Password], [Approved], [Address]) VALUES (3001, 22, N'APA91bHozyhy11L6RQQqdIqTPpnjXdv6RHlRv5cLZV9xHSHnFA6_gZ5F_GN9PDUqy92BTKb7bfvIFL9ZdXw5SUrEIODN-yzxd8PlabZjqXiyqKwXpsXVC97ZGEGWiDMG-pRVW4LPPPlpSLXTOurXJk5BHqhdI8znV-GqGfZqfB9Sz31ixXiCyRA', N'anton', N'nieuwoudt', N'0832611550', N'technical1@brinant.co.za', N'15b9f97ee9e73394a539ed4264c780eaa0cc663e994f4a73187e7fb39bf7090d', 1, N'709 Rubenstein')
INSERT [dbo].[DeviceUsers] ([DeviceUserId], [ClientId], [DeviceId], [Name], [Surname], [Phone], [Email], [Password], [Approved], [Address]) VALUES (3002, 22, N'APA91bEFCkMgxeFEIMHc0OI2a1HkIkOIjBdWk8aX1qPu0RUKOYYXSyqja7gKgYdBc7dklPeXjndLMdCGnRZwr1pLGRjKFpr87G4Bxh8B8BcFPQzO852AnCywqCeftW1kC7eGRXz1MAPcM-RnrBF_r1i8HO_lr78TgcrR_18uBM8iOJbURHpVHQY', N'Stephen', N'Wolmarans', N'0724718446', N'manager4@brinant.co.za', N'ed12eb20000f3e53945efeb9eca0c664f0ac3382cdf93a8d46b808a990f69a79', 0, N'fhjhdg')
SET IDENTITY_INSERT [dbo].[DeviceUsers] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventsId], [ClientId], [CategoryId], [SubCategoryId], [PictureId], [Title], [Body], [StartDate], [EndDate], [AllDay]) VALUES (1, 1, 1, 1, 0, N'Framework Event', N'Time to launch.', CAST(N'2014-11-19 07:00:00.000' AS DateTime), CAST(N'2014-11-19 08:00:00.000' AS DateTime), 1)
INSERT [dbo].[Events] ([EventsId], [ClientId], [CategoryId], [SubCategoryId], [PictureId], [Title], [Body], [StartDate], [EndDate], [AllDay]) VALUES (1001, 21, 1, 1, 0, N'Stay up to date', N'Keep your users up to date with any and all events that you might host, or simply to remind them of upcoming tasks.', CAST(N'2015-01-10 12:00:00.000' AS DateTime), CAST(N'2015-01-10 14:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [ClientId], [CategoryId], [SubCategoryId], [PictureId], [Title], [Body], [PostDate]) VALUES (1, 23, 1, 1, 0, N'Welkom', N'Welkom by Voetspore se nuwe mobiele toep!

Ons vertou dat ons makliker en vinniger met al ons ouers hierdeur kan kommunikeer en ook op hoogte hou van wat gebeur by die nasorg.

Groete', CAST(N'2014-11-18 00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [ClientId], [CategoryId], [SubCategoryId], [PictureId], [Title], [Body], [PostDate]) VALUES (2, 1, 1, 1, 1, N'Framework News', N'Database cleaned.
Created new clients.

Ready for launch!', CAST(N'2014-11-18 00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [ClientId], [CategoryId], [SubCategoryId], [PictureId], [Title], [Body], [PostDate]) VALUES (3, 1, 1, 1, 2, N'Bigger Images', N'Netintercom, now with bigger images', CAST(N'2014-11-20 00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [ClientId], [CategoryId], [SubCategoryId], [PictureId], [Title], [Body], [PostDate]) VALUES (1001, 21, 1, 1, 0, N'Demonstration App', N'Welcome to the Net Intercom Demo app. This app will give you a glimpse of what you may expect from our service.
Your users will download an app similar to this one from the Google Play store, and be able to receive news and other information as soon as you post them on our web interface.', CAST(N'2015-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [ClientId], [CategoryId], [SubCategoryId], [PictureId], [Title], [Body], [PostDate]) VALUES (1002, 21, 1, 1, 0, N'Online', N'Always be able to quickly communicate with your users, wherever they are.', CAST(N'2015-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [ClientId], [CategoryId], [SubCategoryId], [PictureId], [Title], [Body], [PostDate]) VALUES (1003, 21, 1, 1, 2001, N'Features', N'The basic features our service provides is as follows:

News
Events
Announcements
Contacts
Advertisements

You can also attach pictures to News, Events and Advertisements.

In additional, we can also provide custom features on request.', CAST(N'2015-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [ClientId], [CategoryId], [SubCategoryId], [PictureId], [Title], [Body], [PostDate]) VALUES (1004, 21, 1, 1, 0, N'Customize', N'We customize each app to have it look exactly like you want it to in terms of color schemes.', CAST(N'2015-01-06 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([NotificationsId], [ClientId], [CategoryId], [SubCategoryId], [Title], [Body], [PostDate]) VALUES (1, 1, 1, 1, N'Framework Announcement', N'The Net Intercom service is up and running', CAST(N'2014-11-18' AS Date))
INSERT [dbo].[Notifications] ([NotificationsId], [ClientId], [CategoryId], [SubCategoryId], [Title], [Body], [PostDate]) VALUES (2, 1, 1, 1, N'Test notification', N'Re-enabled notifications to only show when a sync was successful.', CAST(N'2014-11-18' AS Date))
INSERT [dbo].[Notifications] ([NotificationsId], [ClientId], [CategoryId], [SubCategoryId], [Title], [Body], [PostDate]) VALUES (1001, 21, 1, 1, N'Welcome', N'Welcome to the Net Intercom Demo app!', CAST(N'2015-01-06' AS Date))
INSERT [dbo].[Notifications] ([NotificationsId], [ClientId], [CategoryId], [SubCategoryId], [Title], [Body], [PostDate]) VALUES (1002, 21, 1, 1, N'Services', N'We hope you like this app and would consider using our services.', CAST(N'2015-01-06' AS Date))
INSERT [dbo].[Notifications] ([NotificationsId], [ClientId], [CategoryId], [SubCategoryId], [Title], [Body], [PostDate]) VALUES (1003, 21, 1, 1, N'Android 5', N'Compatible with Android 5.0', CAST(N'2015-01-06' AS Date))
SET IDENTITY_INSERT [dbo].[Notifications] OFF
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([PictureId], [PicUrl], [ClientId]) VALUES (1, N'http://ni.4dtech.co.za/Images/Client/1/News/1.png', 1)
INSERT [dbo].[Picture] ([PictureId], [PicUrl], [ClientId]) VALUES (2, N'http://ni.4dtech.co.za/Images/Client/1/News/2.JPG', 1)
INSERT [dbo].[Picture] ([PictureId], [PicUrl], [ClientId]) VALUES (1001, N'http://ni.4dtech.co.za/Images/Client/1/News/3.jpg', 1)
INSERT [dbo].[Picture] ([PictureId], [PicUrl], [ClientId]) VALUES (2001, N'http://ni.4dtech.co.za/Images/Client/21/News/1.jpg', 21)
SET IDENTITY_INSERT [dbo].[Picture] OFF
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (1, N'APA91bEnlPqhf1cqxhQ58m2hRP7qHGY9cgto542o6LD8XdQlykq3Mx2Dntegt6yHJj72xFTWAz-JuZ995RsWARQFzT47I3KvG_WObu9us0BoAmMN-Nx-DLaEybp8_535UnM18nWZqa-PdiDoktd9gNYz-UjOH0T_jZc8t6ffiAMs3UvL4EFXgiU', 1)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (2, N'APA91bH2ZKj4cMDO-xipx5UpogMWxBS1aL-17Pp9xxQL-Fans-3Gby6-mZX5xn-evN7d7i246xCFhaRw3eeHTIhcvPpM9wDofkNL-7BccN3AmJMF9wWyIrqLGfxJmcX2ZfyT4x_QuF05kxCMM88JMrx-mYHxz5lGfC7NNGMvLGr4iYKqtznGnQY', 1)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (3, N'APA91bFRj60v3tHMSP14zaw_1YaENABtf7bdaAlKyehSOUMtYk8V-SLCZo9hmdE7N4Lb2yqxyxB1iLxCeCcfLPKwO1CkerKNUvvEXqXqbncKbHJorco7YYqd8qFi_LSJwsq4DrIXc67nBidBcolN8Oix9RpAcXr0oNYKgYo2Xw8b47SU5-C7fq0', 1)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (4, N'APA91bHO8s_GtZpyJdZXT9LwS5bRwyF8Bn82i72WIgzpEJyWqfWvh35TEGrImNtKcHlYMeF1OKMfTvYwpeh4Bx6HwDrM-TB-dbibvu0iDp_GMedkYGNIu5MdA_b3MDMsU27VfGr7yi8gW0njuh-R8zLU0KR-i-iDFLvbJ1FdgEkDRE07NOkB_Kk', 23)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (5, N'APA91bHo5rb-UgKE0lOcFGrtZPz8xngV1o3w5LLG2vpBp4DKAhSX_U5JS2Nlnk6X59TcoKbWx-HzA9xOcU0OYjn2Wqu3HH_2HQsPkV_3iOytceWVNLC6hyp_8AnQrGrOPJUjCS1j5kTdEYFCZ3s_Atq7T8KUf8WNkaza0xt64rRxA1jPOjEt7EQ', 21)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (6, N'APA91bGONtdERRc8S73PYF3mGKb6D9QwNSkFvVIcyfYkVCTiDzB38GzDjoRCzJKZCwxOdXLDqbErqRciSLlXdr9qDMWo4epbK_vBfwaDhrfKEljx3zUlr7OKeaO2Xhn3k8WjwoL94z1N0PpQYS9Yygl_q1LcepFGGSCVX6oH0S0xewqtK56vses', 23)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (1001, N'APA91bGtfBROK_jMWlPZitFLgFFO-eeUEEsrSlTq1bZCgNTSeYWGXpIEwC1Hyvd94pkWkgdrlHJn0oEdTXuOI99I43sgV4nwrWk0wCmWPaJzJtibPUf9Qy_uLQTeX8jBgWPHB3jXlqFBLE3EDIYqhqBcLzy9TqycT925P-goOXpTb2144ssiUno', 22)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (1002, N'APA91bFSCOZFslrRP9CbNwqlbt4V5_5c_FdhqKKWxtJyrBSFYcamLugK_wayxAvYkljtsDVgfFVlhuwg2C0SliqZcr8edABu3I26D5ge_80KAONoMjQyVcigUKUGtP3SukdGnHt8-FVwxyXf3m-zX-OMTbAsEOJ3INMWchh6kmbLJ-DigXHp_YQ', 22)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (1003, N'APA91bHozyhy11L6RQQqdIqTPpnjXdv6RHlRv5cLZV9xHSHnFA6_gZ5F_GN9PDUqy92BTKb7bfvIFL9ZdXw5SUrEIODN-yzxd8PlabZjqXiyqKwXpsXVC97ZGEGWiDMG-pRVW4LPPPlpSLXTOurXJk5BHqhdI8znV-GqGfZqfB9Sz31ixXiCyRA', 22)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (2001, N'APA91bG9fmXiC6KgzAp5wLhuQ8qsmM04eKaMUIh6Bjvuyn79vp10pSI85ejv0faBBtP56uzHDC2muSXxpncLBLIlAlcd_w6w8fLZrtdWHTk_YSa8giB7KzwJF1V6sXVyMr0SA5JDKnBI8kcFYX1vGLs91hFhj8EVLnlrnwLSO7JzIb0rmSqinhs', 22)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (2002, N'APA91bEwgItQR5T-7fO2W9qIFqCY4ajxsqgCJsD4t7MdyAfG5AutvY2bni0y2VOQgEYPzileHZKJZ73k8H5GjpEFDErFVx785GgbfhvhsMmZxojb0Bc7bHKGuQEGp2ct5QlA0EsPBPR_Xg_tyJKJbz-Si2i716zDRmES3qKo9XDahekmfz-p7IA', 22)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (3001, N'APA91bEDSKKofP3ME8IK8czI5ZpEDD1NZc5Af-Brnaw9hCcRDQKPyGeeHTvUP_MA3eh6ikm07Buc_V78b-fX7yCs5iTTssaR2X9hDth2oy5DCzioVJk3QKSQuOH4ebsZOvHSqgGP71nXuPy8WJ6o7cKQGaJ3rxU5EPv2iUCcDI-B1H0WGYKzwiM', 21)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (3002, N'APA91bHgjmKleDJSm5WhxMdH5Tm4GYFZahwAaxpZw5oIBOflcXi1DD90U1a1EKzR0W9YvxXYqPKlhGTx8KTEicMGwfUUA1LrPG24Tm5Bb6sBRIqRHcJNXKFSglZaJ7KidUDFImiZyg-z2oJR2xeMU83JeQNKINjJvITQsSOgWMahgUGG71IfiBM', 23)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (3003, N'APA91bFzc9PUum6ohhBzJY09gr8HGYiMjZ_7Wq2ykuxVcApEfmLh7C9NRTV6IpaH6YqcVQww8MK261LDtYXCJ7oYeM6mh76JqMV6NgL4suOml2IhV2NpA4hz4LQ5L2BH4BGWmJE0lGG7bgj2XR41JT92WevajYF-q7CheVb4KfPDNiqi0cfi6_I', 22)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (3004, N'APA91bEzFt2zk_n5L3jSNEOq8V-98U1FnslZQnhUYvdp0qvTZLGulqVev1TAupQu4vWK1_nSHbKlwHy_vfHE4dpmzEJWkyrhVxKmkVHNl957qvsNyfyJBLF2DuCJGoMJgkgT03ZzEKJSDbb5s4SNHY5fPy18kk4KaxyQgOWlumE0r1wvl42QBe8', 22)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (3005, N'APA91bEa_C8KTuJLs5cImLFKUfR7j01gCl1aHvkTkZDjT7zGz8b5fpq4jVOc88pGwjX2wtvGPidYit3CzVYUdVr7amNALoqF_hXbmofSmMXeT9liCkBgafhQt7VO_raKMTab1onnIWMi46KB3uEJAlWAjQNUIKqTeK4KeA59AmULTz-j9qQrBUE', 22)
INSERT [dbo].[Registration] ([RegistrationId], [DeviceReg], [ClientId]) VALUES (3006, N'APA91bEFCkMgxeFEIMHc0OI2a1HkIkOIjBdWk8aX1qPu0RUKOYYXSyqja7gKgYdBc7dklPeXjndLMdCGnRZwr1pLGRjKFpr87G4Bxh8B8BcFPQzO852AnCywqCeftW1kC7eGRXz1MAPcM-RnrBF_r1i8HO_lr78TgcrR_18uBM8iOJbURHpVHQY', 22)
SET IDENTITY_INSERT [dbo].[Registration] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceId], [ClientId], [Service], [Query], [DeviceUserId], [ModifiedDate]) VALUES (1, 0, N'Panic', N'Panic', 9, CAST(N'2015-01-09 14:26:06.483' AS DateTime))
INSERT [dbo].[Services] ([ServiceId], [ClientId], [Service], [Query], [DeviceUserId], [ModifiedDate]) VALUES (2, 0, N'Panic', N'Panic', 9, CAST(N'2015-01-15 16:05:22.797' AS DateTime))
INSERT [dbo].[Services] ([ServiceId], [ClientId], [Service], [Query], [DeviceUserId], [ModifiedDate]) VALUES (3, 22, N'Panic', N'Panic', 3001, CAST(N'2015-02-10 22:11:40.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[Services] OFF
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([SettingId], [Setting], [Value], [ClientId]) VALUES (1, N'email', N'technical1@brinant.co.za', 22)
SET IDENTITY_INSERT [dbo].[Settings] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryId], [CategoryId], [Title], [Body]) VALUES (1, 1, N'General', N'General')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UsersId], [ClientId]) VALUES (N'4f5019d8-29e4-4c03-871e-22d7d6b5ddcf', 1, 23)
INSERT [dbo].[Users] ([UserId], [UsersId], [ClientId]) VALUES (N'1913c3c9-a802-4551-bd54-db3aa4a2a36e', 2, 1)
INSERT [dbo].[Users] ([UserId], [UsersId], [ClientId]) VALUES (N'6579043c-e685-49b1-b5d4-be8433db631a', 3, 1)
INSERT [dbo].[Users] ([UserId], [UsersId], [ClientId]) VALUES (N'fc6c4b57-4034-4fc5-811b-22dc616be587', 1001, 22)
INSERT [dbo].[Users] ([UserId], [UsersId], [ClientId]) VALUES (N'71eb1a6b-834f-411f-bd99-586bdf0e417e', 2001, 21)
INSERT [dbo].[Users] ([UserId], [UsersId], [ClientId]) VALUES (N'd1c1ad71-b42f-4598-8df6-7556b11a9725', 2002, 22)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [PK__aspnet_A__C93A4C981D142E48]    Script Date: 2015/02/12 08:36:25 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__17477DE40A340583]    Script Date: 2015/02/12 08:36:25 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__aspnet_A__30910331D9778477]    Script Date: 2015/02/12 08:36:25 AM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_M__1788CC4D27159F6B]    Script Date: 2015/02/12 08:36:25 AM ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__CD67DC58BD171EDC]    Script Date: 2015/02/12 08:36:25 AM ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_P__3214EC06B14F8231]    Script Date: 2015/02/12 08:36:25 AM ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_ncindex2]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_R__8AFACE1B2B36C07E]    Script Date: 2015/02/12 08:36:25 AM ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_U__1788CC4D569A1F32]    Script Date: 2015/02/12 08:36:25 AM ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_Users_Index2]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_UsersInRoles_index]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_Registration]    Script Date: 2015/02/12 08:36:25 AM ******/
CREATE NONCLUSTERED INDEX [index_Registration] ON [dbo].[Registration]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Audit]  WITH CHECK ADD FOREIGN KEY([TableId])
REFERENCES [dbo].[TableNames] ([TableId])
GO
ALTER TABLE [dbo].[Audit]  WITH CHECK ADD FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([TaskId])
GO
ALTER TABLE [dbo].[Audit]  WITH CHECK ADD FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([UsersId])
GO
ALTER TABLE [dbo].[ClientNote]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[ClientNote]  WITH CHECK ADD FOREIGN KEY([NotesId])
REFERENCES [dbo].[Notes] ([NotesId])
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([UsersId])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Support]  WITH CHECK ADD FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([UsersId])
GO
USE [master]
GO
ALTER DATABASE [netinmlf_netint] SET  READ_WRITE 
GO
