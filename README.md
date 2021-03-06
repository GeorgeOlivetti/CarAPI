<html>

<h1>Car Database</h1>

<p>This application is an example REST API. It contains a backend PostgreSQL database, with one table of cars.</p>

<p>The table contains the following attributes:</p>

<p>ID
<br />VIN
<br />Make
<br />Model
<br />Year
<br />Color
<br />ownerFirstName
<br />ownerLastName</p>

<p>Listed below are some example CRUD operations that can be used. All methods below will return a json object.</p>

<font size="3" color="red">Red</font> = mandatory parameter
<br />
<font size="3" color="black">Black</font> = optional parameter
<br />
<br />

<font size="3" color="black">** All actions require an API token in the parameters, click button in application to acquire API token **</font>

<br />
<br />


<table class="tg">
  <tr>
    <th class="tg-0lax">Action</th>
    <th class="tg-0lax">Description</th>
    <th class="tg-0lax">Parameters</th>
    <th class="tg-0lax">Example</th>
  </tr>
  <tr>
    <td class="tg-0lax">printAll</td>
    <td class="tg-0lax">Prints out all cars from the database, can parse certain cars based on parameters</td>
    <td class="tg-0lax">vin, make, model, year, color, ownerFirstName, ownerLastName</td>
    <td class="tg-0lax">/printAll<br>/printAll?make=Toyota<br>/printAll?make=Toyota&amp;color=White<br></td>
  </tr>
  <tr>
    <td class="tg-0lax">showCar</td>
    <td class="tg-0lax">Prints one car from the database</td>
    <td class="tg-viqs">id</td>
    <td class="tg-0lax">/showCar?id=1</td>
  </tr>
  <tr>
    <td class="tg-0lax">createCar</td>
    <td class="tg-0lax">Creates a car in the database</td>
    <td class="tg-0lax"><span style="color:rgb(254, 0, 0)">vin, make, model, year, color, ownerFirstName, ownerLastName</span></td>
    <td class="tg-0lax">/createCar?vin=1GNDT13Z7M2303951&amp;make=Ford&amp;model=Explorer&amp;year=1997&amp;color=Green&amp;ownerFirstName=Jeff&amp;ownerLastName=Adams</td>
  </tr>
  <tr>
    <td class="tg-0lax">addRandomCar</td>
    <td class="tg-0lax">Adds a random car to the database</td>
    <td class="tg-0lax">none</td>
    <td class="tg-0lax">/addRandomCar</td>
  </tr>
  <tr>
    <td class="tg-0lax">editCar</td>
    <td class="tg-0lax">Edits an existing car in the database</td>
    <td class="tg-viqs">id, <span style="color:rgb(0, 0, 0)">vin, make, model, year, color, ownerFirstName, ownerLastName</span></td>
    <td class="tg-0lax">/editCar?id=1&amp;color=Black</td>
  </tr>
  <tr>
    <td class="tg-0lax">deleteCar</td>
    <td class="tg-0lax">Deletes a car from the database</td>
    <td class="tg-0lax"><span style="color:rgb(254, 0, 0)">id</span></td>
    <td class="tg-0lax">/deleteCar?id=1</td>
  </tr>
</table>

  </body>
</html>
