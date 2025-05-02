Return-Path: <linux-watchdog+bounces-3424-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D9AA7752
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 18:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B7214E2A90
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 May 2025 16:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B9E1D90DF;
	Fri,  2 May 2025 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jr8hSbse"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691D257440
	for <linux-watchdog@vger.kernel.org>; Fri,  2 May 2025 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203476; cv=none; b=MEvL052xD4HuuTzTp8fzvAdyksuikJ7BSns3vprSN37ukiI/pRZamjOrhzHlry91qD9QJv6fRisjNWpI6Rgyi3QkMTklhsCHu+r1DFlKWYHcpZUAfWGxMK7HRMpACDs5QS8k11pj1yTKVUFrbNrPOVZf4hljgddGrGtNhvTaBqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203476; c=relaxed/simple;
	bh=HfhrNn6qbcYUoPHjEUu/qbSmHEO8TLmjIKVCSB/6Hz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q601y2Qf4l1FH9jyuSWTTgae+sm6t5SRLYsIAYYmw3d6mngcN67S0/GyrxhQ1AXMzYPUfrVF2oOGvLxVjbVVn8Y/TEWuivtdnBg5xDGUSlRlai6SHOGeUcv8x0gYIIUgL2l2Up9FihWSe1hkAy9mwIEJy0Y5bZk2botbwKXPPA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jr8hSbse; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DeP5i015020
	for <linux-watchdog@vger.kernel.org>; Fri, 2 May 2025 16:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtXRYG9Q5qrj8myubAvBaI3Oe8aAUXM6QH1Fw8r6toU=; b=jr8hSbseZYhk5GDK
	eCuf6SvK55ZwCkZniRU+ObTIGXCxY21vMQDvrklXPN2qqZJ92AwR6bBX0SgIQF4n
	z8KOBR1XjtxADECTzZ2iCgFyaKE2RhxQ+NmqHkBk7bsdKmoGhyqNvMT8S+iUUkth
	Lvi1X6TbcqbpmFolEAMPlscvuDkOjWdE43J/4r2Vy3ipr5pVWNSFXE3z5MtDTozh
	K0kNv4CE6FjiaANQGmJa2dfEPME4O0+F+KfC2x6DrSvoSz/974P7ouYZCiqYYhMC
	ZDocXhHZS0XXFDVXijElGCc5JYh/7606Emgcy7s59j5o+zYFTLrKNIp8NMF55z8B
	gqieAw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0ss2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 16:31:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736d64c5e16so1872515b3a.3
        for <linux-watchdog@vger.kernel.org>; Fri, 02 May 2025 09:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203472; x=1746808272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtXRYG9Q5qrj8myubAvBaI3Oe8aAUXM6QH1Fw8r6toU=;
        b=xDOFdJT3E8Lef0pcmprkBeZPTdmmHzbouYe1VcRg0WVgeLpJRqKKH4f3RZDE7rIhYc
         WqGNpFIW7RDBbSFZLqVxnaQNTnEBncHrQFmPZsr0YmDhq7170OFykG4QkKQt44wJoUNs
         L5I3r6R1aE9BqUlOJFzgE9TLnTa863PojTSOiNbJL21N6ZG0+4HAlUhKyVRzX2XLYZ+7
         Y/OgPzEO2DgqBoUbs2LrxjSevXl1P5lvPeG/aaauEx1EgTf9Ywi9qnH3GJ2sgKm8ei9I
         ERX5LTvsQrtuYQc8zEanspZpObHeh1D5FUxaQKR/JGbbbIqCUHHQ7lKc6eUh33O5AwSl
         8EMg==
X-Forwarded-Encrypted: i=1; AJvYcCUwCSeRropFme8UJdUDDcVSXEstybUP3PfQPLUg6hDY+vCe57x9p76mJZvJPNB7bq5aLy/Mf2q4em/DYo+v7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye5XhT6MUqX7uNlRgFb32/4XqAbM5NDILw0PjLAFtMj6ZHFxem
	sjHTRQjCKjjebJkHx3HBVknU32yBkCxSrv9FjA6nqXcxUQ0Ctq5ZvKuHCUDFzx2CETC0FiBVJrh
	bbwDM29Y4++JtS3KtdmN5da2bO7WG2E3vXG7EbsOxwdnE/8S0OrRbOm93wRfFy3Au4Q==
