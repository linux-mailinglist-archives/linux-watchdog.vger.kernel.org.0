Return-Path: <linux-watchdog+bounces-3669-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D1ADFD34
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Jun 2025 07:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7ECF176DED
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Jun 2025 05:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F54B242D8A;
	Thu, 19 Jun 2025 05:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npWxBd4M"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849E6242907
	for <linux-watchdog@vger.kernel.org>; Thu, 19 Jun 2025 05:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312107; cv=none; b=oEsQ6IeDrI1e9MCuewbO+3Hl6AR5Pv/p8FR/neM+ouoL5rwOCibWzJPqMYfoulNA8ETeH4/PhKTN98frnjR60bj0WnSecU2EUHTsfx9ymOb2x74fTimyLcHSOzEC7mACEsHn3boH6XDaA/yS5nNlBJCi3Zo7BQpZOc8EfJOFN/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312107; c=relaxed/simple;
	bh=s3/gZi7BvAKq0izTDcQE28ZeRUR7J1PrwtDNYqPUSgA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RmYruVOG1cBpvm90TVU4sfw3PZlNd6e7Cg/VwhwAWnuK2xytTiU/HdJFUb3Qbrev5s6U91b3IdIrlCHFqIdfwpitd2QDPDz/kitIZkE6TqLDMTMY6La8vPfSghKmn5LRWIaPJHPTG6l2kUHfNFYr3gPNvRKCmKMmTJMJj6wfCMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npWxBd4M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ILaSer024068
	for <linux-watchdog@vger.kernel.org>; Thu, 19 Jun 2025 05:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	++vri0wmuq+S4bVhSg02YGKQx2ZXW1B1U4mXepw29zU=; b=npWxBd4MayFb4nAN
	/pTreu4gx5S0HwfUjofGFdRcg7PWZ/IdNwJy/t6r1VKU8ZJPKUrJt8WIcg5gbOxE
	2KNkun+XRJ7Km/7GNvHyF5z8IrQC8sJgY6wP5W6nDB32RiHHO/MdcqWKhyUG1jDB
	OJbv7f8oFZYMpxBte8aESWlPzx0D7fRdZwDfhj/zFMOAo+llYuGjtv8iu/3T68Ac
	sNZjZfevBJyNgV0tGuxkC2BOppFQU4H6sozS3M87b8ivK9jX26kPT0km5z26PAgi
	65725JXp3LyS4E16qHsWSpIjC5lfnNDzCG1N2okQPSXgm2z3COimE/2cf9wx2iEQ
	xiaIKg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13ap2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 19 Jun 2025 05:48:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742c03c0272so525913b3a.1
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Jun 2025 22:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312104; x=1750916904;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++vri0wmuq+S4bVhSg02YGKQx2ZXW1B1U4mXepw29zU=;
        b=vjcsfk0qRl0XST+2wmuHQjxX4B2LKuLcXUjWDcrLNGpeDuOBFFV315n3QH5daPBe4A
         GmKSuBUbUnWx8EFrr3N+bgcEJX5v0zgwUFT7QlRGYySelVNfu9FS85UFpbIH5E3EcZMu
         vsZSnGgpAtlqVxxuX7bti810zwcLwI0F2BQ+9TXW6+BvQGVaKNHmkm6xekPX+Hj80i2+
         yyDFFWSWLVL2FWbzu7gqyq448y8wHRCCWH/H78XRr68JmIXQWW+ru/DwEkLpJkWnNtC5
         Comltd+Bfy+qbAOolsvMXHuWmDDH7h+7vACRLAiGGd5Z/I4qH2+/JsCyGBIBD7/JtlAn
         SCeg==
X-Forwarded-Encrypted: i=1; AJvYcCVKmlXtEtwDZCnWpDeXkqHg7+uts91qHCvEpndPyghdqBFszswLBiqO27z8P+mN1G8r4kcJ3VRRdLTSaQ0Rnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXbKVB1QheYTSlL0B1XVvZ2W4jwy6CK4YIujIpUsfKCWgJwllb
	t36n8UtwhNzR244kGKPIifpL67UZB/JBQhaVfy6B44g/7mCyYkbV+H9TWDfzzX9rmpM03MbvdCz
	N4/GtDI+NKGLRZUd/klOdsHPqFXV5RMAGPG0GF4J+sNxYcEdf9L2Unljfg1YPSfo3ZZZIPA==
X-Gm-Gg: ASbGncsvA8kCuD251b9X/Cs8iC7X8Dha+SLCOWHUNnjzQf391GZ5zDfkjwy6+1BlRTj
	yYOIJQqdzlnpDpcfyekHdB8VYRiBaXsTWlmU/8Q84aTpJXLYI1Uf6wVYKjDANdG0fcnuGOluEHj
	g61cpl0L9Y/UcdfpBJHdq5UWxyEFt3wD8ZRLJNxMPtDjPW5TWqo+wzMUcDcJ1TYMR+e/PtxDEPK
	KEjEwyTiXENPuoz7ZyGokRWdGdiBM50Lm5XgsYbGkbnnQBy+YgjUUQLA/0wfN2WgTo5uzrMVMYW
	/NGaUU+cdKwDKaSsULg586wnpeYJxiE8z5v+X2AILiEbkGRvfX8B32OWfa7cI+4=
