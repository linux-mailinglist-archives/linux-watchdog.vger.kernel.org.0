Return-Path: <linux-watchdog+bounces-3398-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD27BAA4F40
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Apr 2025 16:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80ED9C5B98
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Apr 2025 14:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903361AAA0D;
	Wed, 30 Apr 2025 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vp1dXU1F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC13B13E02D
	for <linux-watchdog@vger.kernel.org>; Wed, 30 Apr 2025 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025115; cv=none; b=n60+m1CWzP4ATnt9Z6CXGTTx75PrEiOHFRIUZmHQGCs+UYkHDsGlLDZ8xYZvzy2BUKxR2Mej1CTt+WwTUH4YyEQhlhug3vPnsoggLyWTF9XjhNPK0YYYfadeIRM4Eoo3tZX2DBPzG1Ab6e3qtGBgJjQFtT01l76iOKz2bnrJgCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025115; c=relaxed/simple;
	bh=wB6kpIf21q1Qn6YXVNzBxYXe34/WGz8PYw9bqAw7+C0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbnoFVWcBM5L6OV3wiW8wB12cDqz67/L+wIlxnLBtyt32wTUrLQ6O8L/MU9VtJTWhlZ3tb/lJjLRJi3Dm9HjruIg7UESz9+CbKH7xB/6zmjIedLLO/N7MtuRU71FomyqfJJc+vAzyQugf2k4OiBY9yLcWOww+7+5dFfx2295r0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vp1dXU1F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9LEiZ029586
	for <linux-watchdog@vger.kernel.org>; Wed, 30 Apr 2025 14:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0395qd5yJqamGnAr3MiSAsjGjuJlP7P6P9uGyNSoi0w=; b=Vp1dXU1F0aba3NFg
	3uWHJq72RAyi+rek1JEtvAR8Wj0w9BSEP6vvtZ+MQHWWtvKMZfeJ2eNCU5tzVR/t
	we61iI2nIkqPMZUaQNVjREG3Es/Qdp+x0KVcBi4n/Q6ZHc3esjwQIfQA3wXdNI+s
	aEmz+MkaET7DFpLEuL88AuQxIqcRX17qwTNMoyLrsx9a7qPnD2jgkSv2yiE6AmWB
	W5fq4NzyG/Rh2suQto9lVtMxPYg4pn4mDDZ4tNiiEyfEZDMQZHLZOjL0aqrOJvIF
	fAJG0pQocQybrAxl8Dl+g6qYkKHluIVhUJC4mOLcJ7SEcGEApey+qCshzXHPn38U
	bCeaJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u7tk2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 30 Apr 2025 14:58:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a7aceeaso67322785ad.0
        for <linux-watchdog@vger.kernel.org>; Wed, 30 Apr 2025 07:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025112; x=1746629912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0395qd5yJqamGnAr3MiSAsjGjuJlP7P6P9uGyNSoi0w=;
        b=h4uqXtdtO6O9Ip7W9CgKaxVa/o48+IqcNnUkVFs6w5p1zuA252zAJnfeyDHbzvtDbq
         c5Hl+y96NFD2KhYuEi6Oif4MFunY7U2QaTyoGu78xMxBorEBLYdM51o28T3lG3i2W7Fz
         3sb54dFNntj1Yo0aZwBHun4UEHz0Rini3hEnmPhaJrvMEpKiKmpoyt2sWCIqFy1PpbFI
         23XrlaVHsQ8EdiRHZXkACwsld2GnqIPsIoN87n5pueFYwt/dsaYYkqyl7xy/+Ve1aWnl
         4q2uxcjnml2DsrX1FqRSkaX5ioES60aIZocf47QkyBjCCBr/HTwlOJHBnvPWZKaL8WX2
         4U3A==
X-Forwarded-Encrypted: i=1; AJvYcCWWoHTZcCO6hTb+MYXCLXmIlhhhdjkjb/l9ZeXes5I6RUITWhaf4Ndwo6dyrb9A6ZC2f6+hLB7fGS5qEa94UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8BSJoOiCTYkwX/T2wSCB4Xkl7Gh20O+/uIRYUjYmL4aWuihVS
	o6TtcuH20nqe4/R7yqTdqKs9OB+89JeQd5Gzh/8azCrO8Wd1LfaaMIU011jiYyRekrVcK4tWk+j
	yrh8J4uNur3N1a02qBS+m6z7vnXmpiUwNU1cDmhSo6CCY1Yw6gZTS1slVy68y279vgg==