X-Gm-Gg: ASbGncsPWSYG6JkWlZP1W5B6oh8BhuMmGyQnyeo7Bbg9kH1225TIUh1T1GLDL0rsM1/
	qDrFC6jCyUjxoC9IiGiOXDCtQDRFyOVIKxLTQ4VdpmnjpiCh952sAUu60du2D/I/JaQxXN5pqWe
	KmfNvVji2W7S/CZ9QuQW8ipYlwPhuFI43gClrNlkW3Ush8iKYWjH87hoWCkPOOrvzGcY4FHUyuh
	nFxJHsIHAZNhw4G122GhU/0PJ9UjoOSgt76lqJkCYuU7FDIlPkLSv6xzHblKsH9M3NLtK5ZkyeW
	mJJU8e1lT2ktMot9EKuQreVVTyD1WAr1LyfEUZfa4bg/vjsWKDwB
X-Received: by 2002:a05:6a00:1c9d:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-74058b25d87mr5417126b3a.24.1746203472647;
        Fri, 02 May 2025 09:31:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb54Eg6fwcaKmb+QzmXQ8iGK/9mI8N87y3T04YynY4pAo54pLrPvinNqZ/362AoLpwlYrDpQ==
X-Received: by 2002:a05:6a00:1c9d:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-74058b25d87mr5417076b3a.24.1746203472209;
        Fri, 02 May 2025 09:31:12 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb804sm1839193b3a.52.2025.05.02.09.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:31:11 -0700 (PDT)
Message-ID: <c2b0b0b3-6fa9-46b8-84ef-81314965848a@oss.qualcomm.com>
Date: Fri, 2 May 2025 22:01:06 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <gmoe3ykmns5hmmz6hdyxgzxiejb3nycghhvt3pgjysq6xa2zni@wpqyuz2pj5vy>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <gmoe3ykmns5hmmz6hdyxgzxiejb3nycghhvt3pgjysq6xa2zni@wpqyuz2pj5vy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8hpkm60ms2FIDqo3ArzgBByMBs_uopTU
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814f352 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=sAsrsCsg_48icDTAn_UA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8hpkm60ms2FIDqo3ArzgBByMBs_uopTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzMiBTYWx0ZWRfX36ipSYSQhTYd RxGmzvN2y2uElurQRZHnwt/I6KETxieKYvvF7flXWD06GbWOxO3FKkBOXY19xTZ5W2zSq3X1UNt 01QjgWNC6G+9CgcGTN3hvhHHDm4SXl7NSRS+HY1N55x4J34MbxXeqTGOc4iYIDoNgU2F+5K6ygZ
 X54wxbvA55AUnrN3AvA6+mFudxGD/Uo1rYvYk4CAguksGMRrg6navFSH3mfleVcRY8LHwh77+ak 88kdzb3OYo57rh7zxIyEEWSrBcQaQED9iPp8yRhAg5nUa+vJiFgIZUgVd8/W551Of61Ds3UZmmY BuKFzrl0NiMy1gJvwZoKrIelS9jg5UMvpMohfQp/zh6+7h1Zz23sPGmr+RCwUS9owWyfLj3FcjL
 YNamiDoTFke82voTdiO9q3L3tRBw0tULg0S33jzYXwKnH0UN1tuTWYjGG12LqZCy1b6gENRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=876 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020132


On 5/2/2025 8:24 PM, Dmitry Baryshkov wrote:
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> +					const struct qcom_wdt_match_data *data)
>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>> +	if (IS_ERR(imem))
>> +		return PTR_ERR(imem);
> Why? Just pass the syscon directly via DT.


Ack. As replied to Konrad, will rework this.


