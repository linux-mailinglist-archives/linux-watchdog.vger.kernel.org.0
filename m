Return-Path: <linux-watchdog+bounces-3285-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C05C6A85308
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 07:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF88F9A2204
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 05:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0B727CCD5;
	Fri, 11 Apr 2025 05:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jWrUhyP+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59927CB1D
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 05:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349154; cv=none; b=klbYVFUWWjSnpCEKVY2EobpRzUrD8J2H7dd0POI3EgOU4n3PW29cweh4BA05CcpWZgLFosHvVO5TTcPdTt/kKTzRLu006/QB1QnNNv5SPfLMqGazVjahmSeC/pWh2Mf8gQVWFRo8fPlW14vR/RMWFAoZn4Ig2YqD2o29I3WY09U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349154; c=relaxed/simple;
	bh=ioSOXlyQXFl579hTqs7zPHpSy7ZBOmYC5HjQcqXr4FI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3e6jRuxA8oDWZnUQQ1zEECAAC0q3IHKvBxklQsq4Gj4bMIb3R1iN6bZliq/93ClgUoaYPbfeZ2peRh/H7DHJP09fhO/sN7GudkQEMrGXZW2sZYd4HfhbuBr2M+ddad0LDoDN+J5x5EYMirL3Mbh+EHs5DF7S8oxRBzazSErSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWrUhyP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1Ewve006985
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 05:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H1U84z5FFrxTwGwNaEGAGiPAnjhUD3wh8jtog27DmO4=; b=jWrUhyP+8txoofAd
	rErH6WOIUtJqu2XPS3a8rpj6FVzUeApvDhYbCCKR0OX9L9QEHploNeG4EjAbjoIj
	odkX2ndCpYzaRmoD0xW2UOBYmWWAyw0nABSufaTlkqcgJZsW3xFhjIzg1HtNelIj
	GojAjcoLNxrI2IDbJn343SgCE/Dnjl7uwXdMw8kssOLM1lbi7P0mkJgR4mMYGX3m
	bUgSayNQMcBsb3GaUZy9Iz0qQbe7kQ46RqLRu2Rz1mRBHGptEcWLxa/ylwZzUcVz
	ThfV39EkbPh2sY3OV6wOS4h8jvvETMHIEijooAzn+UDw4M2J0l6fCbuazK7nhyo5
	4xA4CA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3j979-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 05:25:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2262051205aso11022775ad.3
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Apr 2025 22:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349144; x=1744953944;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1U84z5FFrxTwGwNaEGAGiPAnjhUD3wh8jtog27DmO4=;
        b=e02XZuRumK8r4fp/9QroucJm2LN5dD76Ta/X2TgD0UEKJ5r/XRHaAZPF+elmXv8afZ
         qxYMbjZqQp3gOGrEeEqb2thKP8oDMEjYLaCu1TZE91+TWs0Na0yJWTjosCgDWDqOZ692
         ms55NVqRp/m/gJ3F8AhtzZhguVsN6bzBNwEM16DA4v7Zb/CgKPeDhHJXS7AzFuJMZDeH
         NDpdfaxbxNTltpVPwDw1a9aI7KEkaZRXEi2oay8k8QLGc9q2Y8fxn8qAiYxvEUnAgD9+
         zZsR7tgRdhJfEOlk7frYR2qRT33MPCCJtc04NB2bo1YcBzPExqj6pKcV7VLtSdZe1ZWN
         HiEg==
X-Forwarded-Encrypted: i=1; AJvYcCVnSgAJbqo2die6QfAPoxWaOBrQBb6d7p6S7XEjxco3VlM+zTf+y+nNduB6MJej1PpNdSB/p8tWII/V1SIrWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYkKw1vKfROsrFJ7v6I+Ss0pNaSoZVoI9nt2jddJ3q8nSMl6D1
	9JiDtUaEA80Rct15cjA99T1h48VuMs/nW2caK90gErIA5Zxd1AgaqtGPM1Kq+5fIiQHtM0FABzD
	gEBeb4aZNreTGcTNnDZYdtuFVps8R/xMOtsp6L+Kz5XvfudHh/3BkDK7ftxzEUUX1qg==
