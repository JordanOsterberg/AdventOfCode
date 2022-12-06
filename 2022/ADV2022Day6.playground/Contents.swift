import Foundation

//for line in Problem.load(fileName: "input") {
//  print(line)
//}

let test = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
let real = "hrbbjllllspssblslvvrdrbbpbbmcccfppvbbwvbbmrmjrjrfrgfgbffgfqfqlltlwttscsncscchssrppffvwwvvpnnwwwpvwvhhnvhhbttvzzdlzdlzzwmmjhhznnjdnnnqddbtdbdbsdsmdsdrrdpdwpdppgcgqgcctftsfszslljbljbjwbwbnwnqqrnnztntmtrmmzwzdwzwgwwwjhjsjgjtjjhpjhhppqzqdqffrvrtvvsmmgwmgwgbbclltctptzpzhpzptzppcfpcfftflfzftztddzgzmmfsmsrmmsstttvbvmbvvsmsqmqlldjdtthwtwbwggrzzjrzrcctffsshqshhpthhlnhlhqhdqqrwrmmcttpfttzfzgzdgdzzwrrtsrrsnrnccrbbsssbpbjjvzzwlwtwjwsjwjggzqgzzrsszzjnzjzwjzzcrzczncnqqztzfzhfhvvtjvjdvjjmrjrppvzppczpczcggshghvhnhhsrsnsdszzdpzpzlpzzhwwmnwmwmcwwfnwfwjjcbcncllcsllqdqzzhqhmqmbbjvjjwwcjjpnpllzfzddtmtccqrcrtrwrpphpmpplslmltthnnvhhvrvbblhhrrdqqmbqqgtqggdgcdcvvsbsswvvpggbbtftlflglzlmlbbfhhrshswhshffhhdnnrfrvrmrnrprrmfmpmnpnfnggvvcncdcrczrzccpmmssrbbdjdtdrdwrrwhrrvrtvvszvvwvzzmhhjhhwlhlqlvlttzftztdtstftrfrdddmtmzzsqzqvvpdpdcpcncnrrtntznzrzgznztnznhhsqqnrqrhhlzhzthhfddrzdrrqmqggcmmllnjjvwwjccfjfqfcfzccwvcwvcvjcjtjtnnqsqmqrmrzrszrszzfwfggnmmcdmdjmmhwwgfwfnwnlwwcffsrffvnvbvnvwnwgnwnmmbzbmbpplmplpspzpmzpzdzgzrzrtrjrbbppwvwgwmggqwgghqqshhcwcqwcqcfcbbnsnrrtztzrtrvtvhthzhmmrqqrwqqsjqjcctgtwthhqmmnffmgmdgdlgljjhwjwggrqqfrqqjvqvhqqgsqsgsttmrrbprbppmjppslpsllvlfvlvrvhvtqmrjcdzwsbzfmgmwmwqwhztqrsdzhqjqvbjbntnbndflthljcczdmmhszfgsplrtlqnfzbrlqngwdqtfwcmrdjrsmdpmjmqwrbwfjzwnvqhfmlqtvvnlfzbfccwslqpbzzjccbvrzhghqwtvqgwrmsfzqnmnqqjsjtpcmngpqgllfsnpqtjjbqcdppnsmtwrslnrbqtwvnbctzvwfmgctscmzjbqqgqdwbpzmrdwgfcjzftzgmfcjhchbnmnqnrgtqngwrmncjvptqqdtjtgtpzzdrfsdgmwlwrjnqldbwrqjrhwcczlzvlhpgrnwzhbwjnpthggczfgtrjnzvnlfdfbwcnzfbwlwlmgnnjnpvhbhqgnzhqsnmvbcftsmrcgpvnnnmgnrvpbzlpwnbwpzmwpgqvbfgjwfrjqnvvgmqwwcfddqmdznmfhpjcfgptqdqwmplrglbwlmsqzjshrlhflcjvptgrcfhjfgqmlfzrtphpbvcqzwpcnwljjdlmqzhcctqshdngrgtlfsrfccdtlvmqcdgnpcvphdsrpzfzwclvsqcpzqlfvvqzggdhpfzdvhshglvfzfmcllrdfjfsjtngjgddcpqnlmrnplwtlvwdvzftltnsnspcdztgqhlhvvbnwvnmhscfnqbngpvprzfrjcmfpfzfftrlnwgllhnjndpjdrwcgqpcgcqngnbfzlvzvhnqdjthflmwvppmbdssddmgsbgrqnpjzrjpzdddqgsdlmwnhhpjbthclvqhgrsnrbqgtnsjhncnzbhrdgftvbptrqssvsqfpqnddhmgwcrfqndqjsqgffmhdvqhjrdlmrlcqctqccprwlbqgqrwmtfhwmfjfqzdqbsdsjbtsvfvgbsrvqwnqqqqthpsqgcfslsqtnjwtsrcdcctggdghrjwpbfccrtwgszwbrsjswmjmjbcqrsgbcfsdjzsbjnnssnddnnvwgftlrqvphnqcgjszscrlhhjnljlqcjqtqfwbmdmrgdlcqqwmbsmsdhpplvlfglqwspbfptlbzqjwhqmfvzvsvpjclcdzsbvntmhdqdvhghcmmflpjbglsghbswdshtsbdrgpsrsclrmfwwqbrgdjsqztgttqpwhnfhszlgbfpzhczsnwqflmshlgbrpmdzgpqwtsbssgfjbtrwbmztlwwfmsdgpgfgdjfdccwlfgztbcbqjvjtvslmddjplrswwcszspgplsrhrnwnmrrfbcgdmntcrlvnfqtwwcczsglrhtrfqnmhvgzjpmlplqvqhmnfgvzqcmzhqszgslvndqtqhvrbvbmclbcbjdswvcjrzgfdmdwnnlzlzqcffsrqdfmmpzfnmdsnqlpcrhzsdnsflblcjsfsgcnsspftjrlmdjsmfpqtmlgfvnlfnjscsgwzwvpjrvvclhsbqldlnmtglhbjfwlzmvrbvgtprfjbjhhnlqnbrswwlqtcgrjrltdrnfrjhrntllptlsbhqrwvdsfrlghtfcndznzjwcgmtdvffltgrdmljlqhdtmdvnfsfsrvdpmhlrrsttvqlwfptddwbpfrbclwwzmfpttmrmmqzjnbbnnfvzwmmcfshvrlbdbjzprftbqvdsghnnzwbjccpthdsvsdlgvphsgjdqjwsgmzqnqpqvgqjvwgjtzpmqqwnlwrwhqqjjclcbhjgpwhqdclwmqfmwbwmwwvcbhfznfhcfbprfcdqlbcttnvgnjwswcmpbrghtzgdbppbprffzjgvddzpwmdctrhnrfzdfhtmnfrsfdqvzcnrtncflhvldcndwqtvbggmwlzhchlcwtcbqcvlfhdwljgddwpvcfczvfqmphgtdsnsqwdpvvmwnwqjbrjwbdhhgtffphsdrvspsbgmfrmwmhnrgqdfppzgfpgmqjcsnglczgwhjthfhztzrlpgzjhcfrjpjvtjptptbvflftjtcfhmbwlhlbhvnjnbfmwjrgbvvhmdlncdgncgfjcnnpdljfcjsmsfscqpwsgcmlhhqmldsnjfrrqpghwncmgwgnjsdtvbhrbbnmpqjrrctqqnqzztmbqmdsgdvmmlwmbvprllzgntnmttrlzrttmjjlrwpwmtfznmwnsjmjhjdnsppfhcrjpzhjqzdtdbsjshfzzvrwvjbjbgtsfpgggbdztczwlhpmthfjdgsbrvlwmlrvgdrpjzccwmgpcnqqzmqdjqmwsrzwsmtmdjdhmjrwfwnzlmfnqtcgtslwtlnwhvmqntmglhntnsjlnmzfvfdztcfwmpchsrsdmqvqcwljzrmmssjvbmvvnmqlbsdwnrbmqctdtmfzlgfzpmjcnftgftvjpfbwwmzfdrrwjwcfwfcfmzbbnppgjrmbcvmvnjpdrzmvndvddtvshlnjjwgtsvnwtwnhcbfpnthpjlrhgrqccdgppjvdqjwqrfrrgnvhfwvjhnwhntnpmghphrtgqhwtbrqhqljfdjbgnlgmqqgfcqpqfhcpgspdbvlbfjvlrgmtjztwdzlrhqwwtcpdvsqgssjbjjgqlwbcctzzqvvmdzpfrmspmqhtzwgcfsslpnhpjfwqrrfbwbndrvhnnsjnlvlvqdsgwzjsrprhgtvsfbhbcpljdczbtdwzcnhzntrwcrjctmhtjfdlthznzmqblppzcqgpjhlzjrmcvpptfjjzltdhmvwphwlccscwrwfcqpqwwrzcmnltzdcfvtjrcvsqwtchrmdfzjmzjfhppjzbhglwqggzqqnspfmzrfwrqdqdrsdbsdhcgdqrrnjlwrqhfhpzjhrvjndqphndnnnbwhrjvqrrbvlhhbljjcwmfpvnhcszfshlsnczgtcfhjslbhzczdqdmdnvqdzhbmbpcnbntwgllfscrcwhfrgtfvftmwhbgfhjzjrbvvwc"

func partOne(str: String) {
  var totalProcessed = -1
  var check: Set<Character> = .init()
  
  for (index, char) in str.enumerated() {
    totalProcessed += 1
    
    var startCount = check.count
    check.insert(char)
    
    if check.count == startCount {
      print("Removing at \(index) because of \(char)... \(totalProcessed)")
      check.removeAll()
    } else {
      if check.count == 4 {
        print("Found marker at index \(index), total processed: \(totalProcessed)...")
        break
      }
    }
  }
  
  print(totalProcessed)
}

func partTwo(str: String) {
  for index in 0..<str.count {
    if index + 14 >= str.count { break }
    
    let start = str.index(str.startIndex, offsetBy: index)
    let end = str.index(str.startIndex, offsetBy: index + 14)
    
    let text = str[start..<end]
    
    var chars: Set<Character> = .init()
    var fail = false
    for char in text {
      var count = chars.count
      chars.insert(char)
      if chars.count != count + 1 {
        fail = true
        break
      }
    }
    
    if fail { continue }
    print("PASS \(index), answer is \(index + 14)")
    break
  }
}

partTwo(str: real)
