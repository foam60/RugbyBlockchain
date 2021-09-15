pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenRugby is ERC721 {

    struct Card {
        string position;
        string nom;
        string prenom;
        string club;
        uint8 force;
        uint8 endurance;
        uint8 vitesse
        string rarete;
        uint8 niveau;
        
    }
    
    uint256 nextId = 0;
    
    mapping (uint => Card) private _cardDetails;
    
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        
    }
    
    function mint(string _position, string _nom, string _prenom, string _club, uint8 _force, uint8 _endurance, uint8 _vitesse, string _rarete, uint8 _niveau) public OnlyOwner {
        
        //create new card
        _cardDetails[nextId] = Card(_position, _nom, _prenom, _club, _force, _endurance, _vitesse, _rarete, _niveau);
        
        //call safemint function
        _safeMint(msg.sender, nextId);
        
        //Increment ID +1
        nextId++;
        
    }
    
    
}
