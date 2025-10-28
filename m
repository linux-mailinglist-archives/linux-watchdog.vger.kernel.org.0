Return-Path: <linux-watchdog+bounces-4422-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E44BC143E5
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 12:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0B9625325
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 10:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BA030B528;
	Tue, 28 Oct 2025 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbQud6Pf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279E230BBB9
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649099; cv=none; b=HthdqFN5P+2NlSeJLXCtnU5oLzxXjxeBKJHvKTsXA73NNk5Xa2TH6sSlAkQJnICCG72eBO4m/fvHugfIcKV4O/PXKVQTo0iicY/KfWapYasUpLMLxaYeoJpDCD6jlVb+R9DEXMVr5OAALWzpqT3iusdgSZv4uuLgPoT0rlTBOy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649099; c=relaxed/simple;
	bh=vqremv0t2yHOOQI/+Hfhb2D20oc4q1/kuqwTB3jLX4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0HdnsqsKL+erARqXFuOV1Pgfnqsgg56V9KUj32UKtiaV8GFSCuvF4g7WFoZHdAa8InAWsNAW0QLwcZXCwqOUbDWjs+XYhvhWrnBcpCvwHBJRdhgw4K0bVBf3qF60dyCesR/oDLvU8CQZ6wLV8LBLuFehwhtBhONR7/XdmviIYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbQud6Pf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S4A8Kl552716
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 10:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BctJ7Ge/xFD3/rRPCMnaqZXGXFAhHKqB0rU31331hjo=; b=VbQud6PfI2L7XENN
	Zukjk+GBpCddPcK84H5T6TKNuwLxdcxmJiYHXIB2mZV5vlGtI/7yR9il7CgCvXn/
	yoB37di3Jmscgd9GwG6tFbqnvyFoG0EYkTgg/6855jiyU5gZWA+SNCzJUSEInSRY
	ltwrWTlsrGjFfC0lCfdCoXxGqBtzAxzODEab284lBJE4VAUcrx6WPOs7y35mZJ5o
	BngoLd3lvZu/30vx2mCq1EpkhphPGPonYcFLAawJ/JTCyLAYQdrHhClInoYm7unO
	bG59M11+K+w4j+E6aldOZGzJA2lc0Cjv6ZsI7JD82jMUJdLCMWqBos7J6jC88W72
	Xyd5RQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjf94m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 10:58:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290c2d13a01so43295115ad.0
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 03:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761649097; x=1762253897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BctJ7Ge/xFD3/rRPCMnaqZXGXFAhHKqB0rU31331hjo=;
        b=g7AMGKxi/AupZE4fXHdnJba/LVanSnJz1/JnSUw+CS/Y2BrbbhbTlCk8dU2nhwh7V9
         Chz06HLLtQkahz3/2L9xCqkAa99X75EBQOGRFwQnK1+5ROoQ5UjM83oU7HDPEKjpRMcp
         SLaeG6M9XCc8OSOEmdb/vvcd5ERYkfjpidlBF/IJ3QCzkfRhyxr1QFARoXt1pQzuAOfm
         UmAjpJeJm4EyedA5oKlronoJYbHChcNy+Rzi3SWbqk5rJUP+Myth2d5hIrlxLWIdBNTR
         +AYxH5ckXia1sabsLTGNc9b+zBr21Zch82b7JLh1EfbpE/t/k3HuJ4QBFW8A7IRKCJ6G
         6jdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmR1scWCnO4mSQBgEggYA09/j2sIj/0gmcCw8F/RUlAVfK6N6R/ngWc3MopWjbSoROiwKMsojwXeCh91XOOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwBdvcFGwKuF5oMz1BERlAaJ/5bkz30BFqrVcU72S09m1vYsWw
	rn3k9tDvUKnM2uwI9R1Ob3QW8HV4U+5RTPMd5r83TBYkKV/VW259H3+wqUKXtV/e+7yRglrxn97
	zq7ormTAbKGkfVrq6N9UVFqMTQOPJYK5EuZu6wtnmUqpYZPojQaJI1qoW8PuQrTfV7qZsbQ==
