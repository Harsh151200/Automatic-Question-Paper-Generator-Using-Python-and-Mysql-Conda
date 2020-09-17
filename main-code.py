# Automatic Question Paper Genrerator using Python and Mysql

import mysql.connector
from mysql.connector import errorcode
import os.path

try:
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="H@rsh@123",
        database="demo-questions"

    )

    print("Connected to database : ", mydb)


    def select_question(co, mks):
        sql_select_Query = """select  questions from ds_questions_sets where coid = %d  and marks = %d  order by rand() limit 1 """
        cursor = mydb.cursor()
        cursor.execute(sql_select_Query % (co, mks))
        records = list(cursor.fetchall())
        return records


    # define a empty dictionary with CO's as keys and their value initialized to '0'
    co_percantage = {
        'CO1': 0, 'CO2': 0, 'CO3': 0, 'CO4': 0, 'CO5': 0, 'CO6': 0
    }

    sum = 0

    # define a dictionary which will store Marks of CO from 20 Marks based on Percentage of CO
    co_values = {
        'CO1': 0, 'CO2': 0, 'CO3': 0, 'CO4': 0, 'CO5': 0, 'CO6': 0
    }

    # create two empty list one will contain qid of questions of 2 marks and other of 5 marks
    list_two_marks = []
    list_five_marks = []

    # create a dictionary which will store questions or qid in form of IAT paper format
    question_paper = {
        '1': {'a': 0, 'b': 0, 'c': 0, 'd': 0, 'e': 0, 'f': 0},
        '2': {'a': 0, 'b': 0},
        '3': {'a': 0, 'b': 0}
    }

    # Take input for each and every CO from the use
    # Sum of input must be equal to 100

    for key in co_percantage:
        print("Enter Percentage value for ", key, ":")
        value = int(input())
        co_percantage.update({key: value})
        sum += value
        print(sum, int(key[2]))

    if sum == 100:
        print("Okay!! CO values  are satisfied")
        for key in co_percantage:
            val = 32 * co_percantage[key] / 100
            co_values.update({key: round(val)})
            print(key, ":", co_values[key]," marks")

        print("The following CO values are not satisfied.Therefore some CO values have been changed by 1 or 2 marks!! ")
        for key in co_values:
            if co_values[key] in [1, 3, 6, 8]:
                print(key, ":", co_values[key])
        for key in co_values:
            if co_values[key] in [3]:  # if any CO is of 3 marks!!
                for x in co_values:
                    if co_values[x] in [6, 8]:
                        co_values.update({key: 4})
                        y = co_values[x] - 1
                        co_values.update({x: y})
                        break
                    if co_values[x] in [3, 4, 1]:
                        co_values.update({key: 2})
                        y = co_values[x] + 1
                        co_values.update({x: y})
                        break

            if co_values[key] == 1:  # if any CO is of 1 marks!!
                for x in co_values:
                    if co_values[x] in [3, 5, 6, 8]:
                        co_values.update({key: 2})
                        y = co_values[x] - 1
                        co_values.update({x: y})
                        break
            if co_values[key] == 6:  # if any CO is of 6 marks!!
                for x in co_values:
                    if co_values[x] in [3, 1, 4]:
                        co_values.update({key: 5})
                        y = co_values[x] + 1
                        co_values.update({x: y})
                        break
                    if co_values[x] in [8, 6, 5]:
                        co_values.update({key: 7})
                        y = co_values[x] - 1
                        co_values.update({x: y})
                        break

            if co_values[key] == 8:  # if any CO is of 8 marks!!
                for x in co_values:
                    if co_values[x] in [1, 3, 4]:
                        co_values.update({key: 7})
                        y = co_values[x] + 1
                        co_values.update({x: y})
                        break
                    if co_values[x] in [6, 5, 8]:
                        co_values.update({key: 9})
                        y = co_values[x] - 1
                        co_values.update({x: y})
                        break
        print("Slight changes in Marks for better selection:")
        for key in co_values:
            print(key, ":", co_values[key]," marks")

        # selecting questions based on marks!!
        print("Getting question from database...................................")
        for key in co_values:
            if co_values[key] == 2:
                a = select_question(int(key[2]), 2)

                list_two_marks.append(a)
            if co_values[key] == 4:
                a = select_question(int(key[2]), 2)

                list_two_marks.append(a)
                a = select_question(int(key[2]), 2)

                while a in list_two_marks:
                    a = select_question(int(key[2]), 2)

                list_two_marks.append(a)
            if co_values[key] == 5:
                a = select_question(int(key[2]), 5)

                list_five_marks.append(a)
            if co_values[key] == 7:
                a = select_question(int(key[2]), 2)

                list_two_marks.append(a)
                a = select_question(int(key[2]), 5)

                list_five_marks.append(a)
            if co_values[key] == 9:
                a = select_question(int(key[2]), 2)

                list_two_marks.append(a)
                a = select_question(int(key[2]), 2)

                list_two_marks.append(a)
                while a in list_two_marks:
                    a = select_question(int(key[2]), 2)

                list_two_marks.append(a)
                a = select_question(int(key[2]), 5)

                list_five_marks.append(a)

        # Adding questions to dictionary for question_paper
        for question_number in question_paper:
            if question_number == '1':  # Adding to Q1.
                for sub_question in question_paper[question_number]:
                    a = list_two_marks[0]
                    question_paper[question_number].update({sub_question: a})
                    list_two_marks.pop(0)
            if question_number == '2':  # Adding to Q2.
                for sub_question in question_paper[question_number]:
                    a = list_five_marks[0]
                    question_paper[question_number].update({sub_question: a})
                    list_five_marks.pop(0)
            if question_number == '3':  # Adding to Q3.
                for sub_question in question_paper[question_number]:
                    a = list_five_marks[0]
                    question_paper[question_number].update({sub_question: a})
                    list_five_marks.pop(0)

        # printing questions in Question Paper format
        file1 = open("finalPaper.txt", "a")
        if os.path.isfile('finalPaper.txt'):
            file1.seek(0)
            file1.truncate()
            file1.seek(0)
        print("\n\n\t\t\t\t\tQUESTION PAPER\n")
        file1.write("\t\t\t\t\t\tQUESTION PAPER\n\n")
        for question_number in question_paper:
            if question_number == '1':
                print("\nQ1.Attempt any five from the following")
                file1.write("\nQ1.Attempt any five from the following")
                for sub_question in question_paper[question_number]:
                    print("\n\t", sub_question, ")", question_paper[question_number][sub_question][0][0])
                    file1.write("\n\t")
                    file1.write(sub_question)
                    file1.write(")")
                    file1.write(question_paper[question_number][sub_question][0][0])
            if question_number == '2':
                print("\nQ2.Attempt any one from the following")
                file1.write("\nQ2.Attempt any one from the following")

                for sub_question in question_paper[question_number]:
                    print("\n\t", sub_question, ")", question_paper[question_number][sub_question][0][0])
                    file1.write("\n\t")
                    file1.write(sub_question)
                    file1.write(")")
                    file1.write(question_paper[question_number][sub_question][0][0])

            if question_number == '3':
                print("\nQ3.Attempt any one from the following")
                file1.write("\nQ1.Attempt any one from the following")

                for sub_question in question_paper[question_number]:
                    print("\n\t", sub_question, ")", question_paper[question_number][sub_question][0][0])
                    file1.write("\n\t")
                    file1.write(sub_question)
                    file1.write(")")
                    file1.write(question_paper[question_number][sub_question][0][0])

    else:
        print("\nSummation of values not equal to 100!!\nPlease Try again!!")
        quit()

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Access denied/wrong username or password!")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist!")
    else:
        print(err)
else:
    mydb.close()