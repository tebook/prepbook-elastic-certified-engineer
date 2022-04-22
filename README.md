
# The Exam Prep Guide to Elastic Certified Engineer


Book Errata

Page 31 

![image](https://user-images.githubusercontent.com/99671188/164774029-4eb45b78-5105-4fb4-bbd5-d82b930444d9.png)

We cannot add new documents to a data stream using the _doc API’s PUT format /<target>/_doc/<_id> rather an op_type of create is required.
  
```
PUT apachelogs/_create/1
```
Also a simple POST operation on _doc API will also work
 
```
POST apachelogs/_doc
```












Feel free to join the discussion group for any queries

https://www.facebook.com/groups/259633293011438/