X-Gm-Gg: ASbGncvAUqoQ9mS2wHwSaBETLhF8X5WLPRFPCK/6FIfo7FajxhFg4jSKet1e8LHTrGr
	YYMmXnYeprAJaE4A1xvMOljTgtLEBo/xrhyqgxtWtxAE/I5+ZJvC1ti52fHMLUeRuSNYuxddS+j
	dgb3Gi+5ErNKiE2GvyheXLUCiogdNsysh7isJqnvyNQHunxGu2B26QhEg/ZrrQWtq7cHWuMjjpf
	6eoc195rpJOM6p6gqwx2RcCobmUPfys6fzRmtHA0x8Zvh7N35oVcumC6W9I/hYJpZd6tjKz6uAf
	XK7w31Yu3/0KDYalyOxGAzPB8d8oH8XtNhZB+CucM93oRkewt84iRYI+pmdxamRZ6U9XIsVUPfv
	/OwO6Q4m8l31gWLXIeqx/Hcr4G74LBWiQvTKt7J3Xd30Afj4S0A4oeB0iM24VXsIlv5X7p0lF5Y
	xrgRef90b8HZOkwKFZ2BGBSw==
X-Received: by 2002:a17:903:1c8:b0:267:8049:7c87 with SMTP id d9443c01a7336-294cc70eccbmr32590125ad.14.1761649096726;
        Tue, 28 Oct 2025 03:58:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0mw89yeFqR3a6GQze79ilRQbukr6qbMLLAHbQ/m/vxaAEX6diASv/5hii+JLxpSNZMzMZQA==
X-Received: by 2002:a17:903:1c8:b0:267:8049:7c87 with SMTP id d9443c01a7336-294cc70eccbmr32589645ad.14.1761649096102;
        Tue, 28 Oct 2025 03:58:16 -0700 (PDT)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40de4sm114963405ad.77.2025.10.28.03.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:58:15 -0700 (PDT)
Message-ID: <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 16:28:10 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=6900a1c9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SxZnsEcJDSkJ1Opw4BEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5MyBTYWx0ZWRfX0Pcy/j9qLRCv
 omh5o07UKNpLsn5VPHWWgFkylU3jSgrRW6r0cSEnexh+fNoQ7hYXAKBSHmSm2Wo+EvFsgLPCWzG
 2CN29tjPaULtpj8egiugegPZJfHs4k7JQHxMamc9y0YSNK1U0MU3DrY0rX55/Eh5o5RWGSDWJbh
 uiL657+ZDe8t70ArWecyyLSByD5I4RCR5hV8lB/r2sz7d+kuXSjSUfwgvFXBQd1BVdbyxopjQQa
 WYN/Tx5bfnJEgVXWctHb6fCUlRbN67JOxl4UR4BjWSfdIDrSYgsPmBmn1JLi2WHpAb8UAsXg9an
 gjWSpLXBU3eZq4kvEehuZZjuRUlYNP/dgardXq9lLBXUffIoBW3CdRQv0eXba0osKjGrOTStyQ9
 HbIxa8H8bLMxEcrwZIlF23+IrwOm7g==
X-Proofpoint-GUID: puZKpM4QcmeEa6gdai5Dg3Pl7CNlVAgV
X-Proofpoint-ORIG-GUID: puZKpM4QcmeEa6gdai5Dg3Pl7CNlVAgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280093


On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
> On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
>> +
>> +static int __init gunyah_wdt_init(void)
>> +{
>> +	struct arm_smccc_res res;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	/* Check if we're running on a Qualcomm device */
>> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
> I don't think you implemented my feedback. This again is executed on
> every platform, e.g. on Samsung, pointlessly.
>
> Implement previous feedback.

Do you want us to add platform device from another driver which is 
probed only on Qualcomm devices (like socinfo from previous discussion) 
and get rid of the module init function entirely? As keeping anything in 
the module init will get it executed on all platforms.


With this patch version, we have tried to reduce the code execution on 
non-Qualcomm devices (also tried the alternative as mentioned in the 
cover letter). Adding platform device from another driver as described 
above would eliminate it entirely, please let us know if you want us to 
do that.


Thanks,

Hrishabh


