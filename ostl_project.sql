-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2020 at 05:51 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `updated_sem4`
--

-- --------------------------------------------------------

--
-- Table structure for table `co`
--

CREATE TABLE `co` (
  `coid` int(10) NOT NULL,
  `course_outcome` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `co`
--

INSERT INTO `co` (`coid`, `course_outcome`) VALUES
(1, 'Introduction to Data Structures:\r\n\r\nIntroduction, Types of Data Structures – Linear and Nonlinear, Operations on Data Structures, Concept of ADT, Arrays.'),
(2, 'Stack and Queues:\r\n\r\nIntroduction, ADT of Stack, Operations on Stack, Array Implementation of Stack, Applications of Stack – Well form-ness of Parenthesis, Infix to Postfix Conversion and Postfix Evaluation, Recursion. ADT of Queue, Operations on Queue, Array Implementation of Queue, Circular Queue, Priority Queue, Double Ended Queue, Applications of Queue.'),
(3, 'Linked List:\r\n\r\nIntroduction, Representation of Linked List, Linked List v/s Array, Implementation of Linked List, Linked Implementation of Stack and Queue, Circular Linked List, Doubly Linked List, Application – Polynomial Representation and Addition.'),
(4, 'Trees:\r\n\r\nIntroduction, Tree Terminologies, Binary Tree, Representation, Types of Binary Tree, Binary Tree Traversals, Binary Search Tree, Implementation of Binary Search Tree, Applications – Expression Tree, Huffman Encoding. Search Trees – AVL, B Tree, B+ Tree, Splay Tree and Trie.'),
(5, 'Graphs:\r\n\r\nIntroduction, Graph Terminologies, Representation, Graph Traversals – Depth First Search (DFS) and Breadth First Search (BFS), Application – Topological Sorting'),
(6, 'Sorting and Searching:\r\n\r\nIntroduction, Bubble Sort, Insertion Sort, Merge Sort, Quick Sort. Linear Search, Binary Search, Hashing – Concept, Hash Functions, Collision Handling Techniques.');

-- --------------------------------------------------------

--
-- Table structure for table `ds_questions_sets`
--

CREATE TABLE `ds_questions_sets` (
  `qid` int(50) NOT NULL,
  `questions` text NOT NULL,
  `coid` int(50) NOT NULL,
  `marks` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ds_questions_sets`
--

INSERT INTO `ds_questions_sets` (`qid`, `questions`, `coid`, `marks`) VALUES
(1, 'Explain classification of data sructures.', 1, 2),
(2, 'Expalin ADT.List  the linear and non-linear Data structures with examples.', 1, 2),
(3, 'What are various operations possible on data structures? \r\n', 1, 2),
(4, 'State advantages of Linked List over arrays.', 3, 2),
(5, 'Explain Double ended Queue (Deque).', 2, 2),
(6, 'Explain Priority Queue with example', 2, 2),
(7, 'Advantages of Circular Queue.\r\n', 2, 2),
(8, 'What are different ways of representing a Graph data structure on a computer?', 5, 2),
(9, 'Explain Expression Tree with example', 4, 2),
(10, 'Describe Tries with an example', 4, 2),
(11, 'What is hashing? What properties should a good hash function demonstrate?', 6, 2),
(12, 'Explain different types of tree traversals with example. ', 4, 2),
(13, 'Explain Threaded Binary tree in detail', 4, 2),
(14, 'Write a program in ‘C’ to check for balanced parenthesis in an expression using stack.', 2, 5),
(15, ' Write a program in ‘C’ to implement Circular Queue using array.', 2, 5),
(16, 'Write a program in ‘C’ to convert Infix expression to Postfix expression', 2, 5),
(17, 'Write a program in ‘C’ to implement Stack using Array .Perform the following operations:\r\n(i) Push (ii) Pop (iii) Peep (iv) Display the stack contents\r\n', 2, 5),
(18, 'Write a program in ‘C’ to implement Stack using Linked-List .Perform the following operations:\r\n(i) Push (ii) Pop (iii) Peep (iv) Display the stack contents', 3, 5),
(19, ' Write a program to implement Singly Linked List. Provide the following operations:\r\n(i) Insert a node (ii) Delete a node (iii) Display the list', 3, 5),
(20, ' Write a program to implement Circular Linked List. Provide the following operations:\r\n(i) Insert a node (ii) Delete a node (iii) Display the list\r\n', 3, 5),
(21, 'Write a program in ‘C’ to implement Queue using Linked-List .Perform the following operations:\r\n(i) Enqueue (ii) Dequeue (iii) Display the queue contents', 3, 5),
(22, 'Write a program in ‘C’ to implement Queue using Array .Perform the following operations:\r\n(i) Enqueue (ii) Dequeue (iii) Display the queue contents', 2, 5),
(23, 'Write a program in ‘C’ to implement Quick sort. Explain the steps with one example', 6, 5),
(24, 'Explain Huffman Encoding with suitable example', 4, 5),
(25, 'Explain different cases for deletion of a node in binary search tree. Write function for each case.', 4, 5),
(26, 'Explain Depth First search (DFS) Traversal with an example. Write the recursive function for DFS', 5, 5),
(27, 'Given the frequency for the following symbols, compute the Huffman code for each symbol.\r\nsymbol=frequency:\r\nA=24\r\nB=32\r\nC=10\r\nD=18\r\nE=4\r\n', 4, 5),
(28, 'What are expression trees? What are its advantages? Derive the expression tree for the following\r\nalgebraic expression: (a - (b/c)) * ((d/e) ^ f)', 4, 5),
(29, 'Given the postorder and inorder traversal of a binary tree, construct the original tree:\r\nPostorder: D E F B G L J K H C A\r\nInorder: D B F E A G C L J H K', 4, 5),
(30, ' Give C function for Breadth First Search Traversal of a graph. Explain the code with an example. ', 5, 5),
(31, ' Write a C program to implement Merge Sort', 6, 5),
(32, 'Insert the following elements in AVL tree: 44, 52,13,79,34,56,26,10. Explain different rotations\r\nthat can be used.', 4, 5),
(33, 'What is a linked list?', 3, 2),
(34, 'Write binary_search() function.', 6, 2),
(35, 'What are Data Structures? What are different Data Structures. Also explain the concept of ADT.', 1, 5),
(36, 'what do you mean by polynomial representation in link list? ', 3, 2),
(37, 'what do you mean by Depth First Search(DFS)\r\nand Breadth First Search(BFS)(defination only).', 5, 2),
(38, 'what do you mean by Topological Sorting?', 5, 2),
(39, 'Explain the term collision handling and write down it\'s different techniques.', 6, 2),
(40, 'What do you mean by Array. Write down the different types of an Array. Explain any with example.  ', 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `co`
--
ALTER TABLE `co`
  ADD PRIMARY KEY (`coid`);

--
-- Indexes for table `ds_questions_sets`
--
ALTER TABLE `ds_questions_sets`
  ADD UNIQUE KEY `Question id` (`qid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `co`
--
ALTER TABLE `co`
  MODIFY `coid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ds_questions_sets`
--
ALTER TABLE `ds_questions_sets`
  MODIFY `qid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
