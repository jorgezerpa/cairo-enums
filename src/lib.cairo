use core::dict::{Felt252Dict};

#[derive(Drop)]
enum Direction {
    North:Option<u64>,
    South:u64,
    East:u64,
    West:u64,
    NoDirection,
    DiagonalNorthhWest: (u64, u64),
    DiagonalNorthEast: DiagonalNorthEast<u64>,
    DiagonalSouthWest: DiagonalSouthWest,
}

#[derive(Drop)]
enum DiagonalNorthEast<T> {
    NorthEst: T,
    SouthEst: T,
}

#[derive(Drop)]
struct DiagonalSouthWest {
    south:u64,
    west: u64,
}

// Trait Implementations for enums
trait CurrentDirection {
    fn get_current_position(self:Direction);
}

impl PositionImpl of CurrentDirection {
    fn get_current_position (self:Direction){
        match self {
            Direction::North(value) => { 
                match value {
                    Option::Some(value) => { 
                        println!("moving north by {}", value);
                     },
                    Option::None => { 
                        println!("Moving north");
                     }
                }
            },
            Direction::South => { println!("is moving south")},
            Direction::West => { println!("is moving west")},
            Direction::East => { println!("is moving est")},
            Direction::NoDirection => { println!("is not moving")},
            Direction::DiagonalNorthEast(value) => { 
               match value {
                DiagonalNorthEast::NorthEst(value) => println!("is moving nort {}", value),
                DiagonalNorthEast::SouthEst(value) => println!("is moving south {}", value),
               }
            
            },
            Direction::DiagonalNorthhWest => { println!("is moving nort west")},
            Direction::DiagonalSouthWest => { println!("is moving south west")},
        }
    }
}

fn main () {
    let noDirection = Direction::NoDirection;
    let north = Direction::North(Option::None);
    let northWithPrecission = Direction::North(Option::Some(2));
    let diagonal = Direction::DiagonalNorthEast(
        DiagonalNorthEast::NorthEst(10)
    );
    
    north.get_current_position();
    northWithPrecission.get_current_position();
    noDirection.get_current_position();
    diagonal.get_current_position();
}