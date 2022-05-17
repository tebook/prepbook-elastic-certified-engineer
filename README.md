
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

Page 33



	The priority of the index should be 502.


Page 43

<img width="593" alt="errata 2" src="https://user-images.githubusercontent.com/99671188/164977812-4b5849d9-3a25-4681-9089-319d1807e82e.PNG">



Let's verify and then delete the index
  
```
GET shakespeare_romeo/_search
DELETE shakespeare_romeo
```

Page 44

![image](https://user-images.githubusercontent.com/99671188/164980205-2795e70c-9625-40c8-8d9c-9160d61967dc.png)


```
POST accounts/_update_by_query
{  
  "script": {
    "source": """
    if (ctx._source.age >= 40){
    ctx._source.balance+=ctx._source.balance*0.006
    }else{
      ctx._source.balance+=ctx._source.balance*0.005
    }
    """,
    "lang": "painless"
  }
}
```

Page 45

<img width="593" alt="errata 3" src="https://user-images.githubusercontent.com/99671188/164978786-0accd359-8f8f-45d9-8f2a-ffce845c0e8f.PNG">


We can use the _ingest/pipeline API to create a pipeline; let's name the pipeline updateaccounts(pipeline name can be anything of your choice)


Page 66-67

![image](https://user-images.githubusercontent.com/99671188/167283482-14370d90-39f5-451e-9cd6-0dac65d93f3c.png)


In the example above, a PUT operation is performed on _security/role API as we are creating a role, followed by the role name, which we conveniently used as demorole.







# Feel free to join the discussion group for any queries

https://www.facebook.com/groups/259633293011438/

