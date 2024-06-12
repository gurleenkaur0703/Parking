# ParkingLot Smart Contract
The ParkingLot smart contract manages a parking lot with a fixed number of parking spaces.
It allows cars to be parked and removed by the owner.
![image](https://github.com/gurleenkaur0703/Parking/assets/170515862/2caea124-0ac4-4be5-abbf-bda36e97b9b9)

## Contract Description:

### State Variables

#### •	owner: This variable stores the address of the owner who deployed the contract.
#### •	totalSpaces: Represents the total number of parking spaces available in the parking lot
#### •	totalCars: Tracks the current number of cars parked in the parking lot

### •	constructor():
The constructor function initializes the owner variable with the address of the contract deployer (msg.sender).

### Mappings

#### •	spaceAvailability:
Maps each parking space index to a boolean value (true if occupied, false if vacant).
#### •  carAtSpace:
Maps each parking space index to the address of the car parked there.

### Modifiers
#### • onlyOwner():
A modifier that restricts access to functions only to the owner of the contract.
It uses the require statement to ensure that the caller is the owner.

### Functions
#### •	parkCar(address _carAddress)
Only accessible by the owner (onlyOwner modifier).
Checks if there are available parking spaces (totalCars < 5).
Iterates through the parking spaces (1 to 5).
Finds the first available parking space (spaceAvailability[i] == false).
Marks the parking space as occupied (spaceAvailability[i] = true), 
assigns the car address to the space (carAtSpace[i] = _carAddress), increments totalCars, and exits the loop (break).
#### •	removeCar(address _carAddress):
Only accessible by the owner (onlyOwner modifier).
Checks if there are cars parked (totalCars > 0).
Searches for the parking space where the specified car is parked (carAtSpace[i] == _carAddress).
Removes the car from the parking space (carAtSpace[spaceOfCar] = address(0)), marks the parking space as vacant (spaceAvailability[spaceOfCar] = false), decrements totalCars.
Reverts with an error message if the car is not found (!carFound).
#### •	assertAvailabilty():
A view function that asserts that the total number of cars (totalCars) is within the valid range (0 to 5).

## Getting Started

### Installing

•	Simply search for remix.ethereum.org in your web browser.	No installation is required.

### Executing program
• Open Remix IDE in your browser. Create a New File with .sol extention. Copy and paste the following code into the file:
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ParkingLot{
    address public owner;
    uint public totalSpaces=5;
    uint public totalCars=0;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner,"Only Owner Can Access");
        _;
    }

    mapping(uint=>bool) public spaceAvailability;
    mapping(uint=>address) public carAtSpace;

    function parkCar(address _carAddress) public onlyOwner{
        require(totalCars<5,"no parking space available");
        for(uint i=1;i<=5;i++){
            if(spaceAvailability[i]==false){
                spaceAvailability[i]=true;
                carAtSpace[i]=_carAddress;
                totalCars++;
                break;
            }
        }
    }

    function removeCar(address _carAddress)public onlyOwner{
        require(totalCars>0,"no car to remove");
        uint spaceOfCar=1;
        bool carFound=false;

        for(uint i=1;i<=5;i++){
            if(carAtSpace[i]==_carAddress){
                spaceOfCar=i;
                carFound=true;
            }
        }

        carAtSpace[spaceOfCar]=address(0);
        spaceAvailability[spaceOfCar]=false;
        totalCars--;

        if(!carFound){
            revert("No car Found!");
        }

    }

    function assertAvailabilty() public view{
        assert(totalCars>=0 && totalCars<=5);
    }
}
```
Compile and then deploy the Contract. Call the parkCar function with the address of the car to park it in an available space.
Call the removeCar function with the address of the car to remove it from the parking space.
Call the assertAvailability function to ensure that the number of parked cars is valid.

## Authors

Gurleen Kaur
(@https://github.com/gurleenkaur0703)

## License

This project is licensed under the MIT License.
