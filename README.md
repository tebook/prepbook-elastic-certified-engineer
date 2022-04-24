
# The Exam Prep Guide to Elastic Certified Engineer


Book Errata

Page 31 

![image](https://user-images.githubusercontent.com/99671188/164774029-4eb45b78-5105-4fb4-bbd5-d82b930444d9.png)

We cannot add new documents to a data stream using the _doc API’s PUT method in /target/_doc/<_id> format, rather an op_type of create is required as shown below.
  
```
PUT apachelogs/_create/1
```
Also a simple POST operation on _doc API will work
 
```
POST apachelogs/_doc
```

Page 43

<img width="593" alt="errata 2" src="https://user-images.githubusercontent.com/99671188/164977812-4b5849d9-3a25-4681-9089-319d1807e82e.PNG">



Let's verify and then delete the index
  
```
GET shakespeare_romeo/_search
DELETE shakespeare_romeo
```











Feel free to join the discussion group for any queries

https://www.facebook.com/groups/259633293011438/

