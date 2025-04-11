Return-Path: <linux-watchdog+bounces-3286-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBDAA8530E
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 07:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C939B1BA207B
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 05:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A5127CB2E;
	Fri, 11 Apr 2025 05:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pi/no4Xy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DCD27BF7B
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 05:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349367; cv=none; b=UrN2HWvW2gplLG8HeqpMXB40Z/dEDrAfyGWn9JTD7gZpGZwPLK4eYpfbIa6O2IUAtfRtAIpR3DEtKlZeVmMbBZUiJcesK/XEObm671JG+fpUi3PxSwi9WUPe4vexYrIfAfKhtnFB1I++o7YyLFE2m64iTBHkOOV2Pit8ZpZj8JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349367; c=relaxed/simple;
	bh=TyvjaogtjTDx/T8QlFwk2AxVNIIPeTdvsx9AidCmtAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOfg8B/QarppsI48SJEq5m10pbKflKsnrtDLwBZ4Qtmjy2CkgqK9QSqG4eG7Dv/Seqzon5EqJDfWy8jujOYuHlDQeNDJs3eJWZpZV/9weeV5hOvQGM3G3rgsMHfyepKnReSCyycJpdJBXQsdQ/WYyAA3hAeU8T2sLq25tjOFO3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pi/no4Xy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGbfda030616
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 05:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUbjZYN3IQWyjpUUVwIb4CXGeBKGLs02G7FDkNMNVZU=; b=Pi/no4XyzIyab+op
	Y5QgktvJ4g/CjERWmNC8zs8ybBEJW9j0H0w6niTth9tfQHuHpwZvraMS0sC43Dd7
	sBhk/scAt6SsfeUrGne0tJWjpd6Zrj6L0b33C/+HEukdCMHfwpHyW+RIc+4cYREe
	5xAMwVk0dWXFdYcg0hWan9GHY4ub2bAWajFoz9YQvmJzjAkKREUjH2r+YwHUXUGT
	xA01nTWZRJK1eDTfzCW32a1tUaJ51cgboR6jVedoL9KpfTLuUcziFwNsmkCExkHx
	SiZps+z8JACvKyJ1h63O5tIqdiZdjIwNxNm9JyH0rtcNIqiAyl6VFmHlIRoTd+uE
	/5wIBQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfts258-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 05:29:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-739731a2c25so1010794b3a.1
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Apr 2025 22:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349364; x=1744954164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUbjZYN3IQWyjpUUVwIb4CXGeBKGLs02G7FDkNMNVZU=;
        b=B8wA7YECANicAcwzdrGWJv0B6JeX1doayg/8rJiQDIIXvWuSUr5ba36ookEv76IFTL
         cObzNCu/0E5pgdc01GEhUdl16mGYbFXlqq8qX36uKg3iNBF5ZnOEGFtz2A/a6Dz4gm4p
         9Yys50QedMtprwXiZExxYiYaQY5T8MzT7BwOGIrZjwz9QTnw2pWkayvbC5iR0o2pqFwa
         6W/Vo3WXdQB6PSE+5fAyoq0jIOPgpRT+NJpJJNHqVUfiheQ1CvXdRwOmZ3pWEKJbeRIp
         E6o0mg/16kTAN63YeZjkWEoOLe49uKrpS3cUcwT9E60vfoFBgXNLQfjn1Ci1H4x2MMPn
         sssg==
X-Forwarded-Encrypted: i=1; AJvYcCX+8/s7jRfEfZFZ9Ecys6QHrrwM5hneg9qOIXyNdk4F2kqmxazi3Pxv3timZHzqHB5vxgfgY71I7/w0D8I0kA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4CcTNUNh0pfdGn7tNpl7Zu4GkorotXDC12T6sLE4hRkvHT4oJ
	SDBQP/+FkpUzm0KxpTzd7Zjbny6kwhaevGOi388O6YWVWmgZ8wIjac5sM2O+uM1QxOTjQh93JvL
	3ooMVfD5QQaRce5fLwhK69tWa7AfX4vB3O9XjmWE5zT3XV/5CTEVTJn2QdQHb4pwC7A==
X-Gm-Gg: ASbGncvmOsdRq5oAXoq7r9QdUqiIV04lzDu/w+GA/kvX+nL85hjSSTRDFEUObb7+kQN
	1es0zSeuFGUvMAbYrp3m63jilGj+rXpk/JWDY7U73X8lxIP2v3d2+QS3Ub20l2+u8vvO4gJokS3
	hb4V5NIsrQV/BsHgsuGmSl/29BiFsBIP7/lbtyPA5HhcK6CkVkbjL/NnAi5X19UC385Y2RymeOe
	vkkEwqKNdEid5fyRyT0/540PiM1XKVa6DGoZbOi5s6nrcIkjepQ0uDMEuDFir3oI3tDeM6Vx2jc
	dvrhR3x+24Yq3NZAZiTRYCNXHxnIpPBKR2oTrtKNGfjgXa0bIYoZ
X-Received: by 2002:a05:6a00:ac2:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73bd11e6d4amr2204610b3a.8.1744349363882;
        Thu, 10 Apr 2025 22:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKdA+yoEfaH4SyvUyAodpSjhJ93TtNdrQMglLHoYzjAgSJgmykhbyYfCXYlFjunZmyz1dJbQ==
X-Received: by 2002:a05:6a00:ac2:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73bd11e6d4amr2204583b3a.8.1744349363309;
        Thu, 10 Apr 2025 22:29:23 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e34asm581481b3a.137.2025.04.10.22.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 22:29:22 -0700 (PDT)
Message-ID: <7ecc8079-1110-4692-a257-09c4ea2041ad@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:59:18 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] watchdog: qcom-wdt: add support to read the
 restart reason from IMEM
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-5-e6ec30c2c926@oss.qualcomm.com>
 <e02e7431-2e30-4e65-b04b-15fbb0bcd8d0@roeck-us.net>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <e02e7431-2e30-4e65-b04b-15fbb0bcd8d0@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8a8b5 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=WtALBppYY-rU2wiDHIEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: SSsxD_RoSY2OeApxwvY6dgRftxjWbxyR
X-Proofpoint-ORIG-GUID: SSsxD_RoSY2OeApxwvY6dgRftxjWbxyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=917
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110037


On 4/8/2025 6:03 PM, Guenter Roeck wrote:
>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -267,7 +303,9 @@ static int qcom_wdt_probe(struct platform_device 
>> *pdev)
>>       wdt->wdd.parent = dev;
>>       wdt->layout = data->offset;
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> +    ret = qcom_wdt_get_restart_reason(wdt);
>> +    if (ret == -ENOENT &&
>> +        readl(wdt_addr(wdt, WDT_STS)) & 1)
>>           wdt->wdd.bootstatus = WDIOF_CARDRESET;
>
> This ignores all other error returns from qcom_wdt_get_restart_reason(),
> but in that function it generates several dev_err(). Either make those
> messages less than an error, or treat them as error and drop out here. 


Thanks for pointing this out. I will handle these errors in the next 
version.


