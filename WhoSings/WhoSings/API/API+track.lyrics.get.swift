//
//  API+track.lyrics.get.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 07/02/2021.
//

import Foundation

extension API {
    public struct TrackLyricsGet: APIType {
        public typealias Response = Model.Container<Model.Body.LyricsContainer>
        let trackID: Int
        
        init(_ trackID: Int) {
            self.trackID = trackID
        }
        
        
        var path: Path { "track.lyrics.get" }

        var queryItems: Query? {
            return [
                URLQueryItem(name: "track_id", value: "\(self.trackID)"),
                URLQueryItem(name: "apikey", value: self.apikey)

            ]
        }
        
        var dummyResponse: String = "{\"message\":{\"header\":{\"status_code\":200,\"execute_time\":0.0090749263763428},\"body\":{\"lyrics\":{\"lyrics_id\":24514670,\"explicit\":0,\"lyrics_body\":\"Now and then I think of when we were together\\nLike when you said you felt so happy you could die\\nI told myself that you were right for me\\nBut felt so lonely in your company\\nBut that was love and it's an ache I still remember\\n\\nYou can get addicted to a certain kind of sadness\\nLike resignation to the end, always the end\\nSo when we found that we could not make sense\\nWell, you said that we would still be friends\\nBut I'll admit that I was glad it was over\\n\\nBut you didn't have to cut me off\\nMake out like it never happened and that we were nothin'\\nAnd I don't even need your love\\nBut you treat me like a stranger and that feels so rough\\n\\n...\\n\\n******* This Lyrics is NOT for Commercial use *******\\n(1409621032883)\",\"script_tracking_url\":\"https:\\/\\/tracking.musixmatch.com\\/t1.0\\/m_js\\/e_1\\/sn_0\\/l_24514670\\/su_0\\/rs_0\\/tr_3vUCAJhgqAcNM0UpJwwZTYzeDmwF023di5Xj2uOeDUKiHzprUFax-aYVO9vjMDl9bHifBi6VDZdoFB2xZ0K052ErPuAmlZX21x-He7FRBcE9aNvbn3qM3zFsF7RkzOxKWKqVi67pJ43uKH_F69eSfM-TMwn1P5MMzZNFFnMMjuEfgyuBxh3RK0yfFH9hnTrG1dGp4oivsogjWdbwomyYD2lLzMo4bhjPAcehwmlfqBTPRnq_1NwtAqZKFcSYj-RuPaMUM9fBV1k_5oAix2zwGfuK70qLYTdqUIiWvXntwoCgVLyniMdq0QGsI3khbYyyFhvo2in8mcPeUQ6O5WWCTDYABCjNUWi9o919KgAWVqJYQQYjEOpAYARVF3vAxIPmalgslJb6Mw298Pt1E5mdpTsYESBELcGJlc7JekwUOj89JkduNBGhUOr-Y3RfCKFV3UabBTt1dyaZh_VASDQdirahQbKABctRTqQ\\/\",\"pixel_tracking_url\":\"https:\\/\\/tracking.musixmatch.com\\/t1.0\\/m_img\\/e_1\\/sn_0\\/l_24514670\\/su_0\\/rs_0\\/tr_3vUCAINu4znOQ3aXeIY7waNQ23Wynjb5Ut_rXoolelJqSI2onsANv3w86jmP9IVPSvBcN3N82qNNW58nlCN-dtaORPwX4UKu82jvnNBh6wMXeQx1tTOM5XR_3sFdbhhGFONAWdn25peTsXU7etjdiypqMRu_wj_1Hudor3ppCGHjTitKCFhusl12AXn4amAzMTz7X8-Uy--rkw_kbsUXkNFlQv46_ksaNyK-CHn4Udpr2ds2Vd1YX_Zo-X5XuT63uv2UtE7SYGJoadVPcv8VBYSjXMt1dASmQykfbSnIm-y-PLmpcambg6wQJMR7IGcmXZYBPUKQrIxFIKVtgwhHU7-VpHEHcEg8cg_wf2nynHEHJtMuVR527TXe_OQnxLc5-uOg4zKYtLz35ZMrpFTWlpkVWyrOI-rw7qLJAQcfQZQTX3gXeNwt08kVcBnu-fnlbbKrvz1f7dVxfNT35GrBqGyqpOMWPOS04z4\\/\",\"lyrics_copyright\":\"Lyrics powered by www.musixmatch.com. This Lyrics is NOT for Commercial use and only 30% of the lyrics are returned.\",\"updated_time\":\"2021-02-06T13:34:50Z\"}}}}"
    }
}
