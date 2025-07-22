Return-Path: <linux-watchdog+bounces-3894-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C30B0D0DC
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jul 2025 06:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 553666C236A
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jul 2025 04:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4300822EF4;
	Tue, 22 Jul 2025 04:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mMbh35bV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9682972617
	for <linux-watchdog@vger.kernel.org>; Tue, 22 Jul 2025 04:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753157775; cv=none; b=Zrxl5ULAigRV2+YsGECpSb35nnA7ni157Hp6x0v45toWDgwODrqjW6yp7EDAWcAQuc77xhvhOsbOhFp25janQlxGUB8Csnrjtgo5Q7QUyI+GJrj12MckA2TQBNFcE1McYwiQLrFJjJ5dMsaEoTFeUnE73bNq7U7lAztpBPL4ewo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753157775; c=relaxed/simple;
	bh=X5h8qLB+d9/7vD3lF6F1tc/YYELICqzIH0md6DIaytg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ad8at5Jjpb9g5rq5mr3QIGmSRyLHKYdo+e7vHN6tXczdc3WVK/mlwEBo2xx7eh9BVtXY30yuB/qh2FRF8dNQvTO9+cRci2+v/sWb8KYeLKhiWBk5RJOmXX0MHWgeJ4ddkVS/Bo2GlVU16ASypLBnd8NddD8aFlnImA6yhGRtgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mMbh35bV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LNahSu012555
	for <linux-watchdog@vger.kernel.org>; Tue, 22 Jul 2025 04:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KUL1SXlMm+AYyzg4ibYJZkgbEyXs5RnJKpLtDI5IH0=; b=mMbh35bVjzSW6Sa4
	t8MT8/y6CsuRfNGRFBZ735B2e++Ldc1zs1fhaivPrPlXyWpcWA+VkjHrma3117GB
	IsM8f38xhunNUuj0QrN5CaGxWLvAiFU5Bn6OBXu161fytcGD7bMzQWhP9O/hpUsI
	i5sxv86ZoZZeOQ+fmbhSaqJWvrdy1CCbpW8s6W2k8eJc5oPlrf03L7sSY59+VZPm
	7oNpjc+/3q/y0F2877swwf3pTYSOCpyUEMTtboyTx56fvDf09TjG+7P4m0ksVXEr
	d2L7Q/NXPPnQSYoGEUdwAPptN7l1YZTkKfJwrYjBstKlT6VoyYMwyWP/qN3qHbl5
	+Unglw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6jb3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 22 Jul 2025 04:16:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b115fb801bcso5633671a12.3
        for <linux-watchdog@vger.kernel.org>; Mon, 21 Jul 2025 21:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753157770; x=1753762570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3KUL1SXlMm+AYyzg4ibYJZkgbEyXs5RnJKpLtDI5IH0=;
        b=hKxc5elMn9safw6Z6ue5+7y2dgUMvEC0abbyKjp7OKSm4hxnR+LrrHAf5+gZkWm6l/
         Yqa1+5QaLFWNcailQ3637woRaM2ja6YRG5xhevqUxIhBRmootoNeqI5we/YpdzYb4T9x
         MZV+03oaZ0qCwOPYjp6MxkT8/ikz4kz7WmCcy14n3Y+n9XvY+e2gb/ufFUBomQkgWPRm
         L+DzchbhvijPSP3ySXGyrKRsxRI5C4QGeG0CU0cvY1IT6EFVHZCV3vnQIWqbgqN8OTun
         /WBbtPJX8qAiunTX41jtmNQjR11dWpECnpixYxl+ToZEHa1ytHpIYPNzqyBRTMoCPCC7
         LDdg==
X-Forwarded-Encrypted: i=1; AJvYcCU5mYkXRIljzOMDQ8I2jrcT0+eH1s4GyVKQ0c58IG7EkRCqVpI23YeLOn4UAVuv4tuM3WTxlY2k1rao6lSCxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzapoA4BaviB6Cr/g4n6seejmuxW4J9dxAT+bcz/dI9w6XMI8Va
	lDvBqdm+6y4XeWXeREc8niNLZ12I+NquXZH3g7W0wj2JtGJh1KBEsjVE221pxihZPInuc7VCvfB
	Euh3MvyPGGVa04OjGLOu6gpL2ca53o5JjUTn2N+SvfOk5LsnqbpLVmoX2RLv85tK/vxLhxht/zR
	/uYA==
X-Gm-Gg: ASbGncuX7p3mTsspvATXXrRqvxDryyroFUfeL+YA37mvQMde3UV7ZLGUBmS/elCVoov
	WnRhjus8NEsSZ0zxjONbOijj2PJuS0UgGixdaahSMXssMBOHLK1ISubsiWxmQZq2paaMYUoMArH
	n/SBEvCZkxEZYbij5gZXOKp2Orsy/cte13nd59FjyIPqkQxJmAgaypataZwFq7UOdCAEi5st/k3
	tDVcFc2dL4vGilkjaJAYOUcj64kv5uLggpahfr7Bzj2bm6sERXE3uJNENHXyHVdPgPwLAX5ylp9
	+0/EVTZHAhSpu/x8RHkUbmj+9xNolOwXgNUs/AHlzJ6m9PpuiPOD/eVASVQc96F3z2TQa8K7J8W
	PCCQWzSlW
X-Received: by 2002:a05:6a20:1583:b0:231:a5f3:4d0c with SMTP id adf61e73a8af0-2390dc2dc9emr25391125637.26.1753157770251;
        Mon, 21 Jul 2025 21:16:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErHhId/j/v2hg7I2Nk6a6IKicSJC1x+MP48SzOsKWDhWKPn7p/JJN48x/r2U9z2tdar/2Tww==
