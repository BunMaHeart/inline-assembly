assembly {
    let sortedArrayPtr := add(sortedArray, 32)
    let length := mload(sortedArray)
    for {let i := 0} lt(i, sub(length, 1)) {i := add(i, 1)} {
        let minIndex := i
        for {let j := add(i, 1)} lt(j, length) {j := add(j, 1)} {
            let jPtr := add(sortedArrayPtr, mul(j, 32))
            let minIndexPtr := add(sortedArrayPtr, mul(minIndex, 32))
            let minIndexVal := mload(minIndexPtr)
            let jVal := mload(jPtr)
            if lt(jVal, minIndexVal) {
                minIndex := j
            }
        }
        if eq(minIndex, i) {
            continue
        }
        let iPtr := add(sortedArrayPtr, mul(i, 32))
        let minIndexPtr := add(sortedArrayPtr, mul(minIndex, 32))
        let temp := mload(iPtr)
        mstore(iPtr, mload(minIndexPtr))
        mstore(minIndexPtr, temp)
    }
}
