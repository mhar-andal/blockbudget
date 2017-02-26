pragma solidity ^0.4.4;

contract Blockbudget {
    //address owner;
    address account;

    uint taskCount;
    uint categoryCount;
    uint balance;

    struct task {
        string name;
        uint amount;
        uint date;
    }

    mapping (uint => task) taskList;    //overall task list

    struct category {
        string name;
        uint budget;
        uint ctc;
        mapping (uint => task) ctl;
    }

    mapping (uint => category) categoryList;


    function Blockbudget() {
        balance = 10000;
    }

    function getBalance() returns(uint) {
        return balance;
    }

    /*
    ** @returns uint containing the amount of "change" you are due
    */
    function payTask(uint taskID, uint amnt) returns(uint) {
        uint tAmount = taskList[taskID].amount;

        if (tAmount == 0) {
            return amnt;
        }
        else if (tAmount < amnt) {
            amnt -= tAmount;
            taskList[taskID].amount = 0;
            return amnt;
        }
        else {
            taskList[taskID].amount -= amnt;
            return 0;
        }
    }

    function getTask() returns(string, uint, uint) {
        task t = taskList[taskCount];
        return (t.name, t.amount, t.date);
    }

    function getTask(uint taskID) returns(string, uint, uint) {
        task t = taskList[taskID];
        return (t.name, t.amount, t.date);
    }

    function addTask(string c, string n, uint amount, uint date) returns(bool) {
        var tasknew = task(n, amount, date);
        taskList[taskCount + 1] = tasknew;
        for (uint i = 1; i <= categoryCount; i++) {
            if (compareString(n, categoryList[i].name)) {
                categoryList[i].ctl[categoryList[i].ctc + 1] = tasknew;
            }
        }
        taskCount++;
        return true;
    }

    function getCategory(uint n) returns(string, uint, uint) {
        return (categoryList[n].name, categoryList[n].budget, categoryList[n].ctc);
    }

    function getCategory(string n) returns(string, uint, uint) {
        for (uint i = 1; i <= categoryCount; i++) {
            if (compareString(n, categoryList[i].name)) {
                return (categoryList[i].name, categoryList[i].budget, categoryList[i].ctc);
            }
        }
    }

    function addCategory(string n, uint b) returns(bool) {
        var categorynew = category(n, b, 0);            //missing 4th param
        categoryList[categoryCount + 1] = categorynew;
        categoryCount++;
        return true;
    }

    function getUpcomingTask() returns(string, uint, uint) {
        uint index = 1;
        uint next = taskList[1].date;
        for (uint i = 2; i <= taskCount; i++) {
            if (taskList[i].date < next) {
                index = i;
                next = taskList[i].date;
            }
        }

        return (taskList[index].name, taskList[index].amount, taskList[index].date);
    }

    function getUpcomingTask(string n) returns(string, uint, uint) {
        for (uint i = 1; i <= categoryCount; i++) {
            if (compareString(n, categoryList[i].name)) {
                uint index = 1;
                uint next = categoryList[i].ctl[1].date;
                for (uint x = 2; x <= categoryList[i].ctc; x++) {
                    if (categoryList[i].ctl[x].date < next) {
                        index = x;
                        next = categoryList[i].ctl[x].date;
                    }
                }

                return (categoryList[i].ctl[x].name, categoryList[i].ctl[x].amount, categoryList[i].ctl[x].date);
            }
        }
    }

    function compareString(string a, string b) returns(bool) {
        uint tf;
        assembly {
            tf := and(a, b)
        }
        return tf == 1;
    }
}
