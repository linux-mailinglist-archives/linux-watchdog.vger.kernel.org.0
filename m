Return-Path: <linux-watchdog+bounces-3422-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA0AA76B8
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 18:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DBD3177EEF
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 16:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC46B25D20C;
	Fri,  2 May 2025 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzOEDFEz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6017F25D1E7
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 16:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202110; cv=none; b=uiQJm1i0tC5RwdfvY0iOX7/J+Tab1EeCGKkAWjAKInywckWNJhv3Qn+ZUcV4RhQWyBScEl2Q6WxaQGq19jrCpIXEdMveiGTC7Zkag6NTEuSRd+Oj16iLpcDxxpmkcUyk+hRayn540FYx8ovDmYB0Hh4DQm/fxWdbhOfUiUJXWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202110; c=relaxed/simple;
	bh=Aiw78cv/p68kfnHm9huW2dP7/SF2x9C9ceZ11r4BIG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJBQYkEdYCI2qNtvheoMPaiIkkfY5Ubv0MmfxyEz3VeTYTOsGllo+hHzES/3daVusxRpxggWCQsfU/JfY47sXCpn0jbdNvAYmiwCBMIaSuyL3F+pA9/3B8Q21s1uefMQGqNurdhF4R3vMYBl2G0xoQsMnCIs1zPkkWb2ZnX0JIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzOEDFEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DHhTt002130
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 16:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCURuZphALca4oH54vQyehTX8P10HSrIKR7pzdxmoGo=; b=kzOEDFEzns8z6IKY
	VXiK3lU2R9FtEJXfIuXSeIuGjANAeIHkUaH7UZMchouRAl0MGM3yKdgFztz5vDVT
	cNrs06uZmUz4e4TVMRxwr4Erx7nVYobpvfzA5WtxA2d9Mq2KKQroX/rR7wnnjkKn
	8jLcSfrAwYqko1uSWk6ZTc2VGsADLOS3ofRt0ghC2q+rZJKNkvIP4SiurWTN+qt2
	ToJglBlsn069C2iZLRd/pIFNWUvzGjP2+4MNrHYclV0V54gf7hUXWocfzSNn7BRO
	bTKfxhvRRdBLyGU40DJ9CUDcDWQQK4dfDgLDOB6MKJ3eYLH71SadEwdhJTVcHg5K
	7Qgm1g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u78wrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 16:08:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7391d68617cso3190913b3a.0
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 09:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202107; x=1746806907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCURuZphALca4oH54vQyehTX8P10HSrIKR7pzdxmoGo=;
        b=F/FvxoutARoLc/3v4Ql339PXpLN8iGvBpNGEHh37zzOO6ZyKTIcZ30Hzs1g6w7AuxG
         31rPOtoaBPU9pabx21c4GiAfAZayx2Uell7kTCsmZz1OlwkSaOtlWzz+pg2qsFpXUTP6
         ecSnB+LpndXHcVQyxVWCCdKG+Sz7V2InAezb5evvLnOgfa+0AMEeyaGN4Kr9lV0qnaPE
         koK1BVw2mX5exJRvD6Z8N6ySp5ZcJLDhKb/EV1iN3CcWv17PKHKrQ0W0pRGF4PpqxZ2p
         rr1jN4AIC761NtwPLTYfpzKnwRosh6Yf4F8sK6V8apHXCZW2A5vzMy0ElsuKjixS6JaZ
         ZZgg==
X-Forwarded-Encrypted: i=1; AJvYcCWgFGXWezg4ES3W0v+7GV0IsDtKDQOI7lqh8zLVnni0PFIkT6IloJ0Wl3NNdtX1te8JdfQVfz8UyN5AiFrqJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIJKkk1vIF/bkZQqzVByuLzz+HlBPxuPG07KsMynN3ijtLP2pX
	cdZaKwB+HRnVQDIVRbZqNOXwoJuLAszeD0uYnU1fqWnWl3ZbLYUK+j34OABDNOlAndr2lmrsM5H
	Mo5cWrirlH8pEjCM0pWrA6h0BC3rwk/dZJm/lQXI5XhGaqEtZ69hl21ieakBgHKaZGw==
