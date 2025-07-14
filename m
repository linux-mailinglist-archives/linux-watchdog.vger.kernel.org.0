Return-Path: <linux-watchdog+bounces-3863-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B51B0422B
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 16:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BACBB4A1E78
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 14:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C5B7262A;
	Mon, 14 Jul 2025 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tnpj5prc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395C717A319
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504679; cv=none; b=Z4WT56REOL7ORMfaKGp9s31i0Ony7LE+BtcCOJ23Y6+ooXwxqIX/WJhL1HizWOcvRJfu2pC1870oei51Wwhv0BDIQez2bnY0TG0O72XMfa34gRGGVblQ8mNvKFHGZUiQGH45e5WkKXZ+Fm2dsW9hgTz0A6wgbMsM6tOm7fPMGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504679; c=relaxed/simple;
	bh=34c3k2JS0Ft1btNphYjTKqe1IWB+QrtfS49zngYMtao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clrjN+nm+RGmI7GVL239zXXk8gfAoichy4EX3goRyX1k4iqVuPj9glC8hb3KYogfELwQ2Ko8Pfm9pxfq2N7y3ZdKjIKmubZSlyBwpBDWr4nIjWs0G6QakHM5PdJ4DeIGNbA9S1byNiD3Q0jKsQ6GqkmiWHtLELnd9BC6Ce8JzLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tnpj5prc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA3pVw015241
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 14:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j9W4CuSLttgvJ6FyeozWzpAz4Cuh64rTL2lKSOstBnM=; b=Tnpj5prcJdQb1sjj
	DaqdXinNI+fa/pI24OGOYmul1c0U91R2/kJjbtdbblS4sUrouilbyd/2dEIhzF6u
	SPH784E5X9M5Eu672ZZfeDzjvGq3fOEcBN5S/+OOHhDFUB7yv3SgXEbFp834ndz1
	9P1zz4hT0jNXzreyesyzdBrVga4OjXHlGW52PZjs7iCuBHSMSI4JgYvRIsnrR5zE
	pEiHj8xERc/3fFLgNc2Qib1eGiwxCktRURQgYf6fWeArSxwd2Uz0Bmjl60ZYgEhe
	SyLN9CGqSMqRgYrLzGbLDtMPcE+I1szYfwMQvzoGJpHoBPBTx5K3NjGOuWw8RO9T
	6uP8pQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu84wup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 14:51:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dff19eab5fso78413485a.3
        for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 07:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504675; x=1753109475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9W4CuSLttgvJ6FyeozWzpAz4Cuh64rTL2lKSOstBnM=;
        b=KWW/gyIJqPZnV1MUoKRyG0qFjgHuBOmLM5x1gY81XbzOqe+fQQsI3PQqnz0WEn234L
         i2JNAUqBQcIt7hFbvSi5kByfPlXOI1s4gLIZvlHxmmI6/WpSnWqffCGFv3VYt/J+HsBU
         foJoAsJ+cVRC7FcHbwmr07eSwO6sjZSt9MrwssuN96A/qPKwL7fmRSiznkjEkdS5FD3l
         sZdXcw1/AAwFL7k2JP5nx2oZJ4LrEMILrVI7RWhLMAdL+o6j+/BQ3d47zYWi0Xdkz0UG
         UjlTSlL8f8hXfE6fhEr/zjf7ScvoTgdadvrTsd6xeh6Fsd0AfUIWbK2eANDYjjiGHouC
         0+yw==
X-Forwarded-Encrypted: i=1; AJvYcCXraoplgRfS8CDTWAJLlfjkYTJvBK1dcpPUck0zuToOM9waCadcAHGSD3y0eIA6ISgUYRYxhtUZiPPvgWvtsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY7FIENr+EYnavHcmPvUarhs7vwfCeyFC+UpVZVIrlhQv1lsBA
	S2MvPpEsLyRzuLJb5QwmEBFw2anKomwNGEb6ZAI0cYHu5mqemlLYkKO+ox1DQXGK0WYPk5dio/u
	ilgamGsQGZVzArNafnxc42pvZM4zFqCWsCBAbNLnFD6TezX7O1eWlbIkJOs0jeSfCtf/GPQ==
X-Gm-Gg: ASbGncuzWzfDF/rIaqvOQYmkvlGFrHOUuXq4laAoWO/29Shdb6cNac/nAKFFiXESQUi
	eeMhmQBt/5iUdgrBs9Kaw/6MKp4coKtJDo1naQ9OyC91W7RSka1tniRF12gfKWg9Uk5OWxI7AKJ
	PfPujFDsjtUtTWdNWLeu26nZ2H2qskT1xI7Dkw5v+fu+Gmg5MojHs91C8y/ZW0uu9d/K5eAkBXL
	ByyljEELt09MHn8fE7YEvE95CcvryuAa0WVjb1b2JOARi6uDDdwGyAJyOQBwqLZT84ZsOnD4VXZ
	klpco5F31gHDmMkWBLVAiivdwq3nFL2MVIpVgoUeIQl7Sb+cAnY3qb6UtpWLMWpudizwxkKEufn
	766bNvcgShHQYqLylTRku
X-Received: by 2002:a05:620a:44d0:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e2ee893ba1mr225930085a.5.1752504674798;
        Mon, 14 Jul 2025 07:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE74z/KAqLPegwZP0R34v4pwdMd2EKA/Hi8iI61zdmqy3z3diiIL2Ji8kmWMZfmjJZIoWEzUg==
