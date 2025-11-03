Return-Path: <linux-watchdog+bounces-4503-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97976C2B194
	for <lists+linux-watchdog@lfdr.de>; Mon, 03 Nov 2025 11:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 200914F519B
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Nov 2025 10:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11672FE56F;
	Mon,  3 Nov 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUEkTrmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpE1izAb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F04A2E336F
	for <linux-watchdog@vger.kernel.org>; Mon,  3 Nov 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166034; cv=none; b=USI/oRzTFNo4b14JKmqCrKE+PJx4nIfsJxQ2/UBMbq7xygXNWy4rAJcP4p1mtTh88wS+WHwg3n4rgB9KT5d4Wh/9VNcqgth1GbEpd0dMU5x2+GNx8lCVToynS5fRd+SY4ns483xK/E0D5n2uTAA4QZLZEXhn/Z4quNF/muoU/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166034; c=relaxed/simple;
	bh=Hld3A20ypq7EfrSD1xxAy8u3Il974vGYXEhaVccKVbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUkgPfwjJwS+x8Oesa5jY8P0BORXOWg5YfW0VMThsBlHxGwd7ATXKAPmE1rfuERTg0rc/cLWWwEBqj+zSSD40xUL5kjyUIG9HgFxB3q17VGVtNxXeY68QMRq2o7dP4S3OI9bELUJfUwhPnO8VymHxtYRjIncpKZCp55BQfGnO3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUEkTrmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpE1izAb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3AIUdI2755762
	for <linux-watchdog@vger.kernel.org>; Mon, 3 Nov 2025 10:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rn1LUOBG2CbQbe/cqiBEL/Tz9s8YyLm1nNaeiZPfffg=; b=hUEkTrmwENBVDoHQ
	pO0Coo5l/1RMKfRpy1fMRc8Ms6HswuFzIXv/MOAIeR4GFj5p+YpQYGm8lI7iRWjd
	Ngdw14JMh5TpMWMClvp6flnUxdD0RsCa4/KiabBdgPHPjJgssLTCxMZ/jurDWrHE
	jRVO4aXIzaRuKalV1BNl//l/iMax683Y4aHdC9ZkIcfvqwHQCF7mhMVclmNW8tq+
	ijQ4lg7+P78Jg/RsdaiLpSbpFAN0kcVnRZQyt+V20amvEBgwBgnzGSkEl8qtjYLD
	zl7/wbIO2TE1Ymrd76Cw6ceJhVlAL7LsZ4jXaE6GYJiDYXAcsE4J4NqwOM9ghPrH
	C8a2bQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6th9r19h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 03 Nov 2025 10:33:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956a694b47so17099255ad.1
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Nov 2025 02:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762166030; x=1762770830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rn1LUOBG2CbQbe/cqiBEL/Tz9s8YyLm1nNaeiZPfffg=;
        b=dpE1izAboB8MBAEXIKyJpgxz8jcj0DXvv7fzH4Ke9E0a5q+Ub92n17E0LPBQc8viaP
         6tOwa/e+yxySvBJT32rNK4z6B00k/aQ6I3BJ9fZ7kcjMGRwz4qlmKcQeiVMTFu/7CFtO
         bSbyfT4E7DlM3XgPDzFBm0VOdeWWXybsMja1CRBqfuXpqwacNxx8KXlsMqtCjGBTQOHb
         1WehMYSGBxYQdmPF84b27n/Pntwv9LtMwBKehs4imwI6llL19UWDWlxgGqUjBz8Ab4do
         QDyyfwOdxyfVavdiKv+0ro+MIMMAYknk5dgZ7GvI7vDCMIBpy8XrN13eL4vbgHkjNwSC
         r8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762166030; x=1762770830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rn1LUOBG2CbQbe/cqiBEL/Tz9s8YyLm1nNaeiZPfffg=;
        b=bgwKlZsO2kKX1Nunu1HDOaZBuGsbgCkLNnzKq2D0mx3GLjDrqGJE9vICTIXea92H9c
         Tp3CrWiPlVGt7hGT8HYbbGqmpsPUIY5XAarKEA9imxXXUnZfQnH5ERmkolkQsEE99r4t
         79GqDbEqDQIQfWRPZiBN7a5ZukVoD36Z+A0DmcVeMFeIxe+e4xlB3mgOvMxREoAegfIM
         hAeHKy7sOAMaAawY3j+ji45aAZB1A21WOOqU01LS/eelnlS3izVNQQUUBXbdVm1Jt/F0
         RwMZcWy6pbmVw/AwFrqBeWCu2NJRV/1E3PjRBIToqnY1OtWYT2Kj30FQOGB/rBu0gmuS
         lFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtK1O7NEMo6t7NZFrnBSinfP6OeVrCx0SYhqqcqP/K/XI/Og6S7UOxbgihkZdR4NYdEyKD4g9Pa1rT7GgdUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfEQ4xZsGQDCarB3M2XFuyHtMtmRwd1bz1V78rGcCmKs/DJM7
	VeJhcAkc2DOLe1WFO93skbESRRuuY1s5BOLeqnw2u0pKIwiQC3DiZxmjzjZm6AltN0+/U7cDFgS
	+AwRPOA6zTIzKJoYzfuzLFQ38vyKI368DbR6UEhVyNVOqZwnmRcUmcFsyrWToO31dEgTpS8armz
	QqlQ==
