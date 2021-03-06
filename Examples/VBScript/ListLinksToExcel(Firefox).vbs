'
' VBScript example
' Lists all the links in a web page to an Excel sheet
'


Class Script
    Dim driver

    Sub Class_Initialize
        ' Launch the browser and open an URL
        Set driver = CreateObject("Selenium.FirefoxDriver")
        driver.Get "https://en.wikipedia.org/wiki/Main_Page"

        ' List all links, remove duplicates and sort them
        Set links = driver.FindElementsByCss("a").Attribute("href")
        links.Distinct
        links.Sort

        ' Launch Excel and create a Workbook
        Set excel = CreateObject("Excel.Application")
        excel.WorkBooks.Add 	' Add a new workbook
        excel.Visible = 1 		' Let Excel show itself

        ' Write the links in Excel and quit
        links.ToExcel excel.ActiveSheet, "Links"
    End Sub

    Sub Class_Terminate
        driver.Quit    'Stop the browser
    End Sub
End Class

Set s = New Script