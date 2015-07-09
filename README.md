# Building Nested Hashes

## Objectives

1. Understand why nested hashes are useful
2. Learn how to build nested hashes
3. Learn how to access and manipulate data in nested hashes

## Intro 

So far, we've seen hashes that store values in associated keys. In the hashes we've built up until now, each key points to a single value. Hashes are so useful, however, because they can be multi-dimensional, or nested. A key in a hash can point to a value that is a *collection of objects*, i.e. an array or even another hash. Let's take a look: 

```ruby
flatiron_school = {
	instructors: ["Avi", "Jeff", "Rose"], 
	dev_team: ["Jonas", "Yeti", "Seiji"],
	students: ["Sarah", "you", "John", "David"]
}
```

In the above example, each key points to an array of names. Let's say we wanted to access that array of instructors. We can do it using the same syntax we've used to access the values of hash keys in single-layer hashes. Let's get that instructors array:

```ruby
flatironschool[:instructors]
#  => ["Avi", "Jeff", "Rose"]
``` 
What if I wanted to grab *just the first name* in the instructor's array? We use the same methods for accessing array index items that we've been using all along: 

```ruby
flatironschool[:instructors][0]
#  => "Avi"
```

Nested hashes can get pretty complicated. You could have a key that points to a value of a hash and that hash can have keys that point to values of still more hashes and so on and so on. You can think of a nested hash as a tree. Let's take a closer look. 

## Epic Tragedy Example

You're 16 years old and back in high school english class. Luckily for us, our teacher is kind of lazy and we get to watch the Romeo and Juliet movie from the '90s with Leonardo DiCaprio and Claire Danes. 

