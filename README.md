# 100 logical programming

## Foundations and Clean Logic

### 1.Range Compression

- Traverse the sorted list once
- Keep two pointers:
  - `start` → beginning of the current range
  - `prev` → last number in the current range
- If the current number is consecutive (`prev + 1`), extend the range
- If not consecutive, save the current range as:
  - a single number if `start == prev`
  - a range `start-prev` otherwise
- Reset `start` and `prev` for the new range
- After traversal, add the final range to the result

### 2.Stable Partition by Predicate

- Separates even and odd numbers from a list.
- Uses `isEven` as the predicate.
- Even numbers come first, then odd numbers.
- Original order is preserved.
- Uses two lists and merges them.
- Time: O(n), Space: O(n)

### 3.Validate and Normalize Email

- Trims leading and trailing spaces from the input.
- Splits the string using `@`.
- Returns `null` if the email format is invalid.
- Keeps the local part unchanged.
- Converts the domain part to lowercase.
- Ensures the domain contains a valid `.`.
- Returns the normalized email if valid.
- Time: O(n), Space: O(n)

### 4.Custom Base Conversion

- Converts a number into a string using a custom alphabet.
- Treats the alphabet length as the base.
- `encode` repeatedly divides the number and maps remainders to characters.
- `decode` converts the string back to a number using positional value.
- Uses a lookup map for fast character-to-value conversion.
- Works for any base defined by the alphabet.
- Time: O(n), Space: O(n)

### 6.Deterministic Random Shuffle (Seeded)

- Implements a pseudo-random number generator using a seed.
- `nextRand` generates the next deterministic random value.
- Uses Fisher–Yates shuffle algorithm.
- Shuffling is repeatable for the same seed.
- Swaps elements from the end toward the start.
- Original list is not modified.
- Time: O(n), Space: O(n)

### 7.Time Window Overlap Checker

- Stores each interval with its original index.
- Sorts intervals by start time.
- Compares each interval with the next one.
- Detects overlap if next start < current end.
- Returns indices of the first overlapping pair.
- Returns empty list if no overlap exists.
- Time: O(n log n), Space: O(n)

### 9. Kth Missing Positive

- Finds the k-th missing positive number from a sorted list.
- Tracks gaps between consecutive numbers.
- Counts how many numbers are missing in each gap.
- Returns the answer once the k-th missing is found.
- If not found inside the list, continues after the last element.
- Time: O(n), Space: O(1)

## Arrays and Strings

### 11. Two-Sum with Index Rules

- Finds two indices whose values sum to the target.
- Uses a map to store numbers and their first index.
- Checks for complement `target - nums[i]` in the map.
- Picks the pair with the smallest second index, breaking ties by first index.
- Returns empty list if no pair exists.
- Time: O(n), Space: O(n)

### 14. First Non-Repeating Character Stream

- Tracks character frequencies in a fixed-size array.
- Uses a queue to maintain order of characters seen so far.
- For each character in the stream:
  - Increment its frequency.
  - Add it to the queue.
  - Remove characters from the front of the queue if they repeat.
- Adds the first non-repeating character to the result, or `#` if none exists.
- Time: O(n), Space: O(1) (only 26 letters)

### 15. Anagram Groups with Canonical Key

- Groups words that are anagrams of each other.
- For each word:
  - Sort its letters to form a key.
  - Store indices of words with the same key in a map.
- Groups are sorted by:
  - Descending group size.
  - If equal, by first occurrence index.
- Constructs the final list of grouped words.
- Time: O(n \* m log m) (n = number of words, m = max word length)
- Space: O(n)

### 16. String Multiply (No BigInt)

- Uses an array to store intermediate multiplication results
- Multiply digits like grade-school method:
  - Multiply each digit of num1 with each digit of num2
  - Add carry to the next position
- After multiplication, convert array to string
- Remove leading zeros
- Returns the product as a string
- Time: O(m \* n), Space: O(m + n) (m,n = lengths of input strings)

### 17. Edit Distance One-Away Checker

- Checks if two strings are zero or one edit away (insert, delete, replace).
- Compares string lengths to decide the operation:
  - Same length → possible replace.
  - Length differs by 1 → possible insert/delete.
  - Length differs by more than 1 → impossible.
- Uses two pointers to traverse strings and track mismatches.
- Returns the edit operation if one edit is needed, or `true` if identical.
- Returns `false` if more than one edit is required.
- Time: O(n), Space: O(1)

### 19. Zigzag Iterator

- Keeps a queue of [list index, next position] for all lists with elements
- On next():
  - Take the first element from the queue
  - Return the value at that position
  - If the list still has more items, add it back to the end of the queue
- Skips exhausted lists automatically
- Iterates in round-robin order over multiple lists
- Time: O(total elements), Space: O(k) (number of lists)

## Hashing and Frequency Tricks

### 21. Top-K Frequent with Tie Rules

- Counts frequency of each number using a map.
- Converts map to list of `[number, frequency]` pairs.
- Sorts pairs by:
  - Descending frequency.
  - Ascending number if frequencies tie.
- Picks the top `k` numbers from the sorted list.
- Time: O(n log n), Space: O(n)

### 22. Subarray Sum Equals K

- Keeps a running sum while going through the list
- Uses a map to remember how many times each sum has appeared
- For each number:
  - Add it to the running sum
  - Check if (running sum - k) is in the map → a subarray sums to k
  - Update the map with the current running sum
- Returns the total number of subarrays with sum equal to k
- Time: O(n), Space: O(n)

### 23. Longest Consecutive Sequence

- Converts the list to a set for fast lookup
- Goes through each number:
  - If the number before it is not in the set → start a new sequence
  - Count how long the sequence continues by checking next numbers
- Keeps track of the longest sequence found
- Returns the length of the longest consecutive numbers
- Time: O(n), Space: O(n)

### 28. Minimum Deletions to Make Frequencies Unique

- Count how many times each character appears
- Use a set to track frequencies that are already used
- For each character frequency:
  - While it is already used and greater than 0:
    - Decrease frequency by 1
    - Increase deletions count
  - Add the final frequency to the set if > 0
- Returns the minimum number of deletions needed
- Time: O(n), Space: O(1) (only 26 letters)

### 29. Subdomain Visit Count

- For each count-paired domain:
  - Split into count and full domain
  - Split domain by '.' and generate all subdomains
  - Add count to each subdomain in a map
- Format each subdomain with its total count
- Returns a list of strings with counts and subdomains
- Time: O(n \* m), Space: O(n) (n = number of domains, m = max parts in domain)

## Stacks, Queues, and Parsing

### 33. Decode Nested Repetition

- Uses two stacks: one for counts, one for previous strings
- Goes through the string character by character:
  - Number → build the repeat count
  - '[' → push current string and count to stacks, reset current string
  - ']' → pop count and previous string, repeat current string and append to previous
  - Letter → append to current string
- Returns the final decoded string
- Time: O(n), Space: O(n)

## Trees and Recursion

### 52. Validate Binary Search Tree

- Uses recursion to check each node:
  - Pass minimum and maximum allowed values for the current subtree
  - Left child must be < current node
  - Right child must be > current node
- Returns false if any node violates BST property
- Returns true if all nodes are valid
- Time: O(n), Space: O(h) (n = nodes, h = tree height)