X-Gm-Gg: ASbGncumdRTl1RQtIz59Z+CCyDTSW1m4hcwMLxT5ymy77Xcxov1F5qmwCRxNyBnB2lI
	eSSFXkno3iWgQWFMgo7XulFZ1siGSilG/GVdM4B9O8FSGGYfMmy21u8STi7nKQe5Stw15f1/fOz
	1CItM+5F6lIZGu7dkPeBv8g7M3vlRdlNHRuPloTEmdElCf4Sw6pDuod5kvv2ocyjd9AgQUbUUsc
	Vr9qpGnrHhqTn04qOGss1sLRChkpFBbZf0DFdh4EyCCPR7C9JUHylSOBcIX0Yb72JD1x5sDa0V5
	BY9+HwDFF69qQppSJoW8pWVYH55ZXYF4EFR9m+2hylbUQTg2W5iA
X-Received: by 2002:a17:903:228e:b0:216:393b:23d4 with SMTP id d9443c01a7336-22bea495810mr22859845ad.11.1744349143716;
        Thu, 10 Apr 2025 22:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq9hJcgN6Gn0Is3/IGIlN6OeMVKZo1lhl6PNnOXgM4n0Dw6h6honDiiUSiXrOcA9EERqaa0A==
X-Received: by 2002:a17:903:228e:b0:216:393b:23d4 with SMTP id d9443c01a7336-22bea495810mr22859565ad.11.1744349143258;
        Thu, 10 Apr 2025 22:25:43 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b628aesm40576625ad.8.2025.04.10.22.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 22:25:42 -0700 (PDT)
Message-ID: <eb69d69f-9b62-4eed-85d5-8adb1fb5ac8e@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:55:37 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] dt-bindings: watchdog: Add Qualcomm restart
 reason binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-3-e6ec30c2c926@oss.qualcomm.com>
 <2dabc542-33b8-4878-a586-f9aac7e035bc@kernel.org>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <2dabc542-33b8-4878-a586-f9aac7e035bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8a7df cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q6Z-E9ZhQsGCyXXHa6QA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: GSliLmWbqV7r7QxMbG6nf-I1S3V75llo
X-Proofpoint-ORIG-GUID: GSliLmWbqV7r7QxMbG6nf-I1S3V75llo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110038


On 4/9/2025 12:30 PM, Krzysztof Kozlowski wrote:
> On 08/04/2025 10:49, Kathiravan Thirumoorthy wrote:
>> Add a devicetree binding for the Qualcomm IPQ SOCs restart reason
>> information region found in the IMEM, allowing the system to identify
>> the cause of a restart.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/watchdog/qcom,restart-reason.yaml     | 46 ++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom,restart-reason.yaml b/Documentation/devicetree/bindings/watchdog/qcom,restart-reason.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..babbaa70b114f9691018ed6cb10bfa78e18fad64
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom,restart-reason.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/watchdog/qcom,restart-reason.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ SoC restart reason location
>> +
>> +maintainers:
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description:
>> +  The Qualcomm IPQ SoC restart reason memory region, in IMEM, is used to
>> +  identify the cause of the system restart. This will be helpful to identify
>> +  the cause when the RAM dump collection is disabled.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,restart-reason-info
> No generic compatibles.
>
> OTOH, I don't see much of a value of this being a separate node.

I leveraged this based on the qcom,pil-info.yaml [1]. I guess, I see the 
point. I will drop all these. Just define IMEM node and in the watchdog 
driver, I will get the regmap of the syscon / IMEM node and do 
regmap_read at the desired offset. Please let me know if this approach 
is fine.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml 