X-Gm-Gg: ASbGncvvjyGelpYdn5fqAOEbgOz1Lv0zs4oIXk+/CvGUleD76+dApiumSG5IGdJo+48
	Y3zPHGaBREd3OrqkEKfNqp9BwzTH3ahIuayN5k2Z2+HZTOIhAALecAvvJL7ELEtnC0zv2cBrf5J
	z3pBRBYrNEEltZcHJifBKUE8yd0GH2V2AZdHOPYCBoKQmR0eJYl/MHIW8s7TodPdW27bd2wQU+W
	Ttm2RHgI/jQ4yYIvf5kIYacqyeEDiu68uWQdT0NS8GQmi/DF+I28SPIuygpqSZdqCh4KeRxsNZG
	s7R7SAvKMsNRVRFsnzBIwZ+KLMD7UzzeOu6QZLhLcwcDUV7Xa4c/
X-Received: by 2002:a17:903:238e:b0:216:794f:6d7d with SMTP id d9443c01a7336-22df5838d24mr48531875ad.48.1746025111998;
        Wed, 30 Apr 2025 07:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqTq6PHUfdr6lYeZjfMfQgeitmCQj1xj6u1g5wc8lHhOeu4N6jAXqIdsqmrbeggeTxMbY6nQ==
X-Received: by 2002:a17:903:238e:b0:216:794f:6d7d with SMTP id d9443c01a7336-22df5838d24mr48531545ad.48.1746025111693;
        Wed, 30 Apr 2025 07:58:31 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102ddcsm122866445ad.190.2025.04.30.07.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 07:58:31 -0700 (PDT)
Message-ID: <a9c8cfe2-2889-4f75-ac5f-10dcd564808e@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 20:28:24 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
 <4e9621c2-f347-4cba-9422-b14f96ee4c0b@oss.qualcomm.com>
 <0a774c34-e82d-4ff0-aa3f-4f348f4c2296@oss.qualcomm.com>
 <f6f17489-19ec-4956-ace4-47ec93081359@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <f6f17489-19ec-4956-ace4-47ec93081359@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=68123a98 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ZnTUR88OqGoCr7JtRBMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: aqoUOalsY7jieHBAq4s0pXCWpRqluYVL
X-Proofpoint-ORIG-GUID: aqoUOalsY7jieHBAq4s0pXCWpRqluYVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEwNiBTYWx0ZWRfX0B/Nj/EdWlmY cvNJ1QurWF9P60gqIYbYP4SBjsO0Ar1YaJm/Gf78nXoNBMdFd5rF0GOb3KkaAphO8ZbqNHUSFCb VNMOklHqOjzQSy+bWGxz+xLB5F8N/V1Pji09s1U4NgVLgFCvWuv+PkUtR/M8oIusGiIOkDvVcOp
 1D6XiI9hgK9gTPfXDBnZ499HmE9ZeVH7PgRSWNFMypSLaXF7sBbCtX6CtPSwairdu8LR67MHlVW Sv8sftYIR0iavROBKK3uDrHPLigsjyDaUA2DDsN8mVNhOnKH7KjjiNZwixsGIZgBNw3aj8eazb7 ZYeoWBm1vYvkeYA238wnH6B8VlCji6eNSn8eUZDwlnwdbl1sYWtAhFPHlUaMRys4uuW+hhaTRfG
 VQAQYh0Hbnst/PHSDp94N2topOVWg3Y49wBR0pSoerDETIhehJ5USAmvfN+QsDIlpg791LD+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300106


On 4/30/2025 7:58 PM, Konrad Dybcio wrote:
> On 4/17/25 8:19 AM, Kathiravan Thirumoorthy wrote:
>> On 4/16/2025 8:21 PM, Konrad Dybcio wrote:
>>>>        .max_tick_count = 0xFFFFFU,
>>>>    };
>>>>    +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>> double space> +                    const struct qcom_wdt_match_data *data)
>>>
>>> Please align this
>>
>> Ack.
>>
>>
>>>> +{
>>>> +    struct regmap *imem;
>>>> +    unsigned int val;
>>>> +    int ret;
>>>> +
>>>> +    imem = syscon_regmap_lookup_by_compatible(data->compatible);
>>> I still think nvmem could be better here, as it allows to plug in
>>> more magic values
>>
>> Sure, I will be on vacation next week. I shall check on how to use nvmem here once I'm back.
> We talked offline and I learned that IMEM is not in fact non-volatile, so
> while good looking, the nvram APIs are probably not really fit for it.
>
> Let's continue with the syscon approach.


Thanks Konrad for the discussion.


>
> Konrad

