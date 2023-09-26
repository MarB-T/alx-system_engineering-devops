#!/usr/bin/python3
"""
Gets all the information about a user and their TODO list and
completed tasks
"""
import requests
import json


def get_all():
    """ function"""
    data = {}
    for i in range(1, 11):
        id = i
        url = "https://jsonplaceholder.typicode.com"
        res = requests.get('{}/users/{}'.format(url, id)).json()
        res_todo = requests.get("{}/todos".format(url),
                                params={"userId": id}).json()
        name = res.get("username")
        user_data = list(map(
                    lambda x: {
                        "task": x.get("title"),
                        "completed": x.get("completed"),
                        "username": name
                    },
                    res_todo
                ))
        data["{}".format(id)] = user_data
    with open('todo_all_employees.json', 'w') as apidata:
        json.dump(data, apidata)


if __name__ == '__main__':
    get_all()
