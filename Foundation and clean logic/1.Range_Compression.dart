List<String> rangeCompression(List<int> nums){
    List<String> result = [];
    int start = nums[0];
    int prev = nums[0];
    for(int i = 1; i<nums.length; i++ ){
        if(nums[i] == prev+1){
            prev = nums[i];
        }else{
            result.add(start == prev ? '$start' : '$start-$prev');
            start = nums[i];
            prev = nums[i];
        }
    }
            result.add(start == prev ? '$start' : '$start-$prev');

    return result;
}
void main() {
List<String> result = rangeCompression([1,2,3,5,6,9]);
print(result);
}