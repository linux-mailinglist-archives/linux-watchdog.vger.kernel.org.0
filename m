Return-Path: <linux-watchdog+bounces-4703-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9008CBDF3A
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Dec 2025 14:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0256D3049D38
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Dec 2025 13:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2F229992B;
	Mon, 15 Dec 2025 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9FvoFQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXvylCe3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED6C296BDE
	for <linux-watchdog@vger.kernel.org>; Mon, 15 Dec 2025 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765803662; cv=none; b=gCMR7/0p3jKiBBUFesbWLmTHqa4KiFZk7b+poZfNiTHHGy6OEiFa/uIzTcIIEBDIxsX1oIN3eF/X29YEi89z14L71dfoIT27F5RvVUmw8WQjCFV6wlZPExco3gND1jz3JIMnbdJmcMFUrg5a6bCVdU62EO8sKdCMC5ZmIXzoxhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765803662; c=relaxed/simple;
	bh=bGeFX1PHslKb/I6pp2SZh4itUTZljDjY9CVtNtdVlOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0Ja6op3BtpqOOMaZDoAsKiqSnjOOlKyf417iGOZ/sZ9FWYoY5MRilQNs83ZIYswUiQKYz4DGd5Ij4kCMMyFYpX87YSYoeMgXJmlSog85CZjJGOEGB5iBqZRKyAUty5IHnpknkb/6SCruuGRhwQ0JS7qeDO2up3EGovqjIuDmG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9FvoFQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXvylCe3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANr5j984997
	for <linux-watchdog@vger.kernel.org>; Mon, 15 Dec 2025 13:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWzLoZ3fbNna6oDTvHfwwszm/4c1bM5VeFkwVbiDZzU=; b=Y9FvoFQd/34/h/6T
	Pthljz6NOcdqHikjysir2IHRMBRSHxuaoftJLndZtTXjOwWI09iy+torM6j18f4i
	iIN9Z+W01shbR6w81z5V0j2Q5FTMR2LQ9daZaoK9A8CbjPdylLC7Xo4cinjor1lF
	nXdTSu0FI4EV1Y3aslTN7JLR4TtpVAhQn+ra+g3lHcNkkljp0PSYFVRE+gC6MnfW
	dkhuTAQvArpdp8b32bz/43DB48ntIF/uZC23NLArNbQjZWhBrpehxopXrtCwtTYn
	GYYBcQHGdPRLsRxtbdSZgTx9O348bKTHAWywByg+fnJSJTct3B7sz3svP2yVMn3T
	svDjQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11a7vk24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 15 Dec 2025 13:00:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f69eec6so32835495ad.1
        for <linux-watchdog@vger.kernel.org>; Mon, 15 Dec 2025 05:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765803654; x=1766408454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWzLoZ3fbNna6oDTvHfwwszm/4c1bM5VeFkwVbiDZzU=;
        b=IXvylCe3EkzkBbNXzGCz62r7C8ryeP9KJqvZH6D8ndyLNUXO9O/p8iwUCYewjbrRHE
         xZSIN2IahYrlRVwJdiw5L0IkjakDKBjoi1AoalkLQrTGA5O/zR8Fwe4AaB+oBV9M29sR
         5sQJ7zxcZ54r1bfv2Xyzm7sePdMt2bMhL9EYBhnZLf6MNPazEyhcyLViKGlUoPg9PXgk
         n1roVAnaSHfhtCDag1Hyx4IlDswLzStYjsWmbMQDLREkQd64RccMSQeevOvpHgpYEf2Y
         cbDQ60Dx2sG1UoyBn73KTiBggza/m4T2KuXPi4StGHLkyw1zXfsor2ewsPtxcerlwNk1
         xtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765803654; x=1766408454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWzLoZ3fbNna6oDTvHfwwszm/4c1bM5VeFkwVbiDZzU=;
        b=EfWSBh2O7kDBbEFT8OZXD7AM1wGhxgF7fZbF5S3GgM/YcCRPmPjR4+/fNVQ2V3vhSM
         HEd3mNhEe9qErap6Z0Aa9J1dA8/n3Gf5Sn1sSELQX2o1HS6QmTzDS9i58MLydj0qpKUG
         F/oiTezNfaXSUFsiaHk5hsXoAKcy0YIAMioz/BmdQBNcXYRm4r2c9biYzyF8iWEiMf7D
         hCWyj/iQVGM13PDh4qv9TIKMVFyD5j2KyzxUhyEAPe/32frjiTkW7Zm4kZqdZyAC4NqU
         Q/HdqB6ujmJZrIxdfW5yCi8aDdJIH3vVqEk4WokYRiQ0uKv9VhRNZFZGcycX/IF7XIcM
         B1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnMu4KHioL7ISAcKSNi7PbiAa8H2tF0bfFVsXxT3brjLlLoxuPjJu+Oib7W+skce6bM8VMvSkT3a9YBzvYTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywml08M9BCEdmw+wzht5F7WBI1qi1SkEdbhidzm39QZfS/01F5w
	NoMm/QOQ0oYiV1Hgq8isGVZMEMrJHQ+6AYEgau+ABy2qBDXR+SlcpDdS3AAFXMHSHA6/2ypqEjZ
	Ig8Nkr5yPw0bQ7ni3HQxkBO8VCpF342a114pkczgaziIltV3ONy4evf5XgJt2wXc59moIHg==
