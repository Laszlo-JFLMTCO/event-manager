# Event Manager

**Short description:** Event Manager is a solution that imports various collection of data stored in CSV file format and prepare user defined speific output out of that.

**Project requirement details:** http://tutorials.jumpstartlab.com/projects/eventmanager.html#iteration-0:-loading-a-file

**Branch: flexible-csv**

Key branch features:
* Flexible handling of columns:

Based on the CSV file structure definition (first row within the CSV file) the column titles are converted to lower case and that same conversation is applied to any future request of those columns by their names. I added this feature based on the provided CSV example, where column titles were in a mix of upper case and lower case letters, no following any general formatting. This allows greater flexibility on the input side for entering reference to any of the columns.
```ruby
Example (both will produce the same output):
test_csv.list_all(["First_NAME", "ziPCODe"])
test_csv.list_all(["FiRSt_nAmE", "ZiPCodE"])
```
* Flexible order of retrieving some or all cells from each row:

This branch relies on my own CSV parser. This also has a flexible implementation to print out summary of various fields in a customizable order.

```ruby
Example:
test_csv.list_all(["cITY", "ZiPCodE", "First_NAME", "ziPCODe"])
```

```ruby
Raw data:
 ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode
1,11/12/08 10:47,Allison,Nguyen,arannon@jumpstartlab.com,6154385000,3155 19th St NW,Washington,DC,20010
2,11/12/08 13:23,SArah,Hankins,pinalevitsky@jumpstartlab.com,414-520-5000,2022 15th Street NW,Washington,DC,20009
3,11/12/08 13:30,Sarah,Xx,lqrm4462@jumpstartlab.com,(941)979-2000,4175 3rd Street North,Saint Petersburg,FL,33703
```
```ruby
Output:
["Washington 20010 Allison 20010",
"Washington 20009 SArah 20009",
"Saint Petersburg 33703 Sarah 33703"]
```