X-Received: by 2002:a05:6a00:10cf:b0:748:e585:3c42 with SMTP id d2e1a72fcca58-748e5853f7amr7330816b3a.15.1750312103690;
        Wed, 18 Jun 2025 22:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtxbSYLcz+kWJraK0awdmVZZ0F++vhAr9IPxIQoqQJlXVvdgdCjVBs460bnIYuvcegcI88ww==
X-Received: by 2002:a05:6a00:10cf:b0:748:e585:3c42 with SMTP id d2e1a72fcca58-748e5853f7amr7330796b3a.15.1750312103305;
        Wed, 18 Jun 2025 22:48:23 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccfcsm12279470b3a.4.2025.06.18.22.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 22:48:22 -0700 (PDT)
Message-ID: <073480a2-0b6f-4dc0-b7eb-eec500b3106e@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 11:18:17 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
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
In-Reply-To: <a8b33510-c010-452f-9177-ce743b732d21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6853a4a8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NzB-Z5k-UKuyH_SqCfoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Cp3LQQVrVleqyI8VnYsHf1jMHSa4pLiR
X-Proofpoint-GUID: Cp3LQQVrVleqyI8VnYsHf1jMHSa4pLiR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0NyBTYWx0ZWRfX0tNYEIhnRJWK
 sqUIr5xCRPq1nS+4inexooOUt7lifXm1XKNiQxo5+QszxL7cQQrntNBPi/0MkVh9oohxsSU4Onq
 hf7cMdxnvZZoc84k6/1OqtmwOf2WhYjUFlgQ79TkyRcAuGawsWF7p2n2Q7tdSLxuwLuq1hm3c/4
 aWbwE6NQThIUBYv0g80T5lmdyVLbKT5yzGShazREtPFBo8fm7uyz0h483CstqAQJPL4VeQYKnIR
 A9XbcCgeRLye+3NHm9emSPsUoghVRKAQV6KxoZJmD1gIjxnEUtUn/jcy9zj/nhaDwtMnxzphDdn
 B3Qkmnk86C9aG0niSduF0GUzJ82tMm5ONXQr32J0oAXg/FhwdOGAsOHUPC/f1XyTo4ROLnITeKY
 xt3mIOQ0ioD6HJ87YXHX06NTgLWg9nArvltLd8uBvgzNp3kRLEBzalsAWgATNB/iNNMmANu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190047


On 6/16/2025 10:48 AM, Kathiravan Thirumoorthy wrote:
> Thanks Rob for the review comments!
>
> On 6/10/2025 11:33 PM, Rob Herring wrote:
>> On Tue, Jun 10, 2025 at 07:15:19PM +0530, Kathiravan Thirumoorthy wrote:
>>> Document the "sram" property for the watchdog device on Qualcomm
>>> IPQ platforms. Use this property to extract the restart reason from
>>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>>> entry with this information, when the system reboots due to a watchdog
>>> timeout.
>>>
>>> Describe this property for the IPQ5424 watchdog device and extend 
>>> support
>>> to other targets subsequently.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy 
>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>>> Changes in v5:
>>>     - Rename the property 'qcom,imem' to 'sram'
>>> Changes in v4:
>>>     - New patch
>>> ---
>>>   .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 
>>> ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml 
>>> b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>> index 
>>> 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 
>>> 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>> @@ -81,6 +81,16 @@ properties:
>>>       minItems: 1
>>>       maxItems: 5
>>>   +  sram:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    description:
>>> +      phandle to the IMEM syscon node that exposes the system 
>>> restart reason
>>> +    items:
>>> +      - items:
>>> +          - description: phandle of IMEM syscon
>>> +          - description: offset of restart reason region
>>> +          - description: value indicate that the watchdog timeout 
>>> has occurred
>> A 'sram' property points to an SRAM region (see mmio-sram binding), not
>> a syscon and offset.
>>
>> The 'value' should be a separate property or implied by the compatible.
>
> Sorry for the delay. It was a long weekend here!
>
> Let me start with the requirement (Please feel free to skip it). When 
> the system goes for reboot, Xtensible Boot loader (XBL) find the cause 
> and update the particular offset (in this case it is 0x7b0) in the 
> IMEM region with the known values. On the next boot, if the system is 
> rebooted due to  watchdog timeout, watchdog's bootstatus is updated 
> accordingly, which this series tries to address it.
>
> Based on the previous review comments / discussions [1], it is decided 
> to go with the above approach, i.e., name the property to 'sram' and 
> let it points to the syscon region (IMEM) along with the offset to 
> read and what value to expect. So that we don't have to touch the 
> driver if either of the offset or the value changes across the platforms.
>
> Currently, IMEM region (which is a on-chip SRAM) in the most of the 
> QCOM platforms are modeled as 'syscon' [2]. So I have followed the 
> same approach here as well. Should I describe the IMEM region as 
> "sram" (mmio-sram)  instead of the "syscon" (existing approach) and 
> retrieve the offset and desired value from the compatible? or stick 
> with existing approach and name the property to something else? Could 
> you guide me here to proceed further?
>
> [1] 
> https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com/#t
>
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/sram/qcom,imem.yaml

Konrad,

The bootloader team confirmed that the IMEM offset and restart reason 
value are fixed for the SoC's lifetime. Based on Rob’s suggestion, let’s 
pull these values from the device data using the compatible string. Let 
me know your thoughts.

Kathiravan T.

>
>
> Thanks,
>
> Kathiravan T.
>
>>
>> Rob