![](http://readme-pics.s3.amazonaws.com/RomeoandJuliet5.jpg)

*If you have not seen this movie, I would recommend watching it before proceeding with this course or anything else in your life*

We need to get ready for the Romeo and Juliet quiz our teacher has scheduled for us. We will definitely be required to answer some questions on the cast of characters and their attributes and relationships to one another. Let's map out that information: 


![](http://readme-pics.s3.amazonaws.com/hash_intro_shakespeare%20(2).png)

What we have here is a nested data structure. There are different levels or tiers of information. On the top tier, we have the family names, beneath that we have key characters, and beneath that we have their attributes. We have an additional layer on the hero/heroine's friends because there are multiple friends. Now that we have a sense of the structure that our collection of information is taking, we're going to build a nested hash that displays it in the same nested way. Our end result will look like this: 

```ruby

epic_tragedy = {
:montagues=> {
   :patriarch => {  
     :name => "Lord Montague", 
     :age =>"53"
  },
   :matriarch => {
      :name => "Lady montagues", 
      :age => "54"
  },
   :hero => {
      :name => "Romeo", 
      :age = >"15"
  },
   :hero_friends => [
      {
         :name => "Benvolio", 
         :age = >"17", 
         :attitude = >"worried"
      },
      { 
        :name => "Steven",
        :age => "30",
        :attitude => "confused"
      }
    ]
 },
 :capulets => {
    :patriarch => {
       :name => "Lord Capulet", 
       :age => "50"
    },
   :matriarch => {
      :name => "Lady Capulet", 
      :age => "51"
   },
   :heroine => {
      :name => "Juliet", 
      :age => "15",
      :status => "alive"
   },
   :heroine_friends=> [
      {
         :name => "Mercutio", 
         :age => "18", 
         :attitude => "hot-headed"
       },
       {
          :name => "Nurse", 
          :age => "44", 
          :attitude => "worried"
       }
   ]
 }
}
```

This is a complicated data structure, so we're going to build it up one step at a time. 

### Building A Nested Hash

The first level of our nested hash are the keys for the family names, "Montague" and "Capulet". We've made them symbols above, because symbols make better hash keys than strings. Below, set the `epic_tragedy` variable equal to a hash with two key/value pairs. The keys should be symbols of the family names (`:montague` and `:capulet`) and the values should be empty hashes. 


%%%

### Step 1: Family Names

~~~ruby

epic_tragedy = 


##leave the following line alone! 

epic_tragedy

~~~solution

epic_tragedy = {:montague => {}, :capulet => {}}

~~~validation 

expect(response).to.have.all.keys([montague: {}, capulet: {}]);

~~~

%%%

At this point, we have a hash that looks like this: 


```ruby
epic_tragedy = {:montague => {}, :capulet => {}}
```

Now it's time to fill out the second level of our hash––the collection of data that constitutes the value hashes of each family name key. 

%%%

### Step 2: Character Roles

Fill out the empty hash that is the value of the `:montague` key. There are four keys in this hash: `:patriarch`, `:matriarch`, `:hero`, `:hero_friends`. The first three of these keys point to a value of any empty hash. The fourth key, `:hero_friends`, has a value of an empty array. 

Then, do the same for the empty hash that is the value of the `:capulet` key. This time, your keys are `:patriarch`, `:matriarch`, `:heroine`, `:heroine_friends`. The values are the same as described above. 


~~~ruby

epic_tragedy = {
   :montague => {
   #your key/value pairs here
   }, 
   :capulet => {
   #your key/value pairs here
   }
}

#don't touch the following line!

epic_tragedy

~~~solution

epic_tragedy = {
   :montague => {
      :patriarch => {},
      :matriarch => {},
      :hero => {},
      :hero_friends => []
   }, 
   :capulet => {
      :patriarch => {},
      :matriarch => {},
      :heroine => {},
      :heroine_friends => []
   }
}

~~~validation 

expect(response).to.have.all.keys([montague: {patriarch: {}, matriarch: {}, hero: {}, hero_friends:[]}, capulet: {patriarch: {}, matriarch: {}, heroine: {}, heroine_friends:[]}]);

~~~

%%%

At this point, we have a hash that looks like this: 

```ruby
epic_tragedy = {
   :montague => {
      :patriarch => {},
      :matriarch => {},
      :hero => {},
      :hero_friends => []
   }, 
   :capulet => {
      :patriarch => {},
      :matriarch => {},
      :heroine => {},
      :heroine_friends => []
   }
}

```

Now we're ready to fill out the empty hashes that constitute the values for the `:patriarch`, `:matriarch` and `:hero`/`:heroine` keys, nested inside the family name keys of our epic `epic_tragedy hash`. 

%%%

### Step 3: Character Attributes

According to the diagram that we saw at the very beginning of this exercise, each character has a set of attributes. Matriarch and Patriarchs have a name and an age. The hero/heroine has a name, age and a status. 

Let's fill out the empty hashes that are the values of the `:patriarch`, `:matriarch` and `:hero`/`:heroine` keys with the following key/value pairs. The Montague patriarch has a name of "Lord Montague" and an age of "53". The Montague matriarch has a name of "Lady Montague" and an age of "54". The Montague hero has a name of "Romeo", an age of "15" and a status of "alive". 

The Capulet patriarch has a name of "Lord Capulet" and an age of "50". The Capulet matriarch has a name of "Lady Capulet" and an age of "51". The Capulet heroine has a name of "Juliette", an age of "15" and a status of "alive".

~~~ruby

epic_tragedy = {
   :montague => {
      :patriarch => {},
      :matriarch => {},
      :hero => {},
      :hero_friends => []
   }, 
   :capulet => {
      :patriarch => {},
      :matriarch => {},
      :heroine => {},
      :heroine_friends => []
   }
}

#don't touch the following line!

epic_tragedy

~~~solution

epic_tragedy = {
   :montague => {
      :patriarch => {name: "Lord Montague", age: "53"},
      :matriarch => {name: "Lady Montague", age: "54"},
      :hero => {name: "Romeo", age: "15", status: "alive"},
      :hero_friends => []
   }, 
   :capulet => {
      :patriarch => {name: "Lord Capulet", age: "50"},
      :matriarch => {name: "Lord Capulet", age: "51"},
      :heroine => {name: "Juliette", age: "15", status: "alive"},
      :heroine_friends => []
   }
}

~~~validation 

expect(response).to.eql({:montague=>{:patriarch=>{:name=>"Lord Montague", :age=>"53"}, :matriarch=>{:name=>"Lady Montague", :age=>"54"}, :hero=>{:name=>"Romeo", :age=>"15", :status=>"alive"}, :hero_friends=>[]}, :capulet=>{:patriarch=>{:name=>"Lord Capulet", :age=>"50"}, :matriarch=>{:name=>"Lord Capulet", :age=>"51"}, :heroine=>{:name=>"Juliette", :age=>"15", :status=>"alive"}, :heroine_friends=>[]}});

~~~

%%%

We're almost done. Our hero and heroine have two friends each. That constitutes a collection of friends. Since they each have a collection of friends, it makes sense to collect those friends in an array. Since each friend will have his or her own attributes (name, age, etc), our array will be *an array of hashses*!


%%%

### Step 4: Nesting Friends and Attributes

The values of the `:hero_friends` and `:heroine_friends` keys currently point to empty arrays. Fill out these empty arrays with a series of hashes that will contain key/value pairs describing these friends. 

The hero's two friends are Benvolio and Steven. So, the `:hero_friends` array will contain two hashes. Each of these two hashes have the following three keys: `:name`, `:age` and `:attitude`. The hero's first friend has a name of "Benvolio", an age of "17" and an attitude of "worried". The hero's second friend has a name of "Steven", an age of "30" and an attitude of "confused". 

The heroine's two friends are Mercutio and Nurse. So, the `:heroine_friends` array will contain two hashes. Each of these two hashes ave the following three keys: name, age and attitude. The heroine's first friend has a name of "Mercutio" an age of "18", and an attitude of "hot-headed". The heroine's second friend has a name of "Nurse" and age of "44" and an attitude of "worried". 

~~~ruby

epic_tragedy = {
   :montague => {
      :patriarch => {name: "Lord Montague", age: "53"},
      :matriarch => {name: "Lady Montague", age: "54"},
      :hero => {name: "Romeo", age: "15", status: "alive"},
      :hero_friends => [
        #your hashes here!
      ]
   }, 
   :capulet => {
      :patriarch => {name: "Lord Capulet", age: "50"},
      :matriarch => {name: "Lord Capulet", age: "51"},
      :heroine => {name: "Juliette", age: "15", status: "alive"},
      :heroine_friends => [
         #your hashes here!
      ]
   }
}

~~~solution

epic_tragedy = {
   :montague => {
      :patriarch => {name: "Lord Montague", age: "53"},
      :matriarch => {name: "Lady Montague", age: "54"},
      :hero => {name: "Romeo", age: "15", status: "alive"},
      :hero_friends => [
         {name: "Benvolio", age: "17", attitude: "worried"},
         {name: "Steven", age: "30", attitude: "confused"}
      ]
   }, 
   :capulet => {
      :patriarch => {name: "Lord Capulet", age: "50"},
      :matriarch => {name: "Lord Capulet", age: "51"},
      :heroine => {name: "Juliette", age: "15", status: "alive"},
      :heroine_friends => [
      		{name: "Mercutio", age: "18", attitude: "hot-headed"}, 
      		{name: "Nurse", age: "44", attitude: "worried"}
      ]
   }
}

~~~validation

expect(response).to.eql({:montague=>{:patriarch=>{:name=>"Lord Montague", :age=>"53"}, :matriarch=>{:name=>"Lady Montague", :age=>"54"}, :hero=>{:name=>"Romeo", :age=>"15", :status=>"alive"}, :hero_friends=>[{:name=>"Benvolio", :age=>"17", :attitude=>"worried"}, {:name=>"Steven", :age=>"30", :attitude=>"confused"}]}, :capulet=>{:patriarch=>{:name=>"Lord Capulet", :age=>"50"}, :matriarch=>{:name=>"Lord Capulet", :age=>"51"}, :heroine=>{:name=>"Juliette", :age=>"15", :status=>"alive"}, :heroine_friends=>[{:name=>"Mercutio", :age=>"18", :attitude=>"hot-headed"}, {:name=>"Nurse", :age=>"44", :attitude=>"worried"}]}});

~~~

## Bonus: Manipulating the Hash

In the previous lesson we learned that you can access value in a hash like this: 

```ruby
hash = {first: "first value!", second: "second value!"}

hash[:first]
#  => "first value!"

```

To access the values in our nested hash, we simply tack on additional keys, until we have the last key that points to the value we want to access. 

For example, to access the Montague patriarch's name, I use the hash name, `epic_tragedy`, following by a chained list of all of the key names the precede the value of his name, enclosed in brackets: 

```ruby
epic_tragedy[:montague][:patriarch][:name]
#  => "Lord Montague"
```

We can even use this method to change the value of a particular key. If I wanted to reset the Montague patriarch's name to "Michael Jordan", I would do it in the following manner: 

```ruby
epic_tragedy[:montague][:patriarch][:name] = "Michael Jordan"

puts epic_tragedy

#  => 
{
   :montague => {
      :patriarch => {name: "Michael Jordan", age: "53"},
      :matriarch => {name: "Lady Montague", age: "54"},
      :hero => {name: "Romeo", age: "15", status: "alive"},
      :hero_friends => [
         {name: "Benvolio", age: "17", attitude: "worried"},
         {name: "Steven", age: "30", attitude: "confused"}
      ]
   }, 
   :capulet => {
      :patriarch => {name: "Lord Capulet", age: "50"},
      :matriarch => {name: "Lord Capulet", age: "51"},
      :heroine => {name: "Juliette", age: "15", status: "alive"},
      :heroine_friends => [
      		{name: "Mercutio", age: "18", attitude: "hot-headed"}, 
      		{name: "Nurse", age: "44", attitude: "worried"}
      ]
   }
}
```
Now it's your turn: 


%%%

### Practicing Manipulating Nested Hashes

We're coming to the end of the epic tragedy of Romeo and Juliette. At this point in the story, Romeo and Juliette are (tragically) dead. Use the above method to change the status of our hero, Romeo, and our heroine, Juliette, from "alive", to "dead". 

~~~ruby

epic_tragedy = {
   :montague => {
      :patriarch => {name: "Lord Montague", age: "53"},
      :matriarch => {name: "Lady Montague", age: "54"},
      :hero => {name: "Romeo", age: "15", status: "alive"},
      :hero_friends => [
         {name: "Benvolio", age: "17", attitude: "worried"},
         {name: "Steven", age: "30", attitude: "confused"}
      ]
   }, 
   :capulet => {
      :patriarch => {name: "Lord Capulet", age: "50"},
      :matriarch => {name: "Lord Capulet", age: "51"},
      :heroine => {name: "Juliette", age: "15", status: "alive"},
      :heroine_friends => [
      		{name: "Mercutio", age: "18", attitude: "hot-headed"}, 
      		{name: "Nurse", age: "44", attitude: "worried"}
      ]
   }
}

#your code here


#don't touch the following line!
epic_tragedy

~~~solution 

epic_tragedy[:montague][:hero][:status] = "dead"
epic_tragedy[:montague][:heroine][:status] = "dead"

~~~validation

expect(response).to.eql({:montague=>{:patriarch=>{:name=>"Lord Montague", :age=>"53"}, :matriarch=>{:name=>"Lady Montague", :age=>"54"}, :hero=>{:name=>"Romeo", :age=>"15", :status=>"dead"}, :hero_friends=>[{:name=>"Benvolio", :age=>"17", :attitude=>"worried"}, {:name=>"Steven", :age=>"30", :attitude=>"confused"}]}, :capulet=>{:patriarch=>{:name=>"Lord Capulet", :age=>"50"}, :matriarch=>{:name=>"Lord Capulet", :age=>"51"}, :heroine=>{:name=>"Juliette", :age=>"15", :status=>"dead"}, :heroine_friends=>[{:name=>"Mercutio", :age=>"18", :attitude=>"hot-headed"}, {:name=>"Nurse", :age=>"44", :attitude=>"worried"}]}}
);

~~~

%%%

And that's it! In the next lab, you'll be building your own nested hashes. Have fun!