X-Gm-Gg: AY/fxX5VPwOqbQuY6rBK7G0JcYCea2TzBB/jRSP5HCeahtCgnVDf6bAt6zShkYacNZy
	xgEEGCPk/LRQfz/s/4/2I2TEI8YhSC5TetTqBE7//m0JMukbm0Vngnr/RWjhjQx0S5bKAxw4M0X
	xWoDXns4H0tBeGPJ3MjuoP2eSiiJ3WKoigWXc4kZxTIj9wuSxx+tz6VZMrjkZnUfVKC8Qd2gejx
	esH4CwNly85vgfgYJ9st/0NveizofU3E5/iVc1tcNOcl+px3HnflbGXCz3rPHRXIfxDltLKXkAx
	Q4bSbtdYfeatCcdXr6v3D0ezrI89VKuJDd7ZX3UDTKBgR5bEN80uuhBg2Yf8BA/Gboq6fpsiHZA
	8uaRBuiukE5ydqODULaJMnQAFlEhFQRRg4VecAXt5hZSDsTT/lhISGxaKNyncLeg2FhJrooypBP
	nl8nGbqrksB2iHPkUGvEfHAoHb3+WE/TCP
X-Received: by 2002:a17:903:1988:b0:2a0:ccee:b354 with SMTP id d9443c01a7336-2a0cceebca3mr46641865ad.35.1765803654157;
        Mon, 15 Dec 2025 05:00:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrz1GbG2GulNcHY2p0JDhisa9h4HGD51A2Jm2Vs7BYkvVj/IS8tR0gt8HDA+qn2x76f6/Cbw==
X-Received: by 2002:a17:903:1988:b0:2a0:ccee:b354 with SMTP id d9443c01a7336-2a0cceebca3mr46641205ad.35.1765803653570;
        Mon, 15 Dec 2025 05:00:53 -0800 (PST)
Received: from [10.190.210.122] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea04101esm133447405ad.70.2025.12.15.05.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 05:00:53 -0800 (PST)
Message-ID: <43e48560-2848-4474-b858-a3d15944e2ee@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 18:30:47 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] Add support for Gunyah Watchdog
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
 <6a8f5d62-f6ea-44b3-9baf-acfbc1e58efe@oss.qualcomm.com>
 <992d46b7-b053-4a9e-ba04-f5653525a891@kernel.org>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <992d46b7-b053-4a9e-ba04-f5653525a891@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDExMiBTYWx0ZWRfX1A4n6fKsxRE8
 UvyF5PVg+tQWrNz0MpoFpkhs01cFANzNAX4bpm2gc4bFkMVgJ6rjckvgNvI9Yw9j8yJJwFiTzUD
 /JvvUPUvzrOzfG54I9QKhWzBwXUqkgkOoQWpab2k6gjeY7i0M05f63hoAssuS0VHbfW53LzYzkG
 gzLQuNgHgo2A4qyLrqCvcGBV87+nu19MBIcS/a12ZDOmc6sK4Sda+cc3alzhDk5Hh9ju/dUZhoc
 BbIqiiDJ5zP+6hJZp++MpQ6lMTMaHZpJuxF4SuusXZ6YEuPVsIvWlJOctA7nubdiny2RDdrpfj2
 ZB6y9k2/3scrDgRERjSCWfEYqJZVtvJryrnmdmitUWZHPu7nQBqHZ6C6FvLDJof0KSk1j5kP15n
 tY64d53ret4qRKC9eVnAXcnN9UXyHA==
X-Proofpoint-ORIG-GUID: K4eX-GluWZCfrWPrn32AUbcBsaWiVQLN
X-Proofpoint-GUID: K4eX-GluWZCfrWPrn32AUbcBsaWiVQLN
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=69400687 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=S4oPqir27zQB1GLfsjsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150112



On 12/2/2025 9:29 PM, Krzysztof Kozlowski wrote:
> On 02/12/2025 12:23, Hrishabh Rajput wrote:
>> Hi Bjorn, Guenter, and Wim,
>>
>> Just a gentle ping on this series.
> 
> It's merge window. There was no point in pinging just before merge
> window and is even worse to ping now. Nothing can happen with this
> patchset and such pings is only noise.
> 

Thanks for the guidance and apologies for the noise created during the 
merge window.

>>
>> Since the patches have received Reviewed-by tags from Dmitry and
>> Guenter, I wanted to confirm the merge strategy.
>>
>> Bjorn: Are you planning to pick the QCOM SCM changes separately through
>> your tree, or would you prefer the whole series go through the Watchdog
>> tree?
>> If the latter, do we need an explicit Acked-by from you for QCOM SCM patch?
> 
> Where did you document dependencies between patches and any non-obvious
> merging? I open cover letter and there is NOTHING. I look at patch
> changelog and also NOTHING.
> 
> So if you tell us nothing, why would we care to think we need to do
> anything special here?
> 
> You must explicitly document every dependency, both external and between
> patches, in the cover letter. At least cover letter, some people (e.g.
> mostly me) don't even read them...
> 

This is a miss from my end. The following information should have been 
the part of the cover letter:
```
This series spans 2 subsystems and is split as follows:
- Patch 1: QCOM SCM - Register Gunyah Watchdog Platform device
- Patch 2: Watchdog - Add Gunyah Watchdog driver

Dependency:
There is no build-time dependency between the patches, but Patch 1 is 
required for Patch 2 to function.

Merge strategies:
- Strategy 1: Take both patches via the Watchdog tree.
- Strategy 2: Take Patch 1 via QCM SCM maintainter's tree, Patch 2 via 
Watchdog tree.

Since the patches concern primarily with the Watchdog, I suggest we go 
ahead with Strategy 1. If this is acceptable, I request an Acked-by from 
QCOM SCM maintainer for Patch 1.
```

I understand that this should have been a part of the cover letter. If 
it helps the process, I can add the above information in the cover 
letter and resend as v9. Since there are no other fixes, v9 would only 
contain the cover letter changes.

Thanks,
Hrishabh