X-Gm-Gg: ASbGncvAhU4NFtTgcW8BcEX2BG2r52G7x5Cbd82Vc/pa23HiIY6k6CSpxkT0ihztfMr
	SFlWNKc6aXKoYSG8zn7n1Q96zoLDaaR24Nafqm309sdU6bns52OW/O9tIQ2tk72s/BqspWYyY7t
	rijF3vB0IJHNZYlWVTzOiY/ot/naGRu9S3cwkdnTc54/057Qoo6hR3IEksk8dQekco1UI6yOJUa
	k4q5/+vrA9rPt6Q9U5nipNGsdB0iKy7eK6cHumeXgUV7p6WEmr9qiQgwtMp/7IvcxdBJPcEijtx
	F8MLck+kwHpDoY4gKlsA2u+wPaO3CzvQvpD37OfcKDJEtCSIjIx8
X-Received: by 2002:a05:6a21:2d0a:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-20bd7662d30mr9078864637.10.1746202107624;
        Fri, 02 May 2025 09:08:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFngvS5zV7065QKg5lJ9bJgIZHUtGEmOAi1Tej78hd+AnKg2zkgE5D/a4yAbK+mQc/qiES88A==
X-Received: by 2002:a05:6a21:2d0a:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-20bd7662d30mr9078706637.10.1746202106026;
        Fri, 02 May 2025 09:08:26 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3922041sm956661a12.2.2025.05.02.09.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:08:25 -0700 (PDT)
Message-ID: <83c427de-c678-4408-9b04-2f3d2eef9fac@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:38:19 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <f8b57c99-2f6a-496b-a6fe-3e2aa6b0b989@roeck-us.net>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <f8b57c99-2f6a-496b-a6fe-3e2aa6b0b989@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEyOSBTYWx0ZWRfXyttrP1u5EeJD +ObV1K2AlbALFNL5k6zw6YAEeQikLk3+xE2MzKoRV7pAr25l9y6jUeCbv0+kdF9E4HcCDHlf4GZ QFSOIH5OwBWnf9RYVw8QdItSbRw21r38nvUapeKP/Hn9KvFDhQbn12KCEuZKFsrLd5YzlmO6OYU
 azGnJ2dZZ+GKsHKGtqsCwPpB0kV3NAd2pamWJEB9ei2JsP/E6kRYsfT3BI49r1GfbsNg132r3Lm eae4eiDCqGCHkV/6VHHVAivl+r46iv+0ceuZckfrr78gKXbjOVzDenZ7DncJ7Ct+MW0KQ3ZAl9a Hi1zFBrkS0oEXoSxrnfgVgRZl0Ww+qi3kyF5tUnCEcZagoolyB1rE9CSliGjUguZU+OQ0CHzLOD
 8mT+eCWG90aGiZagFiB6E0IFFnTS5WLsA+giBu63c831ubqvkWivaxBu2zDfg99jUl9HX5lB
X-Proofpoint-GUID: xJvktPnOXQJr9rUSxK7_Y6sUUlDjPs7E
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6814edfc cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=9TRSRwEFIUlA1hFsN1MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: xJvktPnOXQJr9rUSxK7_Y6sUUlDjPs7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=958 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020129


On 5/2/2025 7:03 PM, Guenter Roeck wrote:
>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device 
>> *pdev)
>>       wdt->wdd.parent = dev;
>>       wdt->layout = data->offset;
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    ret = qcom_wdt_get_restart_reason(wdt, data);
>> +    if (ret == -ENODEV) {
>> +        if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> +            wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    } else if (ret) {
>> +        return ret;
>> +    }
>
> Seems odd to me that there is now a function 
> qcom_wdt_get_restart_reason()
> but it doesn't handle all means to get the restart reason. Maybe I 
> missed it,
> but what is the reason for that ? Why not move reading WDT_STS into
> qcom_wdt_get_restart_reason() as well ?


No specific reason as such. I was little hesitant use "goto" statements 
and such as. So I thought this would be little cleaner approach. Please 
let me know if I have consolidate everything under 
qcom_wdt_get_restart_reason().


>
> Guenter
>
>
>>         /*
>>        * If 'timeout-sec' unspecified in devicetree, assume a 30 second

