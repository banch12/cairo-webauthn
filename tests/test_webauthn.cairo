%lang starknet
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.alloc import alloc

from src.ec import EcPoint
from src.bigint import BigInt3

from src.webauthn import Webauthn

@external
func test_verify{syscall_ptr : felt*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*}():
    let public_key_pt = EcPoint(
        BigInt3(52743338060272243486442687, 8356564404182767302564342, 18898795645626225295972184),
        BigInt3(8561359831707316770154247, 74234461271779437484232373, 11454876819198723055787928),
    )
    let r = BigInt3(59829153764609223375002003, 13920919192349440464502713, 2777691488451091769567248)
    let s = BigInt3(60763034848352918061918403, 34664502757747413800664556, 11406538044313554183849549)

    let challenge_len = 10
    let (challenge) = alloc()

    let client_data_json_len = 47
    let (client_data_json) = alloc()
    assert client_data_json[0] = 2065855609
    assert client_data_json[1] = 1885676090
    assert client_data_json[2] = 578250082
    assert client_data_json[3] = 1635087464
    assert client_data_json[4] = 1848534885
    assert client_data_json[5] = 1948396578
    assert client_data_json[6] = 1667785068
    assert client_data_json[7] = 1818586727
    assert client_data_json[8] = 1696741922
    assert client_data_json[9] = 813183028
    assert client_data_json[10] = 879047521
    assert client_data_json[11] = 1684224052
    assert client_data_json[12] = 895825200
    assert client_data_json[13] = 828518449
    assert client_data_json[14] = 1664497968
    assert client_data_json[15] = 878994482
    assert client_data_json[16] = 1647338340
    assert client_data_json[17] = 811872312
    assert client_data_json[18] = 878862896
    assert client_data_json[19] = 825373744
    assert client_data_json[20] = 959854180
    assert client_data_json[21] = 859398963
    assert client_data_json[22] = 825636148
    assert client_data_json[23] = 942761062
    assert client_data_json[24] = 1667327286
    assert client_data_json[25] = 896999980
    assert client_data_json[26] = 577729129
    assert client_data_json[27] = 1734962722
    assert client_data_json[28] = 975333492
    assert client_data_json[29] = 1953526586
    assert client_data_json[30] = 791634799
    assert client_data_json[31] = 1853125231
    assert client_data_json[32] = 1819043186
    assert client_data_json[33] = 761606451
    assert client_data_json[34] = 1886665079
    assert client_data_json[35] = 2004233840
    assert client_data_json[36] = 1919252073
    assert client_data_json[37] = 1702309475
    assert client_data_json[38] = 1634890866
    assert client_data_json[39] = 1768187749
    assert client_data_json[40] = 778528546
    assert client_data_json[41] = 740451186
    assert client_data_json[42] = 1869837135
    assert client_data_json[43] = 1919510377
    assert client_data_json[44] = 1847736934
    assert client_data_json[45] = 1634497381
    assert client_data_json[46] = 2097152000

    let authenticator_data_len = 10
    let (authenticator_data) = alloc()
    assert authenticator_data[0] = 547978947
    assert authenticator_data[1] = 4176460842
    assert authenticator_data[2] = 3389847498
    assert authenticator_data[3] = 3141667658
    assert authenticator_data[4] = 164671177
    assert authenticator_data[5] = 2421450441
    assert authenticator_data[6] = 2918684036
    assert authenticator_data[7] = 4202036947
    assert authenticator_data[8] = 83886080
    assert authenticator_data[9] = 0

    Webauthn.verify(public_key_pt, r, s, 
        challenge_len, challenge,
        client_data_json_len, client_data_json,
        authenticator_data_len, authenticator_data
    )

    return ()
end