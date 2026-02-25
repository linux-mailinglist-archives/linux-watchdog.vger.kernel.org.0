Return-Path: <linux-watchdog+bounces-4984-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNJUBbXdnmkTXgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4984-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 12:32:05 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAA4196861
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 12:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15FBB300DDC9
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Feb 2026 11:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C1D19FA93;
	Wed, 25 Feb 2026 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kx0SZLFy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAPF25ln"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE04393DD4
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018919; cv=none; b=pC/9pF3AYj6ULBOOjT0ea3mFa9n1g9yT1tE4qXYoxTPY7w5ECP5E/i4naYrA5psJvR2KNPc8CuzUEcqPW5otaba5FdvB84jLF+7GAocfR3CAJzPtI1W7aKJRwK8AOtXx2Ij6f0MRyqUqBE+RyYMWvW5MAFzKx3cDBZoaWxIkNM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018919; c=relaxed/simple;
	bh=19w615IskjE5TCjnvGG3ZbxMlnmV9tvKUkDfVUlxM4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKlqvmfLTmCCT/PWi6HbkRNgfC1hTAw5uAtkhuqdlAXHwKIilda1P1DAcMnsJUWtTtvUCRq27TRb+kcld7e7zsytrn+aFzkflo2oBwyz9BHVBwh577P8BZ+sPJ3NLHuZ6g9A4VycYBxtKYW9Dld7d7ww5U7oMTwu+CU6E4/Dc/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kx0SZLFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAPF25ln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3RrS1512069
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 11:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CByXCvN4Rqtl+FBdMITE6H+cYmdBCI6IUx2Z2zsQeog=; b=Kx0SZLFy9UL3geLb
	7znk2uXL0IpV6Qsb2XFefgUjKTFWVhCpKkEiCCU5rR6569Ma8gPVWiGrHANK6wnA
	hoFD7VYqi9r4S58NLRTqPXwHvMp5nKi9zyrOk+pndBqgBZCmZn6hEz0GZJ+xADnF
	9x+CVmo7lP+8qzuUIuR88KiRj8q3iTVdYnAO6Xaqf4ZJNoOLnm2TGcoosf1dDcbA
	DKiXiDr32M1reG8uJ4RXyTiR5hrQiby/DxrtRI9c5VikjJYSDKhHi3g/36RlDSBM
	V9/SKzq901g+RsLi/E/HEmlhsFWulSLIJVylBII8dzAh3/t7RUG+n58ew66Fd5oc
	SAK1LA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf01t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 11:28:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70f137aa4aso156077a12.2
        for <linux-watchdog@vger.kernel.org>; Wed, 25 Feb 2026 03:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772018916; x=1772623716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CByXCvN4Rqtl+FBdMITE6H+cYmdBCI6IUx2Z2zsQeog=;
        b=PAPF25lnD3DbpiF8tTIV8Gjqz5cDzI9W60+pnIkgyWYZxS9wRv9edKluOCGWmjXKsr
         jRqk+zboUvgnjUuuS+YOWcCyjgTtoJcY4FuGiXIEooJbEaTG7LDIZ1+enwFjq2rScsAW
         ss+guy9xNB/Imfd2fcFeYuZDe48EeyDjJm+ZWC8paTFu0oB06QbyLLE5jgZxy6Urdg52
         GT3YHzPlwbw+2ZfDNDtXiUO0lcfirVGcT+YUrCwLx1sWy6/zTHSd2GyvGe2sN5NOjCCC
         3/cyLtv5DbnmEQeZ1q8Fgtc6ZcHQh/oP5/HVBPAhhzWniCzsw+ibWisxQOJ2k3kLjC5j
         PCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772018916; x=1772623716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CByXCvN4Rqtl+FBdMITE6H+cYmdBCI6IUx2Z2zsQeog=;
        b=ZUWKeM3zeebwgnmhr0kZMHwIqNxvVObK1GjivT58cnt2nSci+Kjv1MRwyvLgMye2lR
         wuGdjiiWtZEp11k8M3NpvTe2uSb2lw2YkubXYmkBvxTsLZPdu9svfqyTYRStOS/tA7yi
         z7tA58L3VWTBmGaDZTWOnE1YPuWdXfWlzefSy0zln5vcP91zCuYCbdmDkud6xZLx6BF9
         2WD8YoOYlty7dnjodtLWKBP/BNSImCVkN/OVmWZ7q6yqr1Vmj+EksYCsm94ODh6cqRn9
         /Evwoc9vXM0IEMs5H0t3aY8AoAYOdLZh3ekI2yOXYrnN9G6Kgp3Obt09yUXHSPMB+N62
         15oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe+0b/294HMpE96D0K4xDWygJDDrIL+JLeTR+hbnR2l+OxKg5g1pziMjmh7GlbQurRF200J6L5yYjbvLv4mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVnflQdGbPKOn78QPCUNYScgd8b5vYReaIsyURUd68TT5I+SVS
	6aHESyr61HWUgouarXd6MBafLC3O6eASriZZa/xv3PFOUCiyr78G4SNtYAeoxKvveZVW1dagTUY
	4ewkhILDIvT8XruL+p/AQFLByTRg43fb2kulhq0YGDxwcZzHkww1HBvB4urfOMA0ul1ChDA==
X-Gm-Gg: ATEYQzzTz1+NNFcFzZMwXyALQCTZjARXsh04eI1sTunMLOQdA0Y8Uajrys0kKXWdSig
	+xfKyAZD1Klnb3ucZ9yXz7ytsjrUE+JqOFjif2cpQTnN1uRNGkYBh6HMOeok3gn8LUEv+Bg6x3V
	i9+K84EREMp0liFbnpZlh4fGKqE0LiKA4sHmRKw2zJAlusQazBhXHNp1B7qoo21WBdTep1uSE9+
	868X3I8X3b+tySzrRRb6Wy+YNx6uyts6pgBiT8Mir6NM3alBBsF/Q1ORfGOzARkzJJYPgitaxbp
	KKoLZctBmlr8AqTrkgTiOppioGSH5Po5XvXzOOa5wuzuteOw01ZREkS6RPhMAyH3upoppliafTg
	I+LuWBaQeWfxamYB4HZOv/CLu70kPBzVPidagrQr7xqeIJThG3GAxMJXez79ZdR24
X-Received: by 2002:a05:6a00:2d9b:b0:824:92b7:63ac with SMTP id d2e1a72fcca58-826da8d75e8mr12374525b3a.13.1772018915994;
        Wed, 25 Feb 2026 03:28:35 -0800 (PST)
X-Received: by 2002:a05:6a00:2d9b:b0:824:92b7:63ac with SMTP id d2e1a72fcca58-826da8d75e8mr12374508b3a.13.1772018915504;
        Wed, 25 Feb 2026 03:28:35 -0800 (PST)
Received: from [192.168.1.7] ([122.164.81.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd68998bsm15318534b3a.16.2026.02.25.03.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 03:28:34 -0800 (PST)
Message-ID: <cbb7ba3d-2b75-47e6-ad46-c37f1dab7fca@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 16:58:28 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
 <20260225-wdt_reset_reason-v7-1-65d5b7e3e1eb@oss.qualcomm.com>
 <20260225-purple-rat-of-blizzard-dafcd6@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260225-purple-rat-of-blizzard-dafcd6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D6Be_wi9pBtN25_xGIF39fX0dHZlmxnY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExMSBTYWx0ZWRfXyNvGJL1ppEiP
 WQ15svqdTeFdg1IyHq7/L13GVCBV2UhFErvHV4PeyKUodx+fB+5AHb0YNpSzsbC/vtbyXu0fuAj
 jcLvU8afDqcDHix6Un6l66et7KqYKMotCAq5s4VaL9BqjMbCUZdE8bHgJhR9qo+qcvvZsghreJx
 T0u3aVR618c9g1od7M0NUtPk/AHlQWe9amsyb2vC2nqKQQ1jsx8i1KAHgzY4HSB96JL/aaYUtnW
 steYXA1+DSXJ/C9BOkPdfmYHmGLah3YOWdKPodPkeOjCcws3V9JUIUPJX1N5vJjNPE9lS32daM6
 /1OLCjlf2LBOLud1fnSW+IJqhM0G9oTJx/XfHBhvup0cFcVQIdxJBDZI3dc42oyA+kawqreTMbs
 v/ZyW7u9I1XOenX+pfYcqsl6E6In7YsnAYd10z0V428BYXo+0wRmmVjJFU3cutUQau1lVIxYyUz
 bAdoNJnkxG8tPcC+KRg==
X-Proofpoint-GUID: D6Be_wi9pBtN25_xGIF39fX0dHZlmxnY
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699edce5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=mNPf3JdYh40LbGEelsvk6A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=uv-h1xUkWEa4x-JB8yoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4984-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EAA4196861
X-Rspamd-Action: no action


On 2/25/2026 3:43 PM, Krzysztof Kozlowski wrote:
> On Wed, Feb 25, 2026 at 12:13:10PM +0530, Kathiravan Thirumoorthy wrote:
>> Based on the discussion in the linux-arm-msm list[1], it is not
>> appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.
> The reason should be here. I asked that referencing 3rd party resources
> is not the same as providing the reason.

Sorry, I misunderstood your statement. Let me rewrite as below. Please 
let me know if this is okay.

"IMEM shouldn’t be treated as a syscon or simple-mfd because it’s really 
just on‑chip SRAM, not a block of control registers or a device with 
multiple hardware functions. In reality it’s just memory that different 
pieces of software read or write. Describing it as generic mmio‑SRAM 
keeps the model simple and closer to what the hardware actually is."

> Best regards,
> Krzysztof
>