X-Received: by 2002:a05:620a:44d0:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e2ee893ba1mr225927485a.5.1752504674098;
        Mon, 14 Jul 2025 07:51:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9542fe5sm6049190a12.35.2025.07.14.07.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:51:12 -0700 (PDT)
Message-ID: <39acdb37-e6f0-45e3-b54e-bd8a5905b2ec@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 16:51:10 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
 <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
 <20250610180345.GA2382213-robh@kernel.org>
 <a8b33510-c010-452f-9177-ce743b732d21@oss.qualcomm.com>
 <073480a2-0b6f-4dc0-b7eb-eec500b3106e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <073480a2-0b6f-4dc0-b7eb-eec500b3106e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4NyBTYWx0ZWRfX5RvoJXnsBcBQ
 b7HA3QqsFWFqdhUmpRzZoRqwwDTJ+hcsvKsrtyMPScKVOCybzXmQ+33mbz0gWKoRUndsLhlecu4
 4u8UzzxNqzq7UCwn6a1Dbz2XKF3SJ7WPnMekq1tjMb/ry5PBamolQdlRt2HH9BjWt9GsouSsJJy
 Oz6WX/UwdMRx/eEZs1LAncfCn51541EpMs1M3pCTTdJTo3xYIXn1CrtiuS7neIi+Atz9CZgvW7+
 GvhnK0ed9qpmGCgbiIPofPDmUawwyq7kLzVM1mmME4QC3/3bibBeWMt6//qZNdOjozS1Riso9xK
 D3ARWOjRh9sIuA5hWtAT5vcWdrrk7/Zo/U07ojof/r9hj3wO/27+2UFrVwIJ0LP98HE0kzECbg7
 1JIuQlS5dMPk0J6U/rarrweNqiG0JCuN52J6EE9UKcNfF6PzujgKMpgqXq5KlPjqIqGcDG8L
X-Proofpoint-ORIG-GUID: lr1zB7P0OnFlhXMs0YNhpudBZhQdLhhY
X-Proofpoint-GUID: lr1zB7P0OnFlhXMs0YNhpudBZhQdLhhY
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68751963 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9B6XoSWOLoSC-pKoQf8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140087

On 6/19/25 7:48 AM, Kathiravan Thirumoorthy wrote:
> 
> On 6/16/2025 10:48 AM, Kathiravan Thirumoorthy wrote:
>> Thanks Rob for the review comments!
>>
>> On 6/10/2025 11:33 PM, Rob Herring wrote:
>>> On Tue, Jun 10, 2025 at 07:15:19PM +0530, Kathiravan Thirumoorthy wrote:
>>>> Document the "sram" property for the watchdog device on Qualcomm
>>>> IPQ platforms. Use this property to extract the restart reason from
>>>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>>>> entry with this information, when the system reboots due to a watchdog
>>>> timeout.
>>>>
>>>> Describe this property for the IPQ5424 watchdog device and extend support
>>>> to other targets subsequently.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>> Changes in v5:
>>>>     - Rename the property 'qcom,imem' to 'sram'
>>>> Changes in v4:
>>>>     - New patch
>>>> ---
>>>>   .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>>>   1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 100644
>>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>> @@ -81,6 +81,16 @@ properties:
>>>>       minItems: 1
>>>>       maxItems: 5
>>>>   +  sram:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    description:
>>>> +      phandle to the IMEM syscon node that exposes the system restart reason
>>>> +    items:
>>>> +      - items:
>>>> +          - description: phandle of IMEM syscon
>>>> +          - description: offset of restart reason region
>>>> +          - description: value indicate that the watchdog timeout has occurred
>>> A 'sram' property points to an SRAM region (see mmio-sram binding), not
>>> a syscon and offset.
>>>
>>> The 'value' should be a separate property or implied by the compatible.
>>
>> Sorry for the delay. It was a long weekend here!
>>
>> Let me start with the requirement (Please feel free to skip it). When the system goes for reboot, Xtensible Boot loader (XBL) find the cause and update the particular offset (in this case it is 0x7b0) in the IMEM region with the known values. On the next boot, if the system is rebooted due to  watchdog timeout, watchdog's bootstatus is updated accordingly, which this series tries to address it.
>>
>> Based on the previous review comments / discussions [1], it is decided to go with the above approach, i.e., name the property to 'sram' and let it points to the syscon region (IMEM) along with the offset to read and what value to expect. So that we don't have to touch the driver if either of the offset or the value changes across the platforms.
>>
>> Currently, IMEM region (which is a on-chip SRAM) in the most of the QCOM platforms are modeled as 'syscon' [2]. So I have followed the same approach here as well. Should I describe the IMEM region as "sram" (mmio-sram)  instead of the "syscon" (existing approach) and retrieve the offset and desired value from the compatible? or stick with existing approach and name the property to something else? Could you guide me here to proceed further?
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com/#t
>>
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> 
> Konrad,
> 
> The bootloader team confirmed that the IMEM offset and restart reason value are fixed for the SoC's lifetime. Based on Rob’s suggestion, let’s pull these values from the device data using the compatible string. Let me know your thoughts.
> 
> Kathiravan T.

So I'm not sure whether I proposed this before, but this is how I solved a
parallel problem for IPA, also consuming a slice of IMEM:

https://lore.kernel.org/all/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com/

Konrad 

