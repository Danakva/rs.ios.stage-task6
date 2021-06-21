import Foundation

class CoronaClass {
 
     var seats = [Int]()
     let numberOfSeats: Int

     init(n: Int) {
        numberOfSeats = n
     }
     
     func seat() -> Int {
        var newSeat: Int = 0
        if seats.count == 0 {
            newSeat = 0
        } else if seats.count == 1 {
            let lengthFromFirst = seats[0] - 0
            let lengthFromlast = numberOfSeats - seats[0]
            newSeat = lengthFromlast > lengthFromFirst ? numberOfSeats - 1 : 0
        } else if seats.count > 1 && seats.count < numberOfSeats  {
            var tempArr: [(seat: Int, minDist: Int)] = []
            for i in 1..<seats.count {
                let seat = (seats[i] - seats[i-1]) / 2 + seats[i-1]
                let minDistance = min(seats[i] - seat - 1, seat - seats[i-1] - 1)
                if minDistance >= 0 {
                    tempArr.append((seat, minDistance))
                }
            }
            if !seats.contains(numberOfSeats-1) {
                
            }
            if !seats.contains(0) {
                tempArr.append((0, seats.first! - 1))
            }
            if !seats.contains(numberOfSeats-1) {
                tempArr.append((numberOfSeats-1, numberOfSeats - 1 - seats.last! - 1))
            }
            newSeat = tempArr.sorted {
                if $0.minDist == $1.minDist {
                    return $0.seat < $1.seat
                } else {
                    return $0.minDist > $1.minDist
                }
            }.first!.seat
        }
        seats.append(newSeat)
        seats.sort()
        return newSeat
     }
     
     func leave(_ p: Int) {
        guard let index = seats.firstIndex(of: p) else { return }
        seats.remove(at: index)
     }
}