X-Received: by 2002:a05:6a20:1583:b0:231:a5f3:4d0c with SMTP id adf61e73a8af0-2390dc2dc9emr25391081637.26.1753157769658;
        Mon, 21 Jul 2025 21:16:09 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ffbce6esm6056292a12.72.2025.07.21.21.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 21:16:08 -0700 (PDT)
Message-ID: <356f7dc3-c51d-4fb6-a1de-35e4be967d89@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 09:46:02 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <39acdb37-e6f0-45e3-b54e-bd8a5905b2ec@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <39acdb37-e6f0-45e3-b54e-bd8a5905b2ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f108c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6IeY0j5x5GykiPM6AEwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: aJTdMdvcEfC58yglhtny2eC56gREUfaI
X-Proofpoint-GUID: aJTdMdvcEfC58yglhtny2eC56gREUfaI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDAzMSBTYWx0ZWRfX1XSZysYCiRRV
 R44P/Shnv9Cu6HTrx+3gdxabvTeMvhwt73ZzYmqg8hwKctdFCgR6QXdIgIN3oAvOScVd9kjlYYr
 QtV1cHpCZfe4+RjVM2/YcWJ9rHHWQxLB1f1IDm7H6mO1hsevMPC8js2dsMIemxNMle1pIyJmVjL
 xP6zlu0VpCEUoasSfd2a9OZQZDyllgRHAXgyiQKuy4171Mo4L64ANH9Ljfs1gbpLQtWeUwWW7hw
 xbhufqCYeNrD0HnYOcU1dqeYK6NQMVrYlUSXU0EaoF8KcgpEBZwvxiOeHuzxeYNFz0BmPO2n/7T
 yV4hzhVS7c59d5o6/wgNXhVMUCe845sNnvEFmmJ+tuKtHHPum9U25BPfcZm8Ek/hxyt1eVns3DS
 4+4MOGGDhHC4O8b/HOIyW0Vr6DndAZMq7fwBmTJPIuhQvHtuG0/IlFW0RLYGqkWTmiMRtzgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220031


On 7/14/2025 8:21 PM, Konrad Dybcio wrote:
> On 6/19/25 7:48 AM, Kathiravan Thirumoorthy wrote:
>> On 6/16/2025 10:48 AM, Kathiravan Thirumoorthy wrote:
>>> Thanks Rob for the review comments!
>>>
>>> On 6/10/2025 11:33 PM, Rob Herring wrote:
>>>> On Tue, Jun 10, 2025 at 07:15:19PM +0530, Kathiravan Thirumoorthy wrote:
>>>>> Document the "sram" property for the watchdog device on Qualcomm
>>>>> IPQ platforms. Use this property to extract the restart reason from
>>>>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>>>>> entry with this information, when the system reboots due to a watchdog
>>>>> timeout.
>>>>>
>>>>> Describe this property for the IPQ5424 watchdog device and extend support
>>>>> to other targets subsequently.
>>>>>
>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>> ---
>>>>> Changes in v5:
>>>>>      - Rename the property 'qcom,imem' to 'sram'
>>>>> Changes in v4:
>>>>>      - New patch
>>>>> ---
>>>>>    .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>>>>    1 file changed, 20 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 100644
>>>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>>> @@ -81,6 +81,16 @@ properties:
>>>>>        minItems: 1
>>>>>        maxItems: 5
>>>>>    +  sram:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>> +    description:
>>>>> +      phandle to the IMEM syscon node that exposes the system restart reason
>>>>> +    items:
>>>>> +      - items:
>>>>> +          - description: phandle of IMEM syscon
>>>>> +          - description: offset of restart reason region
>>>>> +          - description: value indicate that the watchdog timeout has occurred
>>>> A 'sram' property points to an SRAM region (see mmio-sram binding), not
>>>> a syscon and offset.
>>>>
>>>> The 'value' should be a separate property or implied by the compatible.
>>> Sorry for the delay. It was a long weekend here!
>>>
>>> Let me start with the requirement (Please feel free to skip it). When the system goes for reboot, Xtensible Boot loader (XBL) find the cause and update the particular offset (in this case it is 0x7b0) in the IMEM region with the known values. On the next boot, if the system is rebooted due to  watchdog timeout, watchdog's bootstatus is updated accordingly, which this series tries to address it.
>>>
>>> Based on the previous review comments / discussions [1], it is decided to go with the above approach, i.e., name the property to 'sram' and let it points to the syscon region (IMEM) along with the offset to read and what value to expect. So that we don't have to touch the driver if either of the offset or the value changes across the platforms.
>>>
>>> Currently, IMEM region (which is a on-chip SRAM) in the most of the QCOM platforms are modeled as 'syscon' [2]. So I have followed the same approach here as well. Should I describe the IMEM region as "sram" (mmio-sram)  instead of the "syscon" (existing approach) and retrieve the offset and desired value from the compatible? or stick with existing approach and name the property to something else? Could you guide me here to proceed further?
>>>
>>> [1] https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com/#t
>>>
>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> Konrad,
>>
>> The bootloader team confirmed that the IMEM offset and restart reason value are fixed for the SoC's lifetime. Based on Rob’s suggestion, let’s pull these values from the device data using the compatible string. Let me know your thoughts.
>>
>> Kathiravan T.
> So I'm not sure whether I proposed this before, but this is how I solved a
> parallel problem for IPA, also consuming a slice of IMEM:
>
> https://lore.kernel.org/all/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com/


Yeah thanks for pointing it out. But based on the recent comments from 
Krzysztof, I'm more inclined towards describing IMEM as syscon but not 
MFD and let the consumers to fetch the required information from the 
device data. Please let me know if you think otherwise.


>
> Konrad

