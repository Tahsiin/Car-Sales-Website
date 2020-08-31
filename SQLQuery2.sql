
 CREATE PROCEDURE [dbo].[Procedure_Car]
      @Action VARCHAR(10)
	  ,@CarId Int = NULL
	  ,@MakeId Int = NULL
	  ,@ModelId Int = NULL
	  ,@ImageId Int = NULL
	  ,@StyleId Int = NULL
	  ,@Image VARCHAR (255) = Null
	  , @Make VARCHAR (50)=NULL
	  , @Model VARCHAR (50)=NULL
	  , @Year VARCHAR (6)=NULL
	  ,@Color VARCHAR (30)=NULL
	  ,@Price float =NULL
	  ,@Style VARCHAR (15)=NULL
	 -- ,@Engine_No VARCHAR (30)=NULL
	  --,@Chassis_No VARCHAR (30)=NULL

AS
BEGIN
	

      SET NOCOUNT ON
      --SELECT
	  
	  
    IF @Action = 'SELECT'
      BEGIN
	  SELECT Car_Id ,[Image], Make , Model, [Month/Year],Color,Price,[Body Style]
            FROM [Car] 
	  
	   INNER JOIN [Body Style] ON [Car].Style_Id=[Body Style].Style_Id  
	   INNER JOIN [Image] ON   [Car].Image_Id=[Image].Image_Id
	   INNER JOIN [Make] ON  [Car].Make_Id=[Make].Make_Id
	   INNER JOIN [Model] ON  [Car].Model_Id=[Model].Model_Id
	  
     
	  END
 
      --INSERT
    IF @Action = 'INSERT'
      BEGIN
	  
	        INSERT INTO [Car]([Month/Year],Color,Price) VALUES (@Year ,@Color ,@Price)

			INSERT INTO [Body Style]([Body Style]) VALUES (@Style)

			INSERT INTO [Image]([Image]) VALUES (@Image)

			INSERT INTO [Make]([Make]) VALUES (@Make)

			INSERT INTO [Model]([Model]) VALUES (@Model)




			



	  END
 
      --UPDATE
    IF @Action = 'UPDATE'
      BEGIN
            UPDATE [Car]
            SET [Month/Year]=@Year , Color=@Color, Price=@Price 
            WHERE Car_Id = @CarId
    
			UPDATE [Body Style]
			SET [Body Style]=@Style
			WHERE Style_Id=@StyleId
			
			UPDATE [Make]
			SET [Make]=@Make
			WHERE Make_Id=@MakeId

			UPDATE [Model]
			SET [Model]=@Model
			WHERE Model_Id=@ModelId

			UPDATE [Image]
			SET [Image]=@Image
			WHERE Image_Id=@ImageId

	  END
 
      --DELETE
    IF @Action = 'DELETE'
      BEGIN
            DELETE FROM [Car]
            WHERE Car_Id = @CarId

			DELETE FROM[Make]
			WHERE Make_Id=@MakeId
			
			DELETE FROM[Model]
			WHERE Model_Id=@ModelId
			
			DELETE FROM[Image]
			WHERE Image_Id=@ImageId
			
			DELETE FROM[Body Style]
			WHERE Style_Id=@StyleId
      END

END