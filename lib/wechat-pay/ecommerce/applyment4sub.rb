# frozen_string_literal: true

module WechatPay
  module Ecommerce

    # 二级商户进件
    #
    # Document: https://pay.weixin.qq.com/wiki/doc/apiv3/wxpay/tool/applyment/chapter3_1.shtml
    #
    # Example:
    #
    # ``` ruby
    # params = {
#   "business_code": "1900013511_10000",
#   "contact_info": {
#     "contact_name": "pVd1HJ6zy0NVa8MRtelw/wDa4SzfeespQO/0kjiwfqdfg==",
#     "contact_id_number": "pVd1HJ6zyvPedzGaV+X3qtmrq9bbm2qhZ9evAM+Jv1z0NVa8MRtelw/wDa4SzfeespQO/0kjiwfqdfg==",
#     "openid": "pVd1HJ6z9evAM+Jv1z0NVa8MRtelw/wDa4SzfeespQO/0kjiwfqdfg==",
#     "mobile_phone": "pVd1HJ6z+tI0m2qhZ9evAM+Jv1z0NVa8MRtelw/wDa4SzfeespQO/0kjiwfqdfg==",
#     "contact_email": "pVd1HJ6zyvPedz8MRtelw/wDa4SzfeespQO/0kjiwfqdfg=="
#   },
#   "subject_info": {
#     "subject_type": "SUBJECT_TYPE_MICRO",
#     "micro_biz_info": {
#       "micro_biz_type": "MICRO_TYPE_STORE",
#       "micro_store_info": {
#         "micro_name": "大郎烧饼",
#         "micro_address_code": "440305",
#         "micro_address": "南山区xx大厦x层xxxx室",
#         "store_entrance_pic": "0P3ng6KTIW4-Q_l2FjKLZuhHFwczhJehHhAZN6BKXQPcs-VvdSo",
#         "micro_indoor_copy": "0P3ng6KTIW4-Q_l2FjKLZuhHjBWoMwczhJehHhAZN6BKXQPcs-VvdSo",
#         "store_longitude": "113.941355",
#         "store_latitude": "22.546245",
#         "address_certification": "0P3ng6KTIW4-Q_l2FjKLZuhHjBWoMAzhJehHhAZN6BKXQPcs-VvdSo"
#       },
#       "micro_mobile_info": {
#         "micro_mobile_name": "早餐车",
#         "micro_mobile_city": "440305",
#         "micro_mobile_address": "无",
#         "micro_mobile_pics": [
#           "0P3ng6KTIW4-Q_l2FjKLZuhHjBWoMAO_XXqK5dE5YdOmFJBZR9FwczhJehHhAZN6BKXQPcs-VvdSo"
#         ]
#       },
#       "micro_online_info": {
#         "micro_online_store": "李三服装店",
#         "micro_ec_name": "XX购物平台",
#         "micro_qrcode": "https://www.qq.com",
#         "micro_link": "https://www.qq.com"
#       }
#     },
#     "identity_info": {
#       "id_doc_type": "IDENTIFICATION_TYPE_IDCARD",
#       "id_card_info": {
#         "id_card_copy": "jTpGmxUX3FBWqRTvDujqhThn4ReFxikqJ5YW6zFQ",
#         "id_card_national": "47ZC6GC-vnrbEny__Ie_An5-tCpkqg05InE4d2I6_H7I4",
#         "id_card_name": "pVd1HJ6zyvPedzGaV+X3qtmrq9Da4SzfeespQO/0kjiwfqdfg==",
#         "id_card_number": "AOZdYGISxo0eow96uY1Pk7Rq79Jtt7+I8juwEc4P4TG5xzchG/5IL9DBd+Z0zZXkw==",
#         "card_period_begin": "2026-06-06",
#         "card_period_end": "2026-06-06"
#       }
#     }
#   },
#   "business_info": {
#     "merchant_shortname": "张三餐饮店",
#     "service_phone": "0758XXXXX"
#   },
#   "settlement_info": {
#     "settlement_id": "719",
#     "qualification_type": "餐饮",
#     "qualifications": [
#       "string"
#     ],
#     "activities_id": "716",
#     "activities_rate": "0.6",
#     "activities_additions": [
#       "string"
#     ]
#   },
#   "bank_account_info": {
#     "bank_account_type": "BANK_ACCOUNT_TYPE_PERSONAL",
#     "account_name": "AOZdYGISxo4ytt7+I8juwEc4P4TG5xzchG/5IL9DBd+Z0zZXkw==",
#     "account_bank": "工商银行",
#     "bank_address_code": "110000",
#     "bank_branch_id": "402713354941",
#     "bank_name": "施秉县农村信用合作联社城关信用社",
#     "account_number": "d+xT+MQCvrLHUVDWv/8MR/dBXTd75kPkyjqnoMRrEEaYQE8ZRGYoeorwC+w=="
#   },
#   "addition_info": {
#     "legal_person_commitment": "47ZC6GC-vnrbEny__Ie_An5-tCpqg05InE4d2I6_H7I4",
#     "legal_person_video": "47ZC6GC-vnrbEny__Ie_An5-tCpqxucuxi-vByf3Gjm7KE53JXvGy9tI6_H7I4",
#     "business_addition_pics": [
#       "string"
#     ],
#     "business_addition_msg": "特殊情况，说明原因"
#   }
# }
    # ```
    #
    # ``` ruby
    # WechatPay::Ecommerce.micro_applyment(params)
    # ```
    #

    def self.micro_applyment(payload)
      url = '/v3/applyment4sub/applyment/'
      method = 'POST'

      payload_json = payload.to_json

      make_request(
        method: method,
        path: url,
        for_sign: payload_json,
        payload: payload_json,
        extra_headers: {
          'Wechatpay-Serial' => WechatPay.platform_serial_no
        }
      )
    end

    QUERY_MICRO_APPLYMENT_FIELDS = %i[applyment_id business_code].freeze # :nodoc:

    #
    # 通过商户的申请单或微信的申请单号查询
    #
    # Document: https://pay.weixin.qq.com/wiki/doc/apiv3/wxpay/tool/applyment/chapter3_2.shtml
    #
    # Example:
    #
    # ``` ruby
    # WechatPay::Ecommerce.query_micro_applyment(business_code: 'APPLYMENT_00000000005') # by business_code
    # WechatPay::Ecommerce.query_micro_applyment(applyment_id: '200040444455566667') # by_applyment_id
    # ```
    #
    def self.query_micro_applyment(params)
      if params[:business_code]
        business_code = params.delete(:business_code)
        url = "/v3/applyment4sub/applyment/business_code/#{business_code}"
      else
        applyment_id = params.delete(:applyment_id)
        url = "/v3/applyment4sub/applyment/applyment_id/#{applyment_id}"
      end
      method = 'GET'

      make_request(
        method: method,
        path: url,
        extra_headers: {
          'Content-Type' => 'application/x-www-form-urlencoded'
        }
      )
    end
    
  end
end