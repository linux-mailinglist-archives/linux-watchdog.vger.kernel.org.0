Return-Path: <linux-watchdog+bounces-3321-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0BA913E3
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Apr 2025 08:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 091C97A4484
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Apr 2025 06:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501D01EDA22;
	Thu, 17 Apr 2025 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMbZXpsj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCEA1A2554
	for <linux-watchdog@vger.kernel.org>; Thu, 17 Apr 2025 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870773; cv=none; b=V2ga9tnX/Xrjra5tUHeyiE02qKVoomYAuS43tctU+Uy0Ov648prn2TMtGkRH4I0tvROtV+xTRFOj3QD8mBtSMwplN0iyIx98l5wKvGlfsCJS5V3IhfvqSMfPeTkgHZ1Z7mtPLlXq3hlsucE3ZoiQPXAEdwDZKaE3qNlcJhx3Jig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870773; c=relaxed/simple;
	bh=4SaNcvRSUmw17peZENYtXe9a5+FLCzXbF63BdifSfFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmtpRVKuDDbnWljS47eGUKXQ3wleeDX/OtWnsVYH8gMIt4f9qqfyEmJCYcKunjCDuK4nk+j5jxBt1c9w/t1KbJkjHyoLkKcqEweh/rtE2cidgZV60kz49FqBgazdubU0eTBnPx3bEv1bQ4vbQUmqb8seb5LObS2qvDaQeSjEwr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMbZXpsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lcXP022725
	for <linux-watchdog@vger.kernel.org>; Thu, 17 Apr 2025 06:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmyWTVfTvdIgm61cHoCvvxTKB4qtt0R/AYVgAU4T22c=; b=gMbZXpsj2/M068/p
	4ruAl7VtuWgK1C67UJP5JHGrIKlSr3/lwG50WvRBhPlcS5GmolnQQHzAX/EI6e/n
	/2h/iEhM3XNTqM0+fbevxZapo+8BFSaWDga4CX05I4GD5lQS42EyR770jLLv6hIP
	DKA8SJVNFA/A/SIJhUpeQjQqOTqUlhM8Y5PvNXkveEOp3RID23JtShhc0Lzvi4kj
	j2KeMze3y1lWAPC7hOyF4Ygb+X22YHAfhF59nAih5SLxcwifcBe4NZSFKONJ4OGJ
	6JahJJv+yCh6hH2yyF5KjLTiFejNxhry5nnrzaIsMCWAxPjBrXHfdEvQycdPeIm2
	1MdNYw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpwnv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 17 Apr 2025 06:19:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-896c1845cb9so465370a12.1
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Apr 2025 23:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870770; x=1745475570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmyWTVfTvdIgm61cHoCvvxTKB4qtt0R/AYVgAU4T22c=;
        b=GuiCDJ/doRfC9r3W2PDP6iGmnRIBFs/9/ubervLC2BjEOGSqa5u7e4W/jJu0d+4jK5
         DDhevG56mSSI2/eBWtX/gmuYiJPrDbC5Y8KkNDnsF1yMVquCkOGs5UJ3fa38nWd3PdDV
         qRuK765E4eDHwgu7Erj/bPVK7uN8p7AbmRNf3KwICWXMY9GgDBffsJzdYIKAugPofcK3
         Zu1qeRPJD+zSc9djZZDKuK2Nu9QckAfGkLLMk6L64r0SIQb1AywDbloZhC2qA4UXDAY0
         JGApuMmK7rKwV8/bsycwkLSU9I3cycLROf6BoP1ApHoUAUjuy86hikVfET+iR+m4ZOVf
         lbTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVCKRCQoSemxdupzL71/kFl7Jd0SZyhDls4vCh4u76Ux5CSjQqCut6g282y78CI5+3WEtiNeJOr4czhBI5cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUEkhqhEBl0YswK9UfKU8IuNbwuceMpk7V6bB0EqH8DQblTQTb
	PC5LV6wwTctvfQgg8/nL8DH3ispRSIFmNAH+gOLtJmhrbuDu4xvMc1tJrLV2xIIbx8j2DEhOh7e
	nTyshSVbeib+eC01z8jwIUUNi4becJW665ClhM9AMxFLHlt/wHZqfM1GCTjkO/TPZ7Q==
X-Gm-Gg: ASbGncvE6MSr1cmOmidYPpIj5lrfEYZ+l+52CWoFW0e9MaxkWFmLYC5Q/aCfi6YQzxp
	A4cC66fzOofYm2ntetw+8515n9P5M3x2SD1EmpjckgJCBCs5tlX1Pb0+mnPdGtvOqyZebQbnREG
	9dXUFzMvQBx1r0NDj2uK45FTKGx1MYKou+01kfUzecAsErNCdLkzmpF3CmRmu11BGl0KlzOn4Vk
	BYDPvAs4Xw9TxbM4Fk+y4OTKT6JRX5+xR3OJ2mVPNnaLyrK2iDQYvonq9WDaugB8ACKGcSpMa5M
	nGYlbRE6ngpeD2RxweJRc3PwV5l8w+lbJ9OK2zfLgR96Z7EcE330
X-Received: by 2002:a05:6a20:3950:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-203bdf7c2a6mr2467365637.1.1744870770136;
        Wed, 16 Apr 2025 23:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfR2q7EsCzAFAh2c6ykwdluIfy3j4GXbBtHOsR6AYzf219xIeMD/6Dxz9o4TroUZTIXvTXfA==
X-Received: by 2002:a05:6a20:3950:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-203bdf7c2a6mr2467330637.1.1744870769786;
        Wed, 16 Apr 2025 23:19:29 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220fd37csm2326166a12.44.2025.04.16.23.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 23:19:28 -0700 (PDT)
Message-ID: <0a774c34-e82d-4ff0-aa3f-4f348f4c2296@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 11:49:23 +0530
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
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <4e9621c2-f347-4cba-9422-b14f96ee4c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QzuD3Sbd4xUdcuWkOAAiecXLZEajm3i4
X-Proofpoint-GUID: QzuD3Sbd4xUdcuWkOAAiecXLZEajm3i4
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68009d73 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=it6VRh0H-s_lwkDzcJIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=991 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170046


On 4/16/2025 8:21 PM, Konrad Dybcio wrote:
>>   	.max_tick_count = 0xFFFFFU,
>>   };
>>   
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> double space> +					const struct qcom_wdt_match_data *data)
>
> Please align this


Ack.


>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->compatible);
> I still think nvmem could be better here, as it allows to plug in
> more magic values


Sure, I will be on vacation next week. I shall check on how to use nvmem 
here once I'm back.


>
> Konrad