X-Gm-Gg: ASbGnctuLMMkpuC1SGJs4ytVhpAOyqwNBzyP2k5sb2cY4U52JbCUs7rFpwNiVD9xot9
	UKFNT8fs8/WtqAojeYuWe1pcw2u5kbPm5S8Ip8C1lGUr9EbXOLcSzhW2g23EnubPGsgkOk/E9ig
	Vbeu9EqzSsI02tOR/rofOKTWXUHLrXzblNhXSRJxl+hOVrr2Kkna16qYBkvDtSBQ9pvaYShBwzg
	6La4yV6Se+OgJx/JmIDsFPwgqrXmhcIWKERs6+FNGmNsvMAGqZzFLEWz/nktVnh7+jKkJHa4x6d
	nbFTH6q6eiXrVSb67UAvnRYS3jGt/ysv+7zTagK+eFDN/UgS+bz1ZFkqsg5CC938D+rzoOsgHNn
	pUtR/Xa/3EikYj5VkNskp/qDO32yM7pkLv8y9bXLg3BkBurYsrxpf3ZLtsg61oiaFhdustwGq65
	SWv+ZNYOtdcJmFsSU/peeITw==
X-Received: by 2002:a17:902:ec86:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-295b46fa745mr32601115ad.37.1762166030471;
        Mon, 03 Nov 2025 02:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuzMJXftYovpjYt4udUUg3xGT7FWWThDT/vHq5zHRYdVP1AK/845Nocr0Dh94zZj1rYIPw4w==
X-Received: by 2002:a17:902:ec86:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-295b46fa745mr32600815ad.37.1762166029930;
        Mon, 03 Nov 2025 02:33:49 -0800 (PST)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341599676d6sm589527a91.9.2025.11.03.02.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:33:49 -0800 (PST)
Message-ID: <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 16:03:44 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong
 <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xABc2e_6UaR3jplHraKELsPoRShRx0y8
X-Authority-Analysis: v=2.4 cv=ea8wvrEH c=1 sm=1 tr=0 ts=6908850f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Oglo4aDHNYH22b3EH6wA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xABc2e_6UaR3jplHraKELsPoRShRx0y8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5NiBTYWx0ZWRfX4LJyc1A0E7qo
 OExO8sX3qGmUTCrd6qBMn5oUni54w4MFa16hAvcSM4Whl6EW3DEsI5h49FvDQ5hMHCVNIuo1J3J
 GreNYZK6NhoDDxHGGTJ3ROunl11YKdbLUisvyArcfB/iUP81vZy5bxG/8bql7uibKvjK1MPZZG+
 OjHPvntTqQBDi1/nIw9T+2acyq6tlJ/cvGg/kJL2NviqEcXx69Exgx2trOK9JQA9XRKTh+VaDZB
 ej5ZPWjsBqfkM5Zb019C9tyyfEMwPHYZMSalCQEMMqX/bDxZXlFE+bFXiT8xiqXasTqmCWQG36D
 +BbC0C2tBx64fbRv47+dW9gfrMl5KT/oqeCe5tnhS7EZfyOHkNNlLGizGlz8NNEQZlqHvBAhqu8
 Ldslkh+GPkbkEF5OanG3ZM9m/ZTQJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030096


On 11/2/2025 12:15 AM, Bjorn Andersson wrote:
> On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>
>> To restrict gunyah watchdog initialization to Qualcomm platforms,
>> register the watchdog device in the SMEM driver.
>>
>> When Gunyah is not present or Gunyah emulates MMIO-based
>> watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
>> present in the devicetree. If none of these device nodes are detected,
>> we register the SMC-based Gunyah watchdog device.
>>
>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
>> index cf425930539e..40e4749fab02 100644
>> --- a/drivers/soc/qcom/smem.c
>> +++ b/drivers/soc/qcom/smem.c
>> @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
>>   	return 0;
>>   }
>>   
>> +static int register_gunyah_wdt_device(void)
>> +{
>> +	struct platform_device *gunyah_wdt_dev;
>> +	struct device_node *np;
>> +
>> +	/*
>> +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
>> +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
>> +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
>> +	 * the case.
> E.g. qcom-apq8064.dtsi doesn't define either qcom,kpss-wdt, nor
> arm,sbsa-gwdt, does that imply that it implements the Gunyah watchdog?


It doesn't implement Gunyah watchdog. For platforms like these we've 
kept a STATUS SMC call in the gunyah_wdt_probe().

The SMC Call is expected to fail on platforms which do not have support 
for SMC based Gunyah watchdog, which in turn will fail the probe.

Let us know if there's a better way to handle this.

>> +	 */
>> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
>> +	if (np) {
>> +		of_node_put(np);
>> +		return 0;
>> +	}
>> +
>> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
>> +	if (np) {
>> +		of_node_put(np);
>> +		return 0;
>> +	}
>> +
>> +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
>> +							 NULL, 0);
>> +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
>> +}
>> +
>>   static int qcom_smem_probe(struct platform_device *pdev)
>>   {
>>   	struct smem_header *header;
>> @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>>   	if (IS_ERR(smem->socinfo))
>>   		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>>   
>> +	ret = register_gunyah_wdt_device();
>> +	if (ret)
>> +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
>> +
>>   	return 0;
>>   }
>>   
>>   static void qcom_smem_remove(struct platform_device *pdev)
>>   {
>> +	/*
>> +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
>> +	 * watchdog device is not unregistered.
>> +	 */
> Why? I don't see why the code needs to encode such policy, please
> explain.


You're right, there is no such need. We're at wrong here. We had an 
incorrect understanding of watchdog drivers being persistent. We will be 
implementing the module_exit() for the Gunyah watchdog making it not 
persistent.


Thanks,

Hrishabh